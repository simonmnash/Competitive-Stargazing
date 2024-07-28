extends Sprite2D

var edit_enabled = false
var drag = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if self.self_modulate.a > 0.1:
			self.self_modulate.a -= 0.1
		if drag == true:
			drag = false
		else:
			drag = true
	elif event is InputEventMouseMotion and drag:
		if self.self_modulate.a > 0.3:
			self.self_modulate.a -= 0.1
