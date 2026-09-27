extends Node

#Set to respective nodes in the editor
@export var title_screen_placeholder : Control
@export var screen_section_one : Control
@export var screen_section_two : Control
@export var screen_section_three : Control

#Creates an instance of the title screen once the script is loaded
@onready var title_screen : Control = preload("res://scenes/title_screen.tscn").instantiate()

func _ready() -> void:
	#Adds the title screen to its placeholder and makes it visible
	title_screen_placeholder.visible = true
	title_screen_placeholder.add_child(title_screen)
