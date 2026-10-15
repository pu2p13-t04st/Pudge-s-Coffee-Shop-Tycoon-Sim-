extends Control

@onready var company_name_line_edit : LineEdit = $TitleScreenBackgroundPanelContainer/TitleScreenVBoxContainer/CompanyNameHBoxContainer/CompanyNameLineEdit
@onready var ceo_name_line_edit : LineEdit = $TitleScreenBackgroundPanelContainer/TitleScreenVBoxContainer/CEONameHBoxContainer/CEONameLineEdit
@onready var company_info_screen : Control = preload("res://scenes/company_information_screen/company_information_screen.tscn").instantiate()
@onready var game_controls : Control = preload("res://scenes/game_controls/game_controls_screen.tscn").instantiate()

var base : Node
var placeholder : Control
var screen_section_one : Control
var screen_section_three : Control

func _ready() -> void:
	base = get_parent().get_parent()
	placeholder = base.title_screen_placeholder
	screen_section_one = base.screen_section_one
	screen_section_three = base.screen_section_three

func _on_start_button_pressed() -> void:
	placeholder.visible = false
	screen_section_one.visible = true
	screen_section_three.visible = true
	
	company_info_screen.set_ceo_res(preload("res://scripts/classes/resources/ceos/player_ceo.tres"))
	company_info_screen.set_company_res(preload("res://scripts/classes/resources/companies/player_company.tres"))
	screen_section_one.add_child(company_info_screen)
	company_info_screen.set_names(company_name_line_edit.text, ceo_name_line_edit.text)
	
	screen_section_three.add_child(game_controls)
