extends FuncionBase
class_name AA_Funcion_14

export var h: float = 100.0
export var v: float = 20.0

func value(t: float) -> Vector2:
	var x = h * sin(t + sin(5 * t))
	var y = v * cos(t)
	return Vector2(x, y)
