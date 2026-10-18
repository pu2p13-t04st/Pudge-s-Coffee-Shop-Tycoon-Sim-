class_name BaseScreen
extends Node
## Base Scene Script
## Loads Title Screen Exports Screen Sections


# Scene Node Variables
@onready var title_screen_placeholder : Control = %TitleScreenPlaceholder
@onready var screen_section_one : Control = %ScreenSectionOne
@onready var screen_section_two : Control = %ScreenSectionTwo
@onready var control_screen_placeholder : Control = %ControlScreenPlaceholder

# Packed Scene Screen Variables
@onready var title_screen : TitleScreen = preload("res://scenes/player_action_screens/title_screen/title_screen.tscn").instantiate()


# Display Title Screen On Start
func _ready() -> void:
	title_screen_placeholder.add_child(title_screen)
	title_screen_placeholder.visible = true
