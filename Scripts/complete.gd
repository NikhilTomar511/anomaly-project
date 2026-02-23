extends Node2D

@onready var labels = [$Label,$Label2,$Label3,$Label4,$Label5]
@onready var bg = $Background

func _ready():
	var tween = create_tween()
	
	for l in labels:
		l.modulate.a = 0
	
	for i in range(labels.size() - 1):
		tween.tween_property(labels[i], "modulate:a", 1.0, 2.5)
		tween.tween_interval(0.5)
	
	tween.tween_callback(self.make_final_shift)
	tween.tween_interval(4.0)
	tween.tween_callback(self.change_scene)

func make_final_shift():
	bg.modulate = Color.BLACK
	
	for l in labels:
		l.modulate = Color.RED

func change_scene():
	get_tree().change_scene_to_file("res://main_menu.tscn")
