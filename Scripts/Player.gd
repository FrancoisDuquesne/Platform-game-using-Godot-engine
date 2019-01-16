extends KinematicBody2D

signal health_changed

const UP = Vector2(0,-1)
const GRAVITY = 30
const ACCELERATION = 50
const MAX_SPEED = 250
const JUMP_HEIGHT = -600
const LIVES = 3

var Bullet = preload("res://Bullet.tscn")
var motion = Vector2()
enum STATES {ALIVE, DEAD}
var state = ALIVE
export var max_health = 100
var health = max_health

func take_damage(count):
	if state == DEAD:
#		print("DEAD")
		return
	health -= count
	if health <= 0:
		health = 0
		state = DEAD
		emit_signal("died")
	emit_signal("health_changed", health)
	
	
func get_input():
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot()
		
	# Mouvment:
	var friction = false
	motion.y += GRAVITY 
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		motion.x += ACCELERATION
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		friction = true
	
	if is_on_floor():
		if Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		$Sprite.play("jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
func shoot():
	var b = Bullet.instance()
	var dir = (get_global_mouse_position() - self.global_position).normalized().angle()
	b.start($Muzzle.global_position, dir)
	get_parent().add_child(b)
	

func _physics_process(delta):
	
	get_input()
	
	if position.y > 550:
		position.y = 0
		position.x = 50
		
	motion = move_and_slide(motion,UP)
	pass
