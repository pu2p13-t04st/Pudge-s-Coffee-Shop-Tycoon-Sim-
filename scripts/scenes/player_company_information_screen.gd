extends Control

#References to scene nodes
@onready var name_label : RichTextLabel = $PlayerCompanyInformationScreenPanelContainer/PlayerCompanyInformationVBoxContainer/NameRichTextLabel
@onready var money_label : RichTextLabel = $PlayerCompanyInformationScreenPanelContainer/PlayerCompanyInformationVBoxContainer/MoneyRichTextLabel
@onready var store_label : RichTextLabel = $PlayerCompanyInformationScreenPanelContainer/PlayerCompanyInformationVBoxContainer/StoreCountRichTextLabel

#Sets the screens labels to the companies values
func set_name_label():
	name_label.text = "Company: " + PlayerCompany.company_name + "\n" + "CEO: " + PlayerCompany.ceo_name

func set_money_label():
	money_label.text = "Funds: " + NumberLogic.format_currency(PlayerCompany.current_funds) + "\n" + "Profit: " + NumberLogic.format_currency(PlayerCompany.weekly_profit)

func set_store_label():
	store_label.text = "Stores: " + NumberLogic.format_int(PlayerCompany.stores_built)

func set_all_labels():
	set_name_label()
	set_money_label()
	set_store_label()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	set_all_labels()
