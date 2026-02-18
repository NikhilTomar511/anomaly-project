extends Area3D

var is_open = false
var interaction_distance = 4.0 

@onready var anim: AnimationPlayer = $AnimationPlayer

func _process(delta):
	
	var players = get_overlapping_bodies()
	var closest_player = null
	var closest_distance = INF
	
	for body in players:
		
		if body.is_in_group("player"):  
			
			var distance = get_global_transform().origin.distance_to(body.get_global_transform().origin)
			if distance < closest_distance:
				closest_distance = distance
				closest_player = body
	
	
	if Input.is_action_just_pressed("e") and closest_player and closest_distance <= interaction_distance:
		toggle_door()

func toggle_door():
	is_open = !is_open
	if is_open == false:
		anim.play_backwards("office_door_open")
	else:
		anim.play("office_door_open")
