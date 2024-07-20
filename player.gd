extends Node2D

var pid: int
var angle_movement: float = 0.0
var last_angle_input: float

var c_position: float = 0
const SPEED = 1.0

var c_rotation: float:
	get:
		return $Rotation.rotation_degrees
	set(val):
		$Rotation.rotation_degrees = val

func _ready():
	if multiplayer.get_unique_id() == pid:
		$Rotation/VerticalTransform/Camera2D.make_current()

@rpc("any_peer")
func set_rotate(amount: float):
	if multiplayer.get_remote_sender_id() != pid:
		return
	if multiplayer.is_server():
		c_rotation += SPEED*amount

func _process(delta):
	var movement = delta*50
	if multiplayer.get_unique_id() != pid:
		return
	if Input.is_action_pressed("ui_right"):
		set_rotate.rpc_id(1, movement)
	if Input.is_action_pressed("ui_left"):
		set_rotate.rpc_id(1, -1*movement)
