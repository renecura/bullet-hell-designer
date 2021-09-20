extends Node2D

# Parámetros
export(Resource) var funcion: Resource

export var base_speed: float = 100.0 setget set_base_speed, get_base_speed
export var time_scale: float = 0.5 setget set_time_scale, get_time_scale
export var spawn_frequency: float = 0.2 setget set_spawn_frequency, get_spawn_frequency

# Variables de inicio
var timer: Timer

onready var spawner = $BulletHellSpawner as BulletSpawner
onready var start_time: int = OS.get_ticks_msec()

# Funciones de gestión de tiempo
func _ready():
	timer = Timer.new()
	timer.one_shot = true
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)
	
	get_tree().create_timer(1.0).connect("timeout", self, "_on_Timer_timeout")


func _on_Timer_timeout() -> void:
	var t: float = (OS.get_ticks_msec() - start_time) * time_scale / 1000.0
	
	spawner.spawn_bullet(
		funcion.value(t) * base_speed, 
		Vector2.ZERO
		)
	
	timer.start(spawn_frequency)


# Setters/Getters
func set_base_speed(value: float): base_speed = value
func get_base_speed(): return base_speed
func set_time_scale(value: float): time_scale = value
func get_time_scale(): return time_scale
func set_spawn_frequency(value: float): spawn_frequency = value
func get_spawn_frequency(): return spawn_frequency
	
