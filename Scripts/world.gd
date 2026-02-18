extends Node3D


const CONFIG_PATH := "user://settings.cfg"


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
