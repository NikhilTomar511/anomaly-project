extends Control


#Buttons
@onready var b_winm = $WinMode/WinModeBut
@onready var b_vsyn = $Vsync/VsyncBut
@onready var b_shdr = $"Shadow Resolution/ShadowResBut"
@onready var b_shdq = $"Shadow Quality/ShadowQuaBut"
@onready var b_aa   = $AntiAliasing/AABut
@onready var b_taa  = $Taa/TaaBut
@onready var b_fsrm = $FSRmode/FSRModeBut
@onready var b_fsrq = $FSRQuality/FSRQualityBut

#ToolTips
@onready var l_winm = $ColorRect5/WinModeTT
@onready var l_vsyn = $ColorRect5/VSyncTT
@onready var l_shdr = $ColorRect5/ShadowResTT
@onready var l_shdq = $ColorRect5/ShadowQuaTT
@onready var l_aa   = $ColorRect5/AATT
@onready var l_taa  = $ColorRect5/TAATT
@onready var l_fsrm = $ColorRect5/FSRModeTT
@onready var l_fsrq = $ColorRect5/FSRQualityTT



func _ready():
	b_winm.select(global.id_winm)
	b_vsyn.select(global.id_vsyn)
	b_shdr.select(global.id_shdr)
	b_shdq.select(global.id_shdq)
	b_aa.select(global.id_aa)
	b_taa.select(global.id_taa)
	b_fsrm.select(global.id_fsrm)
	b_fsrq.select(global.id_fsrq)
	
func _process(delta: float) -> void:
	if global.fsrmode == "fsr1":
		b_fsrq.disabled = false
	else:
		b_fsrq.disabled = true
		
	if global.window_mode == "fullscreen":
		b_vsyn.disabled = false
	else:
		b_vsyn.disabled = true
		
	if global.aa_mode == "fxaa":
		b_taa.disabled = true
	else:
		b_taa.disabled = false

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_vsync_but_item_selected(index: int) -> void:
	global.id_vsyn = index
	global._apply_vsync()
	global.save_settings()


func _on_win_mode_but_item_selected(index: int) -> void:
	global.id_winm = index
	global._apply_winm()
	global.save_settings()


func _on_shadow_res_but_item_selected(index: int) -> void:
	global.id_shdr = index
	global._apply_shdr()
	global.save_settings()


func _on_shadow_qua_but_item_selected(index: int) -> void:
	global.id_shdq = index
	global._apply_shdq()
	global.save_settings()


func _on_aa_but_item_selected(index: int) -> void:
	global.id_aa = index
	global._apply_aa()
	global.save_settings()


func _on_taa_but_item_selected(index: int) -> void:
	global.id_taa = index
	global._apply_taa()
	global.save_settings()


func _on_fsr_mode_but_item_selected(index: int) -> void:
	global.id_fsrm = index
	global._apply_fsrm()
	global.save_settings()


func _on_fsr_quality_but_item_selected(index: int) -> void:
	global.id_fsrq = index
	global._apply_fsrq()
	global.save_settings()


func _on_reflection_but_item_selected(index: int) -> void:
	if index == 0:
		global.refsize = 1024
		global._reflection_change()
		print("ULTRA REFLECTIONS")
	elif index == 1:
		global.refsize = 512
		global._reflection_change()
		print("HIGH REFLECTIONS")
	elif index == 2:
		global.refsize = 256
		global._reflection_change()
		print("MEDIUM REFLECTIONS")
	elif index == 3:
		global.refsize = 64
		global._reflection_change()
		print("LOW REFLECTIONS")


func _on_win_mode_mouse_entered() -> void:
	l_winm.visible = true


func _on_win_mode_mouse_exited() -> void:
	l_winm.visible = false


func _on_vsync_mouse_entered() -> void:
	l_vsyn.visible = true


func _on_vsync_mouse_exited() -> void:
	l_vsyn.visible = false


func _on_shadow_resolution_mouse_entered() -> void:
	l_shdr.visible = true


func _on_shadow_resolution_mouse_exited() -> void:
	l_shdr.visible = false


func _on_shadow_quality_mouse_entered() -> void:
	l_shdq.visible = true


func _on_shadow_quality_mouse_exited() -> void:
	l_shdq.visible = false


func _on_anti_aliasing_mouse_entered() -> void:
	l_aa.visible = true


func _on_anti_aliasing_mouse_exited() -> void:
	l_aa.visible = false


func _on_taa_mouse_entered() -> void:
	l_taa.visible = true


func _on_taa_mouse_exited() -> void:
	l_taa.visible = false


func _on_fs_rmode_mouse_entered() -> void:
	l_fsrm.visible = true


func _on_fs_rmode_mouse_exited() -> void:
	l_fsrm.visible = false


func _on_fsr_quality_mouse_entered() -> void:
	l_fsrq.visible = true


func _on_fsr_quality_mouse_exited() -> void:
	l_fsrq.visible = false
	
