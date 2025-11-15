extends Control

@export var main: Main

func _on_return_pressed() -> void:
	main.pause_menu()

func _on_restart_pressed() -> void:
	print("RESTART")
	get_tree().change_scene_to_file("res://Scenes/field.tscn")

func _on_main_menu_pressed() -> void:
	print("MAIN MENU")
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_quit_pressed() -> void:
	print("QUIT")
	get_tree().quit()
