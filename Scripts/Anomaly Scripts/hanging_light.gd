extends Node3D

@onready var olight: OmniLight3D = $OmniLight3D
@onready var slight: SpotLight3D = $SpotLight3D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func activate_anomaly():
	olight.light_color = Color(1,0,0,1)
	slight.light_color = Color(1,0,0,1)

func deactivate_anomaly():
	olight.light_color = Color(0.88,0.65,0.39,1)
	slight.light_color = Color(0.78,0.54,0.22,1)
