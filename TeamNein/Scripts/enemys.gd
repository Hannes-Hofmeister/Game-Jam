extends CharacterBody2D

var speed = 25
var playerChase = false
var player = null
var health = 100

func _physics_process(delta):
	if playerChase:
			position += (player.position - position)/speed
	if health<0:
			queue_free()		
			
			



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
