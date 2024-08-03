extends Node2D

var pid: int
var star = preload("res://star.tscn")

@export
var azimuth: float = 0:
	get:
		return $Rotation.rotation_degrees
	set(val):
		$Rotation.rotation_degrees = val


func add_star(transform):
	var s = star.instantiate()
	s.position = transform
	$Rotation/VerticalTransform/StarGroup.add_child(s, true)

func _on_timer_timeout():
	if $Rotation/VerticalTransform/StarGroup.visible:
		$Rotation/VerticalTransform/StarGroup.hide()
	else:
		$Rotation/VerticalTransform/StarGroup.show()
