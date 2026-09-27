extends Control


#References to scene nodes
@onready var company_name_edit : LineEdit = $TitleScreenBackgroundPanelContainer/TitleScreenVBoxContainer/CompanyNameHBoxContainer/CompanyNameLineEdit
@onready var ceo_name_edit : LineEdit = $TitleScreenBackgroundPanelContainer/TitleScreenVBoxContainer/CEONameHBoxContainer/CEONameLineEdit

#Reference to the game controls scene
@onready var game_controls_scene : Control = preload("res://scenes/game_controls_screen.tscn").instantiate()

#Reference to the third screen section where the game controls will go
var screen_section_three : Control

func _ready() -> void:
	screen_section_three = get_parent().get_parent().get_child(4)

func _on_start_button_pressed() -> void:
	get_parent().visible = false
	PlayerCompany.company_name = company_name_edit.text
	PlayerCompany.ceo_name = ceo_name_edit.text
	screen_section_three.visible = true
	screen_section_three.add_child(game_controls_scene)
	queue_free()
