extends Node3D

@onready var world_env: WorldEnvironment = $"../../WorldEnvironment"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func activate_anomaly():
	world_env.environment.volumetric_fog_enabled = true
	world_env.environment.volumetric_fog_density = 0.3
	world_env.environment.volumetric_fog_emission = Color(1,1,1,1)

func deactivate_anomaly():
	world_env.environment.volumetric_fog_enabled = false
