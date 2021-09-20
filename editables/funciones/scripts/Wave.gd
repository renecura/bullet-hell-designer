extends FuncionBase

export var x_a: float = 200.0
export var x_f: float = 1.0
export var x_p: float = 0.0

export var y_a: float = 200.0
export var y_f: float = 1.0
export var y_p: float = -PI/2

func value(t: float) -> Vector2:
	var x = x_a * sin(t * x_f + x_p)
	var y = y_a * sin(t * y_f + y_p)
	return Vector2(x, y)
