extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@onready var animation = $AnimatedSprite2D

var startPosition
var endPosition


func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(0, 3*16)
	
func changeDirection():
	var End = endPosition
	endPosition = startPosition
	startPosition = End
	
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		position = endPosition
		changeDirection()
		
	velocity = moveDirection.normalized()*speed
	
func updateAnimation():
	var animationString = "walking_up"
	if velocity.y > 0:
		animationString = "walking_down"
	animation.play(animationString)
	
func _physics_process(delta):
	move_and_slide()
	updateVelocity()
	updateAnimation()
