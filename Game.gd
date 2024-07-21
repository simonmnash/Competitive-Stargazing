extends Node2D

var character_scn = preload("res://player.tscn")
var constellation_scn = preload("res://constellation.tscn")

func _on_jam_connect_player_disconnected(pid: int, pinfo):
	self.remove_player(pid)

func spawn_player(pid: int, username):
	var p = character_scn.instantiate()
	p.pid = pid
	p.name = str(pid)
	print(p.name)
	$Players.add_child(p, true)
	for a in [0, 90, 180, 270, 360]:
		var c = constellation_scn.instantiate()
		$Starmap.add_child(c)
		c.azimuth = a

func remove_player(pid):
	var p = $Players.get_node(str(pid))
	if p != null:
		p.queue_free()

func _on_jam_connect_player_connected(pid, username):
	self.spawn_player(pid, username)

