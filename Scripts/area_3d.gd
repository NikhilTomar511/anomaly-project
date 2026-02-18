extends Area3D

var is_open = false
var interaction_distance = 2.0  # Maximum distance for interaction

@onready var anim: AnimationPlayer = $AnimationPlayer

func _process(delta):
	# Find the closest player within interaction range
	var players = get_overlapping_bodies()
	var closest_player = null
	var closest_distance = INF
	
	for body in players:
		# Only check if the body is a player
		if body.is_in_group("player"):  # Make sure to add your players to this group
			# Use get_global_transform() for accurate positioning
			var distance = get_global_transform().origin.distance_to(body.get_global_transform().origin)
			if distance < closest_distance:
				closest_distance = distance
				closest_player = body
	
	# Only allow interaction if player is within range
	if Input.is_action_just_pressed("e") and closest_player and closest_distance <= interaction_distance:
		toggle_door()

func toggle_door():
	is_open = !is_open
	if is_open == false:
		anim.play_backwards("door2_open")
	else:
		anim.play("door2_open")
