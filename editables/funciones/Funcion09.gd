extends FuncionBase
class_name AA_Funcion_09

func value(t: float) -> Vector2:
	var x = t * t * t - 2 * t
	var y = t * t - t
	return Vector2(x, y) * 100.0
