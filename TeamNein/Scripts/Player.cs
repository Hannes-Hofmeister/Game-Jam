using Godot;
using System;

public partial class Player : CharacterBody2D
{
	[Export] PackedScene bullet_scn; //Insert Scene from Godot
	//Shooting Attributes
	private float _fire_rate;
	private float _time_untile_fire = 0f;
	//Moving Attributes 
	[Export] public int Speed = 300;
	public Vector2 ScreenSize;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ScreenSize = GetViewportRect().Size;
		_fire_rate = 0.5f;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		//Movment Inputs
		var velocity = Vector2.Zero; // The player's movement vector.
		if (Input.IsActionPressed("move_right"))
		{
			velocity.X += 1;
		}

		if (Input.IsActionPressed("move_left"))
		{
			velocity.X -= 1;
		}

		if (Input.IsActionPressed("move_down"))
		{
			velocity.Y += 1;
		}

		if (Input.IsActionPressed("move_up"))
		{
			velocity.Y -= 1;
		}
		//Diagonal Movement has the same speed as straight Movement
		if (velocity.Length() > 0)
		{
			velocity = velocity.Normalized() * Speed;
		}

		//Make it smooth 
		Position += velocity * (float)delta;
		Position = new Vector2(
			x: Mathf.Clamp(Position.X, 0, ScreenSize.X),
			y: Mathf.Clamp(Position.Y, 0, ScreenSize.Y)
		);


		Rotation = (GetGlobalMousePosition() - GlobalPosition).Angle(); //Player looks to the mouse 
		if (Input.IsActionPressed("shoot") && _time_untile_fire > _fire_rate)
		{
			_time_untile_fire = 0f;
			Node2D bullet = bullet_scn.Instantiate<Node2D>();
			bullet.Rotation = GlobalRotation;
			bullet.GlobalPosition = GlobalPosition;

			GetTree().Root.AddChild(bullet);
		}
		else
		{
			_time_untile_fire += (float)delta;
		}
	}
}
