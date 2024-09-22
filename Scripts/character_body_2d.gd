extends CharacterBody2D

class_name Player

signal healthChanged

@onready var animate: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 50
var is_moving:bool = false
var dir:String = "none"

@export var maxHealth = 3
@onready var currentHealth: int  = maxHealth

func _ready():
	pass
	

func _physics_process(delta):
	pass
	
	
	
	if Input.is_action_pressed("move_left"):
		velocity = Vector2.LEFT * SPEED
		is_moving = true
		dir = "left"
	elif Input.is_action_pressed("move_right"):
		velocity = Vector2.RIGHT * SPEED
		is_moving = true
		dir = "right"
	elif Input.is_action_pressed("move_up"):
		velocity = Vector2.UP * SPEED
		is_moving = true
		dir = "up"
	elif Input.is_action_pressed("move_down"):
		velocity = Vector2.DOWN * SPEED
		is_moving = true
		dir = "down"
	elif Input.is_action_pressed("a"):
		animate.play("scare")
	else:
		velocity = Vector2.ZERO
		is_moving = false
		
	# this allows the player to move according to the veclocity
	move_and_slide()
	
	
	#run animations
	if is_moving == true:
		if dir == "left":
			animate.play("walking_side")
			animate.flip_h = true
			
			
		elif dir == "right":
			animate.play("walking_side")
			animate.flip_h = false
			
		elif dir == "up":
			animate.play("walking_up")
			
		elif dir == "down":
			animate.play("walking_down")
			
	#idle animation
	elif is_moving == false:
		animate.play("idle")

func _on_hurtbox_area_entered(area):
	if area.name == "hitbox":
		currentHealth -= 1
		if currentHealth <= 0:
			currentHealth = maxHealth
		
	print_debug(currentHealth)
	healthChanged.emit()
			
