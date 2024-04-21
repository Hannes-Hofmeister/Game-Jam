using Godot;
using System;
using System.Collections.Generic;

public partial class Floor : Node2D
{
	
	private Random random;
	private List<int> dungeon;
	private List<int> queue;
	private List<int> endRooms;
	private int level;
	private int roomCount;
	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		random = new Random();
		dungeon = new List<int>();
		queue = new List<int>();
		endRooms = new List<int>();
		level = 1;
		GenerateDungeon();
		PrintLayoutToConsole();
		BuildRooms();
	}
	
	//generates room structure
	private void GenerateDungeon()
	{
		GD.Print("Generating Floor Layout;");
		roomCount = random.Next(2) + 5 + (int)(level * 2.6); //formula to calculate amount of rooms depending on level
		if (roomCount > 30) //cap roomCount at 30
		{
			roomCount = 30;
		}
		
		AddRoom(45); // Add starting room
		while (roomCount > dungeon.Count) //Iterate through the dungeon
		{
			int currentCell = queue[0];
			queue.RemoveAt(0);
			List<int> directions = new List<int> { 10, -10, 1, -1 };
			ShuffleList(directions); // Randomize direction order
			foreach (int direction in directions)
			{
				int neighborCell = currentCell + direction;
				if (0 <= neighborCell && neighborCell <= 99) //If neighborCell is in Range
				{
					if (!dungeon.Contains(neighborCell) && CellHasLessThanOneNeighbor(neighborCell) &&
						dungeon.Count < roomCount && random.Next(2) == 0)
					{
						AddRoom(neighborCell);
						endRooms.Remove(currentCell);
					}

				}
				
			}
			if (dungeon.Count > 16 && random.Next(5) == 0) // Reseed starting room periodically
				queue.Add(35);
		}
	}
	
	private void BuildRooms(){
		foreach (int room in dungeon)
		{
			//TODO: Instanciate Room
			if (dungeon.Contains(room + 1))
			{
				//TODO: spawn door on the left
			}
			if (dungeon.Contains(room - 1))
			{
				//TODO: spawn door on the right
			}
			if (dungeon.Contains(room - 10))
			{
				//TODO: spawn door on the top
			}
			if (dungeon.Contains(room + 10))
			{
				//TODO: spawn door on the bottom
			}
		}
	}

	private bool CellHasLessThanOneNeighbor(int room)
	{
		List<int> directions = new List<int> { 10, -10, 1, -1 };
		int filledNeighbors = 0;
		foreach (int direction in directions)
		{
			int neighborCell = room + direction;
			if (dungeon.Contains(neighborCell))
			{
				filledNeighbors++;
			}
		}
		if(filledNeighbors>1)
		{
			return false;
		}
		return true;

	}
	
	private void AddRoom(int cell)
	{
		queue.Add(cell);
		dungeon.Add(cell);
		endRooms.Add(cell);
	}
	
	private void PrintLayoutToConsole(){
		GD.Print("Dungeon");
		foreach (int cell in dungeon)
		{
			GD.Print(cell);
		}
		GD.Print("Endrooms");
		foreach (int cell in endRooms)
		{
			GD.Print(cell);
		}
	}
	
	//shuffle order of items in List
	private void ShuffleList<T>(List<T> list)
	{
		int n = list.Count;
		while (n > 1)
		
			n--;
			int k = random.Next(n + 1);
			T value = list[k];
			list[k] = list[n];
			list[n] = value;
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}
}
