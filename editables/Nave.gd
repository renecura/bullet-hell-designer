extends KinematicBody2D

export(Resource) var movement: Resource
export(Resource) var weapon: Resource

# Movement
export var movement_scale: float = 1.0
export var speed: float = 1.0

onready var trail: Line2D = $Trail

# Weapon
export var base_speed: float = 100.0
export var time_scale: float = 0.5
export var spawn_frequency: float = 0.2

onready var spawner = $Spawner as BulletSpawner
onready var start_time: int = OS.get_ticks_msec()

var timer: Timer

# Internals
var t = 0.0
var c = 0.0

var origin: Vector2

func _ready() -> void:
	# Movimiento
	trail.set_as_toplevel(true)
	trail.z_as_relative = false
	trail.z_index = 5
	
	origin = position
	
	# Arma
	if weapon:
		timer = Timer.new()
		timer.one_shot = true
		timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
		timer.connect("timeout", self, "weapon_shoot")
		add_child(timer)
		
		get_tree().create_timer(1.0).connect("timeout", self, "weapon_shoot")
	

func _physics_process(delta: float) -> void:
	t += delta * speed
	c = t
	
	if movement:
		movement_process()


func movement_process() -> void:
	position = movement.value(t) * movement_scale
	position.y *= -1
	position += origin
	
	if c > 0.05:
		trail.add_point(position)
		c = 0.0
	
	if trail.get_point_count() > 500:
		trail.remove_point(0)


func weapon_shoot() -> void:
	if !weapon: return
	
	var t: float = (OS.get_ticks_msec() - start_time) * time_scale / 1000.0
	
	spawner.spawn_bullet(
		weapon.value(t) * base_speed, 
		Vector2.ZERO
		)
	
	timer.start(spawn_frequency)
