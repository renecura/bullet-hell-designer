extends Node2D
class_name Weapon

export(Resource) var weapon: Resource

export var base_speed: float = 1.0
export var time_scale: float = 1.0
export var spawn_frequency: float = 0.2

onready var spawner = $Spawner as BulletSpawner
onready var start_time: int = OS.get_ticks_msec()

var timer: Timer

var body: Node2D

func _ready():
	timer = Timer.new()
	timer.one_shot = true
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.connect("timeout", self, "weapon_shoot")
	add_child(timer)
	
	if weapon:
		get_tree().create_timer(1.0).connect("timeout", self, "weapon_shoot")


func weapon_shoot() -> void:
	var t: float = (OS.get_ticks_msec() - start_time) * time_scale / 1000.0
	
	spawner.spawn_bullet(
		weapon.value(t) * base_speed, 
		body.position if body else Vector2.ZERO
		)
	
	timer.start(spawn_frequency)
