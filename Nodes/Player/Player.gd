extends KinematicBody2D

onready var sprite: = $AnimatedSprite

export(int) var jump = 200
export(int) var gravity = 300

var velocity: Vector2 = Vector2.ZERO

func _ready():
	sprite.play("run")
	sprite.playing = true
	
func _physics_process(delta):
	velocity.y += gravity * delta
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump
			sprite.play("jump")
		else:
			sprite.play("run")
	
	velocity = move_and_slide(velocity, Vector2.UP)
