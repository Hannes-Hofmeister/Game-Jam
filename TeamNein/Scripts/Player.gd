extends Area2D

var movementSpeed = 400
var shootingSpeed
var bulletDamage
var playerTimer
var screen_size
#@export var bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * movementSpeed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x == 0 && velocity.y<0:
		$AnimatedSprite2D.animation = "walk up"
	elif velocity.x > 0 && velocity.y==0:
		$AnimatedSprite2D.animation = "walk right"
	elif velocity.x == 0 && velocity.y>0:
		$AnimatedSprite2D.animation = "walk down"
	elif velocity.x < 0 && velocity.y==0:
		$AnimatedSprite2D.animation = "walk left"
	elif velocity.x < 0 && velocity.y>0:
		$AnimatedSprite2D.animation = "walk down left"
	elif velocity.x > 0 && velocity.y>0:
		$AnimatedSprite2D.animation = "walk down right"
	elif velocity.x < 0 && velocity.y<0:
		$AnimatedSprite2D.animation = "walk up left"
	elif velocity.x > 0 && velocity.y<0:
		$AnimatedSprite2D.animation = "walk up right"
