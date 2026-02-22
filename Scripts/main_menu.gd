extends Control


func _ready() -> void:
	AnomalyManager.game_mode = 0

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game_mode.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
