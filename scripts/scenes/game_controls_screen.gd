extends Control

#References to screens
@onready var player_company_info_screen : Control = preload("res://scenes/player_company_information_screen.tscn").instantiate()
@onready var available_stores_screen : Control = preload("res://scenes/available_stores_screen.tscn").instantiate()

#References to scene nodes
@onready var date_label : RichTextLabel = $GameControlsScreenPanelContainer/GameControlsScreenVBoxContainer/CurrentDateRichTextLabel
@onready var next_week_button : Button = $GameControlsScreenPanelContainer/GameControlsScreenVBoxContainer/GameControlsScrollContainer/GameControlsVBoxContainer/NextWeekButton
@onready var company_information_button : Button = $GameControlsScreenPanelContainer/GameControlsScreenVBoxContainer/GameControlsScrollContainer/GameControlsVBoxContainer/CompanyInformationButton
@onready var store_listings_button : Button = $GameControlsScreenPanelContainer/GameControlsScreenVBoxContainer/GameControlsScrollContainer/GameControlsVBoxContainer/StoreListingsButton

@export var weeks_passed : int = 0

#References to nodes outside of the scene set when the scene is ready
var base : Node
var screen_section_one : Control
var screen_section_two : Control
var screen_section_three : Control

func _ready() -> void:
	base = get_parent().get_parent()
	screen_section_one = base.get_child(2)
	screen_section_two = base.get_child(3)
	screen_section_three = base.get_child(4)
	show_node(screen_section_one)
	show_node(screen_section_two)
	show_node(screen_section_three)
	
	#Sets the template info screen to display the player company data
	#Adds the template as a child of the first screen section and makes it visible
	screen_section_one.add_child(player_company_info_screen)
	player_company_info_screen.set_all_labels()

#Update date label and handle button responses
func update_date():
	date_label.text = "Date:\n" + NumberLogic.format_date(NumberLogic.current_date)

func _on_next_week_button_pressed() -> void:
	next_week_button.disabled = true
	NumberLogic.add_days(7)
	update_date()
	await get_tree().create_timer(0.25).timeout
	next_week_button.disabled = false
	PlayerCompany.current_funds += PlayerCompany.weekly_profit
	weeks_passed += 1
	if weeks_passed % 2 == 0:
		available_stores_screen.add_stores()

func hide_node(node : Node):
	node.visible = false

func show_node(node : Node):
	node.visible = true 

func _on_company_information_button_pressed() -> void:
	company_information_button.disabled = true
	if screen_section_one.get_child(0) == player_company_info_screen:
		@warning_ignore("standalone_ternary")
		show_node(player_company_info_screen) if player_company_info_screen.visible == false else hide_node(player_company_info_screen)
	else:
		print("ERROR: Wrong Node Found!")
	await get_tree().create_timer(0.25).timeout
	company_information_button.disabled = false
 
func _on_store_listings_button_pressed() -> void:
	store_listings_button.disabled = true
	if screen_section_two.get_child_count() == 0:
		screen_section_two.add_child(available_stores_screen)
	elif screen_section_two.get_child_count() >= 1:
		if screen_section_two.get_child(0) == available_stores_screen:
			@warning_ignore("standalone_ternary")
			show_node(available_stores_screen) if available_stores_screen.visible == false else hide_node(available_stores_screen)
		else:
			print("ERROR: Wrong Node Found!")
	await get_tree().create_timer(0.25).timeout
	store_listings_button.disabled = false
