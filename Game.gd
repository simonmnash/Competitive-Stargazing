extends Node2D

var character_scn = preload("res://player.tscn")
var constellation_scn = preload("res://constellation.tscn")
var rng = RandomNumberGenerator.new()

func _on_jam_connect_player_disconnected(pid: int, pinfo):
	self.remove_player(pid)

func spawn_player(pid: int, username):
	var p = character_scn.instantiate()
	p.pid = pid
	p.name = str(pid)
	print(p.name)
	$Players.add_child(p, true)
	$Timer.start()

func remove_player(pid):
	var p = $Players.get_node(str(pid))
	if p != null:
		p.queue_free()

func _on_jam_connect_player_connected(pid, username):
	self.spawn_player(pid, username)

func _on_timer_timeout():
	$Starmap.visible = true
	if multiplayer.is_server():
		for a in [0, 90, 180, 270, 360]:
			var c = constellation_scn.instantiate()
			c.azimuth = a
			for i in range(0, 50):
				c.add_star(Vector2(rng.randf_range(-250.0, 250.0), rng.randf_range(-250.0, 250.0)))
			$Starmap.add_child(c, true)
		start_hunt.rpc()

@rpc
func start_hunt():
	$Starmap.show()
	var p = multiplayer.get_unique_id()
	$Players.get_node(str(p)).activate()
