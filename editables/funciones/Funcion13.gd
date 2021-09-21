extends FuncionBase
class_name AA_Funcion_14

func value(t: float) -> Vector2:
	var y = cos(t)
	var x = sin(t + sin(5 * t))
	return Vector2(x, y) * 100.0
