extends Node

const SAVE_PATH = "user://settings.cfg"

var fsrmode = "none"
var window_mode = "fullscreen"
var aa_mode = "none"

var id_winm = 0
var id_vsyn = 0
var id_shdr = 0
var id_shdq = 0
var id_aa   = 0
var id_taa  = 0
var id_fsrm = 0
var id_fsrq = 0


func _ready() -> void:
	load_settings()
	_apply_vsync()
	_apply_winm()
	_apply_shdr()
	_apply_shdq()
	_apply_aa()
	_apply_taa()
	_apply_fsrm()
	_apply_fsrq()


func load_settings():
	var config = ConfigFile.new()
	var error = config.load(SAVE_PATH)
	
	if error != OK:
		return
		
	id_winm = config.get_value("video", "windowmode", 0)
	id_vsyn = config.get_value("video", "vsync", 0)
	id_shdr = config.get_value("video", "shadowresolution", 2)
	id_shdq = config.get_value("video", "shadowquality", 2)
	id_aa   = config.get_value("video", "antialiasing", 0)
	id_taa  = config.get_value("video", "temporalantialiasing", 0)
	id_fsrm = config.get_value("video", "fsrmode", 0)
	id_fsrq = config.get_value("video", "fsrquality", 0)
	print("Settings loaded")


func save_settings():
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	
	config.set_value("video", "windowmode", id_winm)
	config.set_value("video", "vsync", id_vsyn)
	config.set_value("video", "shadowresolution", id_shdr)
	config.set_value("video", "shadowquality", id_shdq)
	config.set_value("video", "antialiasing", id_aa)
	config.set_value("video", "temporalantialiasing", id_taa)
	config.set_value("video", "fsrmode", id_fsrm)
	config.set_value("video", "fsrquality", id_fsrq)
	config.save(SAVE_PATH)
	print("Settings Saved")


func _apply_vsync():
	if id_vsyn == 0:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		print("VSYNC TURNED OFF")
	elif id_vsyn == 1:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		print("VSYNC TURNED ON")

func _apply_winm():
	if id_winm == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		window_mode = "fullscreen"
		print("Fullscreen Mode")
	elif id_winm == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		window_mode = "borderless"
		print("Borderless Mode")
	elif id_winm == 2:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		window_mode = "windowed"
		print("Windowed Mode")

func _apply_shdr():
	var viewport = get_viewport()
	if id_shdr == 0:
		viewport.positional_shadow_atlas_size = 16384
		print("Ultra Shadows")
	elif id_shdr == 1:
		viewport.positional_shadow_atlas_size = 8192
		print("High Shadows")
	elif id_shdr == 2:
		viewport.positional_shadow_atlas_size = 4096
		print("Medium Shadows")
	elif id_shdr == 3:
		viewport.positional_shadow_atlas_size = 2048
		print("Low Shadows")
	elif id_shdr == 4:
		viewport.positional_shadow_atlas_size = 0
		print("Shadows Turned Off")
		
func _apply_shdq():
	if id_shdq == 0:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_MAX)
		print("MAX SHADOW QUALITY")
	elif id_shdq == 1:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_ULTRA)
		print("ULTRA SHADOW QUALITY")
	elif id_shdq == 2:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_HIGH)
		print("HIGH SHADOW QUALITY")
	elif id_shdq == 3:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_MEDIUM)
		print("MEDIUM SHADOW QUALITY")
	elif id_shdq == 4:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_LOW)
		print("LOW SHADOW QUALITY")
	elif id_shdq == 5:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_VERY_LOW)
		print("VERY LOW SHADOW QUALITY")
	elif id_shdq == 6:
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_HARD)
		print("ULTRA LOW SHADOW QUALITY")

func _apply_aa():
	var viewport = get_viewport()
	if id_aa == 0:
		RenderingServer.viewport_set_msaa_3d(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_MSAA_DISABLED)
		RenderingServer.viewport_set_screen_space_aa(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_SCREEN_SPACE_AA_DISABLED)
		global.aa_mode = "none"
		print("AA Turned Off")
	elif id_aa == 1:
		RenderingServer.viewport_set_msaa_3d(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_MSAA_2X)
		RenderingServer.viewport_set_screen_space_aa(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_SCREEN_SPACE_AA_DISABLED)
		global.aa_mode = "msaa2x"
		print("AA MSAA 2X")
	elif id_aa == 2:
		RenderingServer.viewport_set_msaa_3d(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_MSAA_4X)
		RenderingServer.viewport_set_screen_space_aa(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_SCREEN_SPACE_AA_DISABLED)
		global.aa_mode = "msaa4x"
		print("AA MSAA 4X")
	elif id_aa == 3:
		RenderingServer.viewport_set_msaa_3d(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_MSAA_8X)
		RenderingServer.viewport_set_screen_space_aa(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_SCREEN_SPACE_AA_DISABLED)
		global.aa_mode = "msaa8x"
		print("AA MSAA 8X")
	elif id_aa == 4:
		RenderingServer.viewport_set_msaa_3d(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_MSAA_DISABLED)
		RenderingServer.viewport_set_screen_space_aa(viewport.get_viewport_rid(), RenderingServer.VIEWPORT_SCREEN_SPACE_AA_FXAA)
		global.aa_mode = "fxaa"
		print("AA FXAA")

func _apply_taa():
	var viewport = get_viewport()
	if id_taa == 0:
		RenderingServer.viewport_set_use_taa(viewport.get_viewport_rid(), false)
	elif id_taa == 1:
		RenderingServer.viewport_set_use_taa(viewport.get_viewport_rid(), true)

func _apply_fsrm():
	var viewport = get_viewport()
	if id_fsrm == 0:
		viewport.set_scaling_3d_mode(Viewport.SCALING_3D_MODE_BILINEAR)
		viewport.set_scaling_3d_scale(1.0)
		global.fsrmode = "none"
		print("BILINEAR MODE")
	elif id_fsrm == 1:
		viewport.set_scaling_3d_mode(Viewport.SCALING_3D_MODE_FSR)
		viewport.set_scaling_3d_scale(0.77)
		global.fsrmode = "fsr1"
		print("FSR 1.0")
	elif id_fsrm == 2:
		viewport.set_scaling_3d_mode(Viewport.SCALING_3D_MODE_FSR2)
		global.fsrmode = "fsr2"
		print("FSR 2.2")

func _apply_fsrq():
	var viewport = get_viewport()
	if global.fsrmode == "fsr1":
		if id_fsrq == 0:
			viewport.set_scaling_3d_scale(0.77)
			print("ULTRA QUALITY FSR")
		elif id_fsrq == 1:
			viewport.set_scaling_3d_scale(0.67)
			print("QUALITY FSR")
		elif id_fsrq == 2:
			viewport.set_scaling_3d_scale(0.59)
			print("BALANCED FSR")
		elif id_fsrq == 3:
			viewport.set_scaling_3d_scale(0.45)
			print("PERFORMANCE FSR")
	else:
		pass
