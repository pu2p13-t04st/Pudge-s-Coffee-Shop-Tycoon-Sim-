class_name BaseScreen
extends Node


@export var title_screen_section : TitleScreenSection
@export var screen_section_one : ScreenSectionOne
@export var screen_section_two : ScreenSectionTwo
@export var controls_screen_section : ControlsScreenSection

@export var player_company_data : CompanyData
@export var player_ceo_data : CeoData


func _on_title_screen_section_child_exiting_tree(_node: Node) -> void:
	controls_screen_section.add_controls_screen()
