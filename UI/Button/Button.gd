extends Button

func _on_Button_mouse_entered():
	rect_scale = Vector2(1.2, 1.2)
	rect_pivot_offset = Vector2(135, 45)
	
func _on_Button_mouse_exited():
	rect_scale = Vector2(1, 1)
