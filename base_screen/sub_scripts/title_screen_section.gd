class_name TitleScreenSection
extends Control


@export var base_screen : BaseScreen
@export var screen_section_one : ScreenSectionOne
@export var controls_screen_section : ControlsScreenSection 

@export var title_screen : TitleScreen = preload("res://player_action_screens/title_screen/title_screen.tscn").instantiate()


func _ready() -> void:
	add_child(title_screen)
