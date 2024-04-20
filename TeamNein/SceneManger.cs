using Godot;
using System;

public partial class SceneManager : Node2D
{
	[Export] private PackedScene _mainmenue;

	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		var scene = GD.Load<PackedScene>("res://Scenes/MainMenu.tscn");
		var mainMenuIns = scene.Instantiate();
		AddChild(mainMenuIns);
		
	}

	private object StartRun()
	{
		
		throw new NotImplementedException();
	}


	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
