using Godot;
using System;

public partial class Bullet : Node2D
{
	private float _bulletSpeed = 200;

	private float _range = 700;

	private float _distanceTravelled = 0;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		//var area = GetNode<Area2D>("Area2D");
		//area.Connect("area_entered",this , "OnCollision");
		//area.Connect("body_entered", this, "OnCollision");
	}

	void _on_area_2d_body_entered(Node with)
	{
		OnCollision(with);
	}

	private void body_entered(Node with)
	{
		OnCollision(with);
	}
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
		float moveAmount = (float)(_bulletSpeed * delta);
		Position += Transform.X.Normalized() * moveAmount;
		_distanceTravelled += moveAmount;
		if (_distanceTravelled > _range)
		{
			QueueFree();//Destroy Bullet
		}
	}

	private void OnCollision(Node with)
	{
		//TODO Effect OnCollision
		QueueFree();
	}
}
