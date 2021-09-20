extends Reference
class_name Funciones

static func f01(t: float, p: float = 1.0, q: float = 1.0) -> Vector2:
	var x = 1 + p * t
	var y = 2 + q * t
	return Vector2(x, y)

static func f02(t: float, r: float = 1.0) -> Vector2:
	var x = r * cos(t)
	var y = r * sin(t)
	return Vector2(x, y)

static func f03(t: float, a: float = 0.5, b: float = 1.0) -> Vector2:
	var x = a * cos(t)
	var y = b * sin(t)
	return Vector2(x, y)

static func f06(t: float, a: float = 1.0, b: float = 3.0) -> Vector2:
	var x = sin(a * t)
	var y = sin(b * t)
	return Vector2(x, y)

static func f(t: float) -> Vector2:
	var x = sin(t)
	var y = -sin(t) * sin(t)
	return Vector2(x, y)

static func f08(t: float, r: float = 1.0) -> Vector2:
	var x = r * (t - sin(t))
	var y = r * (1 - cos(t))
	return Vector2(x, y)

static func f09(t: float) -> Vector2:
	var a = t*10
	var m = 1.0
	return polar2(a, m)





static func polar2(a: float, m: float) -> Vector2:
	return Vector2.RIGHT.rotated(a) * m
