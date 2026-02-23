extends Node

var game_mode: int = 0
var is_armed: bool = false
var current_floor : int = 10
var anomaly_active : bool = false

func check_choice(choice: int):
	var correct = false
	
	if game_mode == 1 and current_floor == 10:
		get_tree().change_scene_to_file("res://complete.tscn")
	
	if game_mode == 2 and current_floor == 20:
		get_tree().change_scene_to_file("res://main_menu.tscn")
	
	if game_mode == 3 and current_floor == 50:
		get_tree().change_scene_to_file("res://main_menu.tscn")
	
	if game_mode == 4 and current_floor == 999:
		get_tree().change_scene_to_file("res://main_menu.tscn")
	
	if anomaly_active:
		if choice == 2:
			correct = true
	else:
		if choice == 1:
			correct = true
	
	if correct == true:
		current_floor += 1
	elif correct == false and game_mode == 1:
		if current_floor == 0:
			current_floor = 0
		else:
			current_floor -= 1
	else:
		current_floor = 0
	
	start_new_loop()

func start_new_loop():
	get_tree().call_group("anomalies", "deactivate_anomaly")
	var list = get_tree().get_nodes_in_group("anomalies")
	print("Anomalies found in 3D scene: ", list.size())
	
	if current_floor > 0 and randf() < 0.5:
		anomaly_active = true
		_select_random_anomaly()
	else:
		anomaly_active = false

func _select_random_anomaly():
	var all_anomalies = get_tree().get_nodes_in_group("anomalies")
	if all_anomalies.size() > 0:
		var random_choice = all_anomalies.pick_random()
		random_choice.activate_anomaly()
