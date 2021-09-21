extends FuncionBase
class_name AA_Funcion_03

export var r: float = 100.0
export var k: float = 0.1

func value(t: float) -> Vector2:
	var x = pow(2.71,t) * cos(k * t)
	var y = pow(2.71,t) * sin(k * t)
	return Vector2(x, y)
