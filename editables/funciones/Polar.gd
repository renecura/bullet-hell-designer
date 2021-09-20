extends FuncionBase

export var angle: float = 0.0
export var magnitud: float = 100.0

func value(t: float) -> Vector2:
	return polar2cartesian(magnitud, deg2rad(-angle))