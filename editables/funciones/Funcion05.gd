extends FuncionBase
class_name AA_Funcion_05

export var r: float = 100.0
export var k: float = 0.1

func value(t: float) -> Vector2:
	var x = sin(t)
	var y = pow(2.71,t) * sin(k * t)
	return Vector2(x, y)
