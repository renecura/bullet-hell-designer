extends Node2D
class_name Ship

export(Resource) var movement: Resource

# Movement
export var movement_scale: float = 1.0
export var speed: float = 1.0
export var show_trail: bool = true

onready var body: = $Body as KinematicBody2D
onready var trail: Line2D = $Trail

# Internals
var t = 0.0
var c = 0.0

func _ready() -> void:
	# Weapons
	for weapon in get_children():
		if weapon is Weapon:
			weapon.body = body
	
	trail.visible = show_trail

func _physics_process(delta: float) -> void:
	t += delta * speed
	c = t
	
	if movement:
		body.position = movement.value(t) * movement_scale
		body.position.y *= -1
		
		if c > 0.05:
			trail.add_point(body.position)
			c = 0.0
		
		if trail.get_point_count() > 500:
			trail.remove_point(0)
