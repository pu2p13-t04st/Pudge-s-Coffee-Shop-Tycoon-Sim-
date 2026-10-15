extends Control

#Date variables
@onready var date_label : RichTextLabel = $GameControlsScreenPanelContainer/GameControlsScreenVBoxContainer/CurrentDateRichTextLabel

#Sibling and parent node block
var base : Node
var title_screen_placeholder : Control
var screen_section_one : Control
var screen_section_two : Control
var screen_section_three : Control
var player_company_info : Control

func _ready() -> void: #Set references to siblings and parent nodes
	base = get_parent().get_parent()
	title_screen_placeholder = base.get_child(1)
	screen_section_one = base.get_child(2)
	screen_section_two = base.get_child(3)
	screen_section_three = base.get_child(4)
	player_company_info = screen_section_one.get_child(0) 

func _on_next_week_button_pressed() -> void:
	NumberLogic.current_date = NumberLogic.add_days(NumberLogic.current_date, 7)
	date_label.text = "Date:" + "\n" + NumberLogic.format_date(NumberLogic.current_date)

func _on_company_information_button_pressed() -> void:
	if player_company_info.visible == true:
		player_company_info.visible = false
	elif player_company_info.visible == false:
		player_company_info.visible = true
