extends Control

@onready var background:Sprite2D = $Sprite2D

func _ready() -> void:
	AnomalyManager.game_mode = 0
	if randf() < 0.1:
		background.texture = load("res://Untitled (25).png")

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game_mode.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
