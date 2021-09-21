extends FuncionBase
class_name AA_Funcion_17

export var r1: float = 100.0
export var r2: float = 50.0

export var w1: float = 1.0
export var w2: float = 0.5

func value(t: float) -> Vector2:
	var x = r1 * cos(w1 * t) + r2 * cos(w2 * t)
	var y = r1 * sin(w1 * t) + r2 * sin(w2 * t)
	return Vector2(x, y)
