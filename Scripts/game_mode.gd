extends Control


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_easy_pressed() -> void:
	AnomalyManager.game_mode = 1
	get_tree().change_scene_to_file("res://world.tscn")

func _on_normal_pressed() -> void:
	AnomalyManager.game_mode = 2
	get_tree().change_scene_to_file("res://world.tscn")

func _on_hard_pressed() -> void:
	AnomalyManager.game_mode = 3
	get_tree().change_scene_to_file("res://world.tscn")

func _on_insanity_pressed() -> void:
	AnomalyManager.game_mode = 4
	get_tree().change_scene_to_file("res://world.tscn")
