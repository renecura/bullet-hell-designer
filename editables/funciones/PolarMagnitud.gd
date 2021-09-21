extends FuncionBase
class_name AA_PolarMagnitud


export var angle: float = 0.0
export var magnitud: float = 100.0
export var p: float = 0.0
export var k: float = 1.0

func value(t: float) -> Vector2:
	
	var r = magnitud * cos(k * t + p)
	
	return polar2cartesian(r, -angle)
