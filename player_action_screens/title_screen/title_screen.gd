class_name TitleScreen
extends Control
## Title Screen Script
## Loads And Passes Player Info To The Control Screen


# Scene Variables
@onready var company_name_line_edit : LineEdit = %CompanyNameLineEdit
@onready var ceo_name_line_edit : LineEdit = %CEONameLineEdit
@onready var start_button : Button = %StartButton

# Out Of Scene Variables
@onready var base_screen : BaseScreen = get_parent().get_parent()
@onready var control_screen_placeholder : Control = base_screen.control_screen_placeholder

# Controls Screen Reference
@onready var controls_screen : ControlsScreen = preload("res://scenes/player_action_screens/controls_screen/controls_screen.tscn").instantiate()


# Add Controls Screen Pass Over Player Data
# Remove Title Screen
func _on_start_button_pressed() -> void:
	control_screen_placeholder.add_child(controls_screen)
	
	get_parent().queue_free()
