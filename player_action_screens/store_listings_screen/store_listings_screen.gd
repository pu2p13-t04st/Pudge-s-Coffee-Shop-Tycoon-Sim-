extends Control
## Handles how players buy stores
## Creates all available store resources in a game session
## Then transfers the resource to the player company


# Store Data Variables
@export var unowned_stores : Array[Store]
@export var store_types : Array[Store] = [
	preload("res://scenes/information_screens/store_class/store_resources/city_center.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/second_block.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/third_block.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/fourth_block.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/suburbs.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/suburban_rural.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/rural.tres"),
	preload("res://scenes/information_screens/store_class/store_resources/boons.tres"),
	]

# Scene Variables
@export var store_listings_container : VBoxContainer


# Screen Variables
@onready var store_listing_template : PackedScene = preload("res://scenes/player_action_screens/available_stores_screen/available_stores_screen.tscn")


# Placeholder Variables 
var base : Node
var screen_section_one : Control
var screen_section_two : Control
var control_screen_placeholder : Control
var player_company_info : Control


# Set Placeholder Variables
func _ready() -> void:
	screen_section_two = get_parent()
	base = screen_section_two.base 
	screen_section_one = base.screen_section_one
	control_screen_placeholder = base.control_screen_placeholder
	player_company_info = screen_section_one.get_child(0)


# Creates Store Resources
func create_stores(store_amount : int):
	for i in store_amount:
		var new_store = store_listing_template.instantiate()
		store_listings_container.add_child(new_store)
