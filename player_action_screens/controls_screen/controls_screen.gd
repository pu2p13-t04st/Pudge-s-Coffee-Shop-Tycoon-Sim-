class_name ControlsScreen
extends Control
## Handles game controls
## Updates Date And Visiblity Of Screen Modules


# Scene Node Variables
@onready var date_label : RichTextLabel
@onready var next_week_button : Button
@onready var company_information_button : Button
@onready var store_listing_button : Button

# Screen Variables
@onready var player_information_screen : Control = preload("res://scenes/information_screens/company_class/company_class_info_screen.tscn").instantiate()
@onready var available_stores_screen : Control = preload("res://scenes/player_action_screens/available_stores_screen/available_stores_screen.tscn").instantiate()
