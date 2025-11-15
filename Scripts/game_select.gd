extends Control

func _on_pvp_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/field.tscn")


func _on_cpu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/field.tscn")
	global.is_cpu = true

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
