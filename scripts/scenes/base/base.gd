extends Node
## Acts as a homebase for my code
## All scenes get loaded on top of this scene
## Handles loading the title screen
## Creates references to specific screen sections

@export var title_screen_placeholder : Node
@export var screen_section_one : Node
@export var screen_section_two : Node
@export var screen_section_three : Node

@onready var title_screen : Control = preload("res://scenes/title_screen/title_screen.tscn").instantiate()

func _ready() -> void:
	title_screen_placeholder.add_child(title_screen)
	title_screen_placeholder.visible = true
