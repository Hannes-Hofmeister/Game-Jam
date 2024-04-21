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
'func _process(delta):
	if not (is_connected("doorOn",doorEntered)):
		#print(get_child_count())
		var child = room.get_children(true)
		for dor in child:
			dor.connect("doorOn",doorEntered)
			#print("kekw")
'	
	


	
func startGame():
	add_child(room)
	add_child(player)
#	room.connect("DoorActivated",doorEntered)
	mainmenue.queue_free()
	
func doorEntered():
	print("test")
	
