extends Node3D

@onready var door_anim: AnimationPlayer = $AnimatableBody3D/Sketchfab_Scene/AnimationPlayer


func _ready() -> void:
	_open_doors()

func _open_doors() -> void:
	door_anim.play("Doors open")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	door_anim.play("Doors open")
