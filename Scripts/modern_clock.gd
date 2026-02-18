extends Node3D

@onready var anim:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	anim.play("Animation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
