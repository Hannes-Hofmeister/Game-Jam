
using Godot;
using System;

public partial class MainMenu : Control
{
	[Export] private PackedScene _player;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}
	
	private void _on_start_game_button_pressed()
	{
		
		QueueFree();
		var scene = GD.Load<PackedScene>("res://Entities/player.tscn");
		var playerScene = scene.Instantiate();
		
		

		var tilemap = GD.Load<PackedScene>("res://Scenes/Map/tile_map.tscn");
		var tilemapScene = tilemap.Instantiate();
	
		var enemy = GD.Load<PackedScene>("res://Entities/enemys.tscn").Instantiate();
		
		GetTree().Root.AddChild(tilemapScene);
		GetTree().Root.AddChild(playerScene);
		GetTree().Root.AddChild(enemy);


	}

	
	private void _on_settings_button_pressed()
	{
		
		GetTree().ChangeSceneToFile("res://Scenes/SettingsMenu.tscn");
	}

	private void _on_quit_game_button_pressed()
	{
		GetTree().Quit();
	}



}




