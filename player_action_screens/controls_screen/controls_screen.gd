class_name ControlsScreen
extends Control
## Handles game controls
## Updates Date And Visiblity Of Screen Modules


# Scene Variables
@onready var date_label : RichTextLabel = %DateLabel
@onready var next_week_button : Button = %NextWeekButton
@onready var company_information_button : Button = %CompanyInformationButton
@onready var store_listing_button : Button = %StoreListingsButton

# Out Of Scene Variables
@onready var base_screen : BaseScreen = get_parent().get_parent()
@onready var screen_section_one : Control = base_screen.screen_section_one
@onready var screen_section_two : Control = base_screen.screen_section_two
@onready var controls_screen_placeholder : Control = base_screen.controls_screen_placeholder

# Player Data Variables
@export_group("Data Containers")
@export_subgroup("Player Data")
@export var player_data : CompanyData
@export var player_ceo_data : CeoData

# Screen Variables
@onready var player_data_screen : CompanyScreen = preload("res://data_containers/company_class/data_screens/company_screen.tscn").instantiate()
@onready var store_listings_screen : StoreListingsScreen = preload("res://player_action_screens/store_listings_screen/store_listings_screen.tscn").instantiate()


# Call Store Listings Method
# Make Screen Sections Visible
func _ready() -> void:
	add_store_listings_screen()
	
	screen_section_one.visible = true
	screen_section_two.visible = true
	controls_screen_placeholder.visible = true


# Adds Player Company Data Screen
# Called By title_screen.gd
func add_player_data_screen(company_name : String, ceo_name : String):
	screen_section_one.add_child(player_data_screen) 
	player_data = player_data_screen.company_data
	player_ceo_data = player_data.ceo_data
	player_data.name = company_name 
	player_ceo_data.name = ceo_name
	player_data_screen.update_labels()


# Adds Store Listings Screen Disables Visiblity 
# Until Store Listings Button Is Pressed
func add_store_listings_screen():
	screen_section_two.add_child(store_listings_screen)
	store_listings_screen.visible = false


# Updated Game Date Label
func update_date_label(date : int):
	var formatted_date : String = Numbers.format_date_string(date)
	date_label.text = "Date:" + "\n" + formatted_date


# Toggles Visiblity Of Given Node
func toggle_visiblity(node):
	if node.visible == true:
		node.visible = false
	elif node.visible == false:
		node.visible = true


# Called By The Player Pressing The Next Week Button
# Adds Days To The Games Current Date And Updates Label
func _on_next_week_button_pressed() -> void:
	Numbers.current_date = Numbers.add_days(Numbers.current_date, 7)
	update_date_label(Numbers.current_date)


# Makes Player Company Information Visible If It Isn't
func _on_company_information_button_pressed() -> void:
	toggle_visiblity(player_data_screen)


# Makes Player Company Information Visible If It Isn't
func _on_store_listings_button_pressed() -> void:
	toggle_visiblity(store_listings_screen)
