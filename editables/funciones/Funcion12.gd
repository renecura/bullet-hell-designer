extends FuncionBase
class_name AA_Funcion_12

func value(t: float) -> Vector2:
	var x = t + sin(2 * t)
	var y = t + sin(3 * t)
	return Vector2(x, y) * 100.0
