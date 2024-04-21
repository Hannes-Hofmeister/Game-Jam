extends Node

var random
var dungeon = []
var queue = []
var endRooms = []
var level = 1
var roomCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GenerateDungeon(1)
	print(dungeon)
	print(endRooms)


func GenerateDungeon(level):
	print("Generating Floor Layout;")
	random = RandomNumberGenerator.new()
	roomCount = 5 + random.randi_range(0, 2) + int(level * 2.6) # formula to calculate amount of rooms depending on level
	if roomCount > 30: # cap roomCount at 30
		roomCount = 30

	AddRoom(45) # Add starting room
	while roomCount > dungeon.size(): # Iterate through the dungeon
		var currentCell = queue[0]
		queue.remove_at(0)
		var directions = [10, -10, 1, -1]
		shuffle_list(directions) # Randomize direction order
		for direction in directions:
			var neighborCell = currentCell + direction
			if 0 <= neighborCell and neighborCell <= 99: # If neighborCell is in Range
				if !dungeon.has(neighborCell) and HasLessThanOneNeighbor(neighborCell) and dungeon.size() < roomCount and random.randi_range(0, 1) == 0:
					AddRoom(neighborCell)
					endRooms.remove_at(0)
		
		if dungeon.size() > 16 and random.randi_range(0, 4) == 0: # Reseed starting room periodically
			queue.append(35)
			
	return dungeon
			
func shuffle_list(list):
	var n = list.size()
	while n > 1:
		n -= 1
		var k = random.randi_range(0, n)
		var value = list[k]
		list[k] = list[n]
		list[n] = value
		
func AddRoom(cell):
	dungeon.append(cell)
	queue.append(cell)
	endRooms.append(cell)

func HasLessThanOneNeighbor(cell):
	var count = 0
	var directions = [10, -10, 1, -1]
	for direction in directions:
		if dungeon.has(cell+direction):
			count += 1
	if count > 1:
		return false
	else:
		return true

func get_endRooms():
	return endRooms
	
func get_DungeonLayout():
	return dungeon

func getDoors(cell):
	var doors = [false, false, false, false]
	if dungeon.has(cell + 1):
		doors[0] = true
	if dungeon.has(cell - 10):
		doors[1] = true
	if dungeon.has(cell - 1):
		doors[2] = true
	if dungeon.has(cell + 10):
		doors[3] = true
	return doors

func _process(delta):
	pass
