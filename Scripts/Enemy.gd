extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 30
const ACCELERATION = 50
const MAX_SPEED = 250
const JUMP_HEIGHT = -600
const SPEED = 100

var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left
var velocity = Vector2(SPEED,GRAVITY)
var motion = Vector2(SPEED,GRAVITY)

onready var target = $"../Player"

func damage_target(target, damage):
	target.take_damage(damage)

func _physics_process(delta):
	motion.x = direction.x * SPEED
	motion.y +=GRAVITY
	motion = move_and_slide(motion, UP)
	
	if get_slide_collision(1) != null and get_slide_collision(1).collider.name == "Player":
		damage_target(target, 20)

	
	if is_on_wall():
		if direction == left:
			direction = right
		elif direction == right:
			direction = left
	