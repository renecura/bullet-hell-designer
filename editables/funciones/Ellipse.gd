extends FuncionBase
class_name AA_Funcion_Ellipse

export var a: float = 200.0
export var b: float = 100.0

func value(t: float) -> Vector2:
	var x = a * cos(t)
	var y = b * sin(t)
	return Vector2(x, y)
