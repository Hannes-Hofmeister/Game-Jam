extends Area2D

var shop = preload("res://Scenes/Map/shop_room.tscn").instantiate();
var player = preload("res://Entities/player.tscn").instantiate();
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Test");
	get_tree().get_root().add_child(shop)
	var parent_node = get_parent()
	if(parent_node.get_Kind() =='R'):
		body.setPosition(Vector2(30,256));
	elif(parent_node.get_Kind() == 'L'):
		body.setPosition(Vector2(935,256));
	elif(parent_node.get_Kind() == 'O'):
		body.setPosition(Vector2(480,512));
	elif(parent_node.get_Kind() == 'U'):
		body.setPosition(Vector2(480,30));
		
	var root_node = get_tree().get_root().get_children();
	for child in root_node:
		if child.get_name() == "Main":
			print("Main")
			var main_node  = child.get_children();
			for main_child in main_node:
				if(main_child.get_name()== "NormalRoom"):
					main_child.queue_free()
	

	

		

	

	

	


