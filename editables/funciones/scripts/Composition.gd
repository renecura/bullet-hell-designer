extends FuncionBase

export var func_a: Resource
export var func_b: Resource

export(float, 0, 1) var factor: float = 0.5

func value(t: float) -> Vector2:
	return func_a.value(t) * 0.5 + func_b.value(t * factor) * 0.5
