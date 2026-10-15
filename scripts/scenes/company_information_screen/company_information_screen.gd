extends Control


@export var company : Company
@export var ceo : CEO


@onready var name_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/NameRichTextLabel
@onready var money_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/MoneyRichTextLabel
@onready var store_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/StoreCountRichTextLabel


func _ready() -> void:
	if ceo == null:
		print("ERROR: Needs to be assigned a CEO")
	elif ceo != null:
		pass
	
	if company == null:
		print("ERROR: Needs to be assigned a Company")
	elif company != null:
		pass
	
	set_names(" ", " ")
	set_money(500000, 0)
	set_store_label(0)


func set_names(new_company_name : String, new_ceo_name : String):
	name_label.text = "Company: " + new_company_name + "\n" + "CEO: " + new_ceo_name
	company.company_name = new_company_name
	ceo.name = new_ceo_name


func set_money(new_funds : float, new_profit : float):
	money_label.text = "Funds: " + NumberLogic.format_currency(new_funds) + "\n" + "Profit: " + NumberLogic.format_currency(new_profit)
	company.current_funds = new_funds
	company.weekly_profit = new_profit


func set_store_label(new_store_count : int):
	store_label.text = "Stores: " + NumberLogic.format_int(new_store_count)
	company.owned_store_count = new_store_count


func set_ceo_res(ceo_res : CEO):
	ceo = ceo_res


func set_company_res(company_res : Company):
	company = company_res
	company.set_ceo(ceo)
