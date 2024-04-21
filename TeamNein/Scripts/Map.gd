extends Node2D

var activeDoors = [false,false,true,false]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,4):
		get_child(0).get_child(i).set_visible(activeDoors[i])
	#$Door0.connect("doorCollided",_on_door_0_door_collided)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_door_0_door_collided():
	print("howdy")
	if(activeDoors[0]):

		pass
	
	pass # Replace with function body.


func _on_door_1_door_collided():
	
	if(activeDoors[1]):
		pass
	pass # Replace with function body.


func _on_door_2_door_collided():
	
	if(activeDoors[2]):
		pass
	pass # Replace with function body.


func _on_door_3_door_collided():
	
	if(activeDoors[3]):
		pass
	pass # Replace with function body.
