extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Test");
	var root_node = get_tree().get_root();
	root_node.free();
	   # Lade und instanziere die neue Root-Szene
	#var new_root_scene = preload("res://Scenes/Map/shop_room.tscn");
	#var new_root_instance = new_root_scene.instance()
	
	# Füge die neue Root-Instanz zum Szenenbaum hinzu
	#get_tree().set_root(new_root_instance)
