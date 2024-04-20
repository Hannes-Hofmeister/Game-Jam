using Godot;
using System;

public partial class Label : Godot.Label{
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready(){
		GD.Print("whatever1");
		var timer = GetNode<Timer>("Timer");
		timer.Timeout += _on_timer_timeout();
	}
	private void _on_timer_timeout(){
		Visible = !Visible();
		GD.Print("henlo");
	}
	
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta){
	}
}


