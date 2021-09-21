extends FuncionBase
class_name AA_PolarAngulo

export var initial_angle: float = -90
export var angular_speed: float = 0.0
export var bullet_speed: float = 100.0

func value(t: float) -> Vector2:
	return polar2cartesian(
		bullet_speed,
		deg2rad(initial_angle) - angular_speed * t
		)
