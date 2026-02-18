extends Node3D

@onready var anim:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	anim.play("Animation")


func _process(delta: float) -> void:
	pass
