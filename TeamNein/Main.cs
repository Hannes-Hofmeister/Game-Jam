using Godot;
using System;

public partial class Main : Node2D
{
	[Export] private PackedScene _mainmenue;

	[Export] private PackedScene _player;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		//GetNode<Control>("/Scenes/MainMenu.tscn").Connect("GameStart",this,nameof(StartRun));
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
