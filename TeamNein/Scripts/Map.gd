extends Node2D

var activeDoors = [false,false,false,false]
var cell
var roomGeneratorScript = preload("res://Scripts/Dungeon.gd") 
var roomGenerator
var dungeonArray
var shop
# Called when the node enters the scene tree for the first time.
func _ready():
	cell = 45
	roomGenerator = roomGeneratorScript.new()
	dungeonArray = roomGenerator.GenerateDungeon(1)
	activeDoors = roomGenerator.getDoors(cell)#
	shop = roomGenerator.get_endRooms()[0]
	print(shop)
	print(activeDoors)
	print(dungeonArray)
	for i in range(0,4):
		get_child(0).get_child(i).set_visible(activeDoors[i])
	#$Door0.connect("doorCollided",_on_door_0_door_collided)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateDoors():
	activeDoors = roomGenerator.getDoors(cell)
	for i in range(0,4):

		get_child(0).get_child(i).set_visible(activeDoors[i])
	if (cell == shop):
		get_child(1).get_child(0).set_visible(false)
	else:
		get_child(1).get_child(0).set_visible(true)
	print(cell)
func _on_door_0_door_collided():

	if(activeDoors[0]):
		cell += 1
		updateDoors()
		pass
	
	pass # Replace with function body.


func _on_door_1_door_collided():
	
	if(activeDoors[1]):
		cell -= 10
		updateDoors()
		pass
	pass # Replace with function body.


func _on_door_2_door_collided():
	
	if(activeDoors[2]):
		cell -=1
		updateDoors()
		pass
	pass # Replace with function body.


func _on_door_3_door_collided():
	
	if(activeDoors[3]):
		cell += 10
		updateDoors()
		pass
	pass # Replace with function body.
