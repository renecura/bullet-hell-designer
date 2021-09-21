extends FuncionBase
class_name AA_Funcion_11

func value(t: float) -> Vector2:
	var x = sin(3 * t)
	var y = sin(4 * t)
	return Vector2(x, y) * 100.0
