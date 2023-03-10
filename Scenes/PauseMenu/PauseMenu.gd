extends Control

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		$Resume.grab_focus()
		_on_Resume_pressed()

func _on_Resume_pressed():
	visible = not visible
	get_tree().paused = not get_tree().paused

func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_Quit_pressed():
	get_tree().quit()
