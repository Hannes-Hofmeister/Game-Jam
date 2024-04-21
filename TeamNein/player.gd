extends CharacterBody2D

var timer: Control
var bullet_scn # Insert Scene from Godot
var _fire_rate: float
var _time_until_fire: float = 0
@export var Speed: int = 300
var ScreenSize: Vector2
var countdownMinutes: int
var countdownSeconds: int

func _ready():
	var bullet = bullet_scn.instance()
	ScreenSize = get_viewport().size
	_fire_rate = 0.5
	set_player_timer(0, 30)
	var enemyNode = get_node("res://Entities/enemys.tscn")

func set_player_timer(minutesValue: int, secondsValue: int) -> void:
	timer = $Control
	countdownMinutes = timer.minutes
	countdownSeconds = timer.seconds
	timer.minutes = minutesValue
	timer.seconds = secondsValue

func add_time() -> void:
	pass

func get_player_minute() -> int:
	return countdownMinutes

func get_player_seconds() -> int:
	return countdownSeconds

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	# Diagonal Movement has the same speed as straight Movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed

	# Make it smooth
	position += velocity * delta
	position = Vector2(clamp(position.x, 0, ScreenSize.x),clamp(position.y, 0, ScreenSize.y))

	var animatedSprite2D = $AnimatedSprite2D
	animatedSprite2D.play()
	if velocity == Vector2.ZERO:
		animatedSprite2D.animation = "idle"
	elif velocity.x == 0 and velocity.y < 0:
		animatedSprite2D.animation = "walk_up"
	elif velocity.x > 0 and velocity.y == 0:
		animatedSprite2D.animation = "walk_right"
	elif velocity.x == 0 and velocity.y > 0:
		animatedSprite2D.animation = "walk_down"
	elif velocity.x < 0 and velocity.y == 0:
		animatedSprite2D.animation = "walk_left"
	elif velocity.x < 0 and velocity.y > 0:
		animatedSprite2D.animation = "walk_down_left"
	elif velocity.x > 0 and velocity.y > 0:
		animatedSprite2D.animation = "walk_down_right"
	elif velocity.x < 0 and velocity.y < 0:
		animatedSprite2D.animation = "walk_up_left"
	elif velocity.x > 0 and velocity.y < 0:
		animatedSprite2D.animation = "walk_up_right"
	if _time_until_fire > _fire_rate:
		
		var shoot_direction = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down").normalized()
		if shoot_direction.x != 0 || shoot_direction.y != 0:
			print(shoot_direction)
			var bullet = bullet_scn.instance()
			_time_until_fire = 0
			bullet.rotation = shoot_direction.angle()
			bullet.global_position = global_position
			get_tree().root.add_child(bullet)
		else:
			_time_until_fire += delta



