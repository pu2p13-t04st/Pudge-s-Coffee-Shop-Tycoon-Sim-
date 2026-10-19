class_name ControlsScreenSection
extends Control


@export var base_screen : BaseScreen

@export var controls_screen : ControlsScreen = preload("res://player_action_screens/controls_screen/controls_screen.tscn").instantiate()


func add_controls_screen():
	visible = true
	add_child(controls_screen)
