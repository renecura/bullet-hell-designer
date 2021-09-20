extends Node2D
class_name BulletSpawner

export (Array, Image) var frames
export (float) var image_change_offset = 0.2
export (float) var max_lifetime = 10.0

onready var shared_area: = $SharedArea as Area2D

onready var max_images = frames.size()

var bullets : Array = []

# ================================ Lifecycle ================================ #

func _exit_tree() -> void:
	for bullet in bullets:
		Physics2DServer.free_rid((bullet as Bullet).shape_id)
	bullets.clear()

func _physics_process(delta: float) -> void:
	
	var used_transform = Transform2D()
	var bullets_queued_for_destruction = []
	
	for i in range(0, bullets.size()):
		
		var bullet = bullets[i] as Bullet
		
		if bullet.lifetime >= max_lifetime:
			bullets_queued_for_destruction.append(bullet)
			continue
		
		# Move the bullet and the collision
		bullet.current_position += bullet.movement_vector * delta
		used_transform.origin = bullet.current_position
		Physics2DServer.area_set_shape_transform(
			shared_area.get_rid(), i, used_transform
		)
		
		bullet.animation_lifetime += delta
		bullet.lifetime += delta
	
	for bullet in bullets_queued_for_destruction:
		Physics2DServer.free_rid(bullet.shape_id)
		bullets.erase(bullet)
	
	update()

func _draw() -> void:
	var offset = frames[0].get_size() / 2.0
	for i in range(0, bullets.size()):
		var bullet = bullets[i]
		if bullet.animation_lifetime >= image_change_offset:
			bullet.image_offset += 1
			bullet.animation_lifetime = 0.0
			if bullet.image_offset >= max_images:
				bullet.image_offset = 0
		
		var ang = bullet.movement_vector.angle()
		draw_set_transform(
			Vector2.ZERO, 
			ang, # Angulo está mal
			Vector2(1, 1))
		draw_texture(
			frames[bullet.image_offset], 
			bullet.current_position.rotated(-ang) - offset
		)
		

# ================================= Public ================================== #

# Register a new bullet in the array with the optimization logic
func spawn_bullet(i_movement: Vector2, i_position: Vector2 = Vector2.ZERO) -> void:
	
	var bullet : Bullet = Bullet.new()
	bullet.movement_vector = i_movement
	bullet.current_position  = i_position
	
	_configure_collision_for_bullet(bullet)
	
	bullets.append(bullet)
	
# Adds the collision data to the bullet
func _configure_collision_for_bullet(bullet: Bullet) -> void:
	
	# Define the shape's position
	var used_transform := Transform2D(0, position)
	used_transform.origin = bullet.current_position
	  
	# Create the shape
	var _circle_shape = Physics2DServer.circle_shape_create()
	Physics2DServer.shape_set_data(_circle_shape, 8)

	# Add the shape to the shared area
	Physics2DServer.area_add_shape(
		shared_area.get_rid(), _circle_shape, used_transform
	)
	
	# Register the generated id to the bullet
	bullet.shape_id = _circle_shape
