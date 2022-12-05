extends KinematicBody2D

var velocity = Vector2.ZERO
export var speed = 1000

func _process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_up"):
		velocity = Vector2.UP
	if Input.is_action_just_pressed("ui_right"):
		velocity = Vector2.RIGHT
	if Input.is_action_just_pressed("ui_down"):
		velocity = Vector2.DOWN
	if Input.is_action_just_pressed("ui_left"):
		velocity = Vector2.LEFT
	
	var collision = move_and_collide(velocity * speed * delta)
	
	if collision:
		var node = collision.collider
		if node is KinematicBody2D:
			node.push(velocity)
