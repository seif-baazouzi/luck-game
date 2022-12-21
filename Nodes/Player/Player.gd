extends KinematicBody2D

onready var sprite: = $AnimatedSprite

export(int) var jump = 400
export(int) var gravity = 800

var score: int = 0
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
	
	if global_position.y > 384:
		sprite.play("fall")
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.is_in_group("ruby"):
		body.queue_free()
		score += 1
		$"/root/Game/UI/Score".text = str(score)
