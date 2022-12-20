extends Node2D

var speed = 5

func _physics_process(_delta):
	position.x -= speed
	
	if global_position.x < -768:
		queue_free()
