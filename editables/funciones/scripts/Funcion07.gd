extends FuncionBase

export var r: float = 100.0
export var k: float = 1.0

func value(t: float) -> Vector2:
	var x = r * sin(t)
	var y = r * -sin(t) * sin(t)
	return Vector2(x, y)
