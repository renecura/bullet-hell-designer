extends FuncionBase
class_name AA_Funcion_15

func value(t: float) -> Vector2:
	var x = sin(t + sin(t))
	var y = cos(1 + cos(t))
	return Vector2(x, y) * 100.0
