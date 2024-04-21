extends Area2D

var shop = preload("res://Scenes/Map/shop_room.tscn").instantiate();
var player = preload("res://Entities/player.tscn").instantiate();

signal DoorActivated
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Test");
	emit_signal("DoorActivated")
	
	
	
	
	
	
	get_tree().get_root().add_child(shop)
	var root_node = get_tree().get_root().get_children();
	for child in root_node:
		if(child.is_in_group("NormalRoom")):
			child.free()
		elif(child.is_in_group("Player")):
			child.position = Vector2(30,256)
		
	
	
	
	


