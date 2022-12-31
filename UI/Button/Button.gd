extends Button

export(bool) var focus = false

func _ready():
	if focus:
		grab_focus()

func _on_Button_mouse_entered():
	grab_focus()
	focus()
	
func _on_Button_mouse_exited():
	notFocus()

func _on_Button_focus_entered():
	focus()

func _on_Button_focus_exited():
	notFocus()

func focus():
	rect_scale = Vector2(1.2, 1.2)
	rect_pivot_offset = Vector2(135, 45)

func notFocus():
	rect_scale = Vector2(1, 1)
	rect_pivot_offset = Vector2(0, 0)
