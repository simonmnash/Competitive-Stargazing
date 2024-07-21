extends Node2D

var pid: int
var star = preload("res://star.tscn")

@export
var azimuth: float = 0:
	get:
		return $Rotation.rotation_degrees
	set(val):
		$Rotation.rotation_degrees = val


