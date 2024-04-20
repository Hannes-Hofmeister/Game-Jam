
using Godot;
using System;

public partial class MainMenu : Control
{
	[Signal] public delegate void GameStartEventHandler();
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
		//EmitSignal(SignalName.);
		QueueFree();
		
	
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




