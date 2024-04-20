extends HBoxContainer

var packed_scene = [
	preload("res://Scenes/ShopUi/Items/DamageUp.tscn"),
	preload("res://Scenes/ShopUi/Items/FireRateUp.tscn"),
	preload("res://Scenes/ShopUi/Items/SpeedUp.tscn"),
	preload("res://Scenes/ShopUi/Items/TimeEarnUp.tscn"),
	preload("res://Scenes/ShopUi/Items/TimeStop.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	var x = randi() % packed_scene.size();
	var scene = packed_scene[x].instantiate();
	add_child(scene);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
