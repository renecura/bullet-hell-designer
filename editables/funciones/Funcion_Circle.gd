extends FuncionBase
class_name AA_Funcion_Circulo

export var radius: float = 100.0

func value(t: float) -> Vector2:
	var x = radius * cos(t)
	var y = radius * sin(t)
	return Vector2(x, y)
