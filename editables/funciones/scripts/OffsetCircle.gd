extends FuncionBase

export var radius: float = 100.0
export var offset: Vector2 = Vector2.RIGHT * 100

func value(t: float) -> Vector2:
	var x = radius * cos(t)
	var y = radius * sin(t)
	return offset + Vector2(x, y)
