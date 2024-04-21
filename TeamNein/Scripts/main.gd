extends Node2D


var shop = preload("res://Scenes/Map/shop_room.tscn").instantiate();
var room = preload("res://Scenes/Map/room.tscn").instantiate();
var player = preload("res://Entities/player.tscn").instantiate();
var mainmenue = preload("res://Scenes/MainMenu.tscn").instantiate();



# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(mainmenue)
	mainmenue.position = Vector2(400,300)
	mainmenue.connect("startGame",startGame)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func startGame():
	add_child(room)
	add_child(player)
	room.connect("DoorActivated",DoorEntered)
	mainmenue.queue_free()
	
func DoorEntered():
	print("test")
	
