class_name StoreListingsScreen
extends Control
## Handles how players buy stores
## Creates all available store resources in a game session
## Then transfers the resource to the player company


# Store Data Variables
@export var listed_stores : Array[StoreData]
@export var unlisted_stores : Array[StoreData]
@export var store_types : Array[StoreData] = [
	preload("res://data_containers/store_class/resources/city_center.tres"),
	preload("res://data_containers/store_class/resources/second_block.tres"),
	preload("res://data_containers/store_class/resources/third_block.tres"),
	preload("res://data_containers/store_class/resources/fourth_block.tres"),
	preload("res://data_containers/store_class/resources/suburbs.tres"),
	preload("res://data_containers/store_class/resources/suburban_rural.tres"),
	preload("res://data_containers/store_class/resources/rural.tres"),
	preload("res://data_containers/store_class/resources/boons.tres"),
	]

# Scene Variables
@onready var store_listings_container : VBoxContainer = %StoreListingsContainer

# Out Of Scene Variables
@onready var base_screen : BaseScreen = get_parent().get_parent()
@onready var screen_section_one : Control = base_screen.screen_section_one
@onready var screen_section_two : Control = base_screen.screen_section_two
@onready var controls_screen_placeholder : Control = base_screen.controls_screen_placeholder

# Screen Variables
@onready var listed_store_data_screen : PackedScene = preload("res://data_containers/store_class/data_screens/listed_store/listed_store_screen.tscn")


# Create Store Resources 
# Create Listing Screens For Them
# Display Some In The Store Listings Container
# Store Unlisted Stores In Unlisted Store Array
func _ready() -> void:
	pass


# Makes Any Amount Of New Store Resources You Could w
func create_store_data(number : int):
	for i in number:
		var new_store_data : StoreData
		var random_type : int = randi_range(0, 7)
		new_store_data = store_types.get(random_type)
		new_store_data.set_variables()
		unlisted_stores.append(new_store_data)

func create_store_listing():
	for store in unlisted_stores:
		
