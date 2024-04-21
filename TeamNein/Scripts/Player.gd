extends Area2D

signal playerCollision
var movementSpeed = 400
var shootingSpeed=0.5
var timeUntilFire=0
var bulletDamage
var playerTimer
var screen_size
#@export var bullet
#PackedScene Bullet = "res://Entities/bullet.tscn"
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
		
	if timeUntilFire > shootingSpeed:
		var shoot_direction = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down").normalized()
		if shoot_direction.x != 0 || shoot_direction.y != 0:
			print(shoot_direction)
			var bullet_scene = load("res://Entities/bullet.tscn")
			var bullet_instance = bullet_scene.instantiate()
			timeUntilFire = 0
			bullet_instance.rotation = shoot_direction.angle()	
			bullet_instance.global_position = global_position
			get_tree().root.add_child(bullet_instance)
	else:
		timeUntilFire += delta
				
				
func _on_area_entered(area):
	playerCollision.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
