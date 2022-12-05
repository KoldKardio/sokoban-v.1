extends KinematicBody2D

onready var tween = get_parent().get_node("Tween")
onready var ray = $RayCast2D

var pushin = false
const TILE_SIZE = 16

func push(direction):
	if pushin: 
		return
	
	if test_move(transform, direction): # collision detection to walls
		return
	
#	var desired_step: Vector2 = direction * TILE_SIZE / 2
#	ray.cast_to = desired_step
#	ray.force_raycast_update()
#	if !ray.is_colliding(): # ray.cast method for collision detection
	pushin = true
	tween.interpolate_property(
		self, "position", 
		position, position + direction * TILE_SIZE, 
		0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	
	tween.start()


func _on_Tween_tween_all_completed():
	pushin = false
