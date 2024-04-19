using Godot;
using System;

public partial class Node2D : Godot.Node2D{
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready(){
		GD.Print("whatever1");
		var timer = GetNode<Timer>("Timer");
		timer.Timeout -= OnTimerTimeout;
	}
	
	private void OnTimerTimeout(){
		GD.Print("whatever");
		Visible = !Visible;
	}
	
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta){
	}
}
