extends Node2D


var shop = preload("res://Scenes/Map/shop_room.tscn").instantiate();
var player = preload("res://Entities/player.tscn").instantiate();

#var gamemanager = preload("res://main.tscn").instantiate();
var mainmenue = preload("res://Scenes/MainMenu.tscn").instantiate();

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(mainmenue)
	mainmenue.connect("startGame",startGame)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func startGame():
	add_child(player)
	
