class_name TitleScreen
extends Control


@export var company_line_edit : LineEdit
@export var ceo_line_edit : LineEdit
@export var start_button : Button

@export var player_data : CompanyData


func _ready() -> void:
	pass


func _on_start_button_pressed() -> void:
	get_parent().queue_free()
