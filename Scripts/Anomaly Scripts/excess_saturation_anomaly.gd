extends Node3D

@onready var world_env: WorldEnvironment = $"../../WorldEnvironment"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func activate_anomaly():
	world_env.environment.adjustment_enabled = true
	world_env.environment.adjustment_saturation = 8

func deactivate_anomaly():
	world_env.environment.adjustment_enabled = false
