extends FuncionBase
class_name AA_Funcion_01

export var r: float = 100.0
export var k: float = 1.0

func value(t: float) -> Vector2:
	var x = r * cos(k * t)
	var y = 0.0
	return Vector2(x, y)
