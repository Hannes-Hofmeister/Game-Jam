extends TileMap

var tür = preload("res://Scenes/Map/tür.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	türOben();
	türRechts();
	türLinks();
	türUnten();
	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func türOben():
	var türscene = tür.instantiate();
	türscene.position = Vector2(480,30);
	türscene.rotation_degrees = 0;
	add_child(türscene);
	
func türLinks():
	var türscene = tür.instantiate();
	türscene.position = Vector2(30,256);
	türscene.rotation_degrees = -90;
	add_child(türscene);
	
func türRechts():
	var türscene = tür.instantiate();
	türscene.position = Vector2(935,256);
	türscene.rotation_degrees = 90;
	add_child(türscene);
	
func türUnten():
	var türscene = tür.instantiate();
	türscene.position = Vector2(480,512);
	türscene.rotation_degrees = -180;
	add_child(türscene);
	#Test
