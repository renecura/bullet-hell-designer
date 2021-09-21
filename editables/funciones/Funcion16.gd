extends FuncionBase
class_name AA_Funcion_16

export var r: float = 100.0

func value(t: float) -> Vector2:
	var x = sin(2 * t)
	var y = cos(3 * t)
	return Vector2(x, y) * r
