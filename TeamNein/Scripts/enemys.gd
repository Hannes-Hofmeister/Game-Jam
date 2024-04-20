extends CharacterBody2D

var speed = 25
var playerChase = false
var player = null
var health = 100

func _ready() -> void:
	# Call your custom method to set the player timer
	setPlayerTimer(0, 15)  # Example value
	pass
	
func _physics_process(delta):
	if playerChase:
			position += (player.position - position)/speed
	if health<0:
			queue_free()		
			
			

func setPlayerTimer(minutesValue: int, secondsValue: int) -> void:
	var timer := get_node("./Control") as Control
	var countdownMinutes := timer.get("minutes") as int
	var countdownSeconds := timer.get("seconds") as int
	timer.set("minutes", minutesValue)
	timer.set("seconds", secondsValue)



func _on_detection_area_body_entered(body):
	player = body
	playerChase = true
	
	pass # Replace with function body.


func _on_detection_area_body_exited(body):
	player = null
	playerChase = false
	pass # Replace with function body.


func _on_area_2d_area_entered_bullet(area):
	health += -40
	pass # Replace with function body.
