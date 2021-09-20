extends Control

export(Resource) var funcion: Resource

export var movement_scale: float = 1.0
export var speed: float = 1.0

onready var nave: Sprite = $Sprite
onready var trail: Line2D = $Trail

var t = 0.0
var c = 0.0

func _ready() -> void:
	$ControlPanel/Scale.value = movement_scale
	$ControlPanel/Speed.value = speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	t += delta * speed
	nave.position = funcion.value(t) * movement_scale
	nave.position.y *= -1
	
	c += delta
	if c > 0.1:
		trail.add_point(nave.position)
		c = 0.0
	
	if trail.get_point_count() > 200:
		trail.remove_point(0)
	


func _on_Scale_value_changed(value: float) -> void:
	movement_scale = value
	trail.clear_points()
	t = 0.0

func _on_Speed_value_changed(value: float) -> void:
	speed = value
	trail.clear_points()
	t = 0.0
