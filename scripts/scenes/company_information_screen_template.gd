extends Control

#References to scene nodes
@onready var name_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/NameRichTextLabel
@onready var money_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/MoneyRichTextLabel
@onready var store_label : RichTextLabel = $CompanyInformationScreenPanelContainer/CompanyInformationVBoxContainer/StoreCountRichTextLabel

#Local variables
var company_name : String
var ceo_name : String
var funds : float
var profit : float
var stores_built : int

#Sets up the reference to the specific company the screen is being called for
func initialize(company_data : Company):
	#sets local variables to the company's values
	company_name = company_data.company_name
	ceo_name = company_data.ceo_name
	funds = company_data.current_funds
	profit = company_data.weekly_profit
	stores_built = company_data.stores_built

#Sets the screens labels to the companies values
func set_name_label():
	name_label.text = "Company: " + company_name + "\n" + "CEO: " + ceo_name

func set_money_label():
	money_label.text = "Funds: " + NumberLogic.format_currency(funds) + "\n" + "Profit: " + NumberLogic.format_currency(profit)

func set_store_label():
	store_label.text = "Stores: " + NumberLogic.format_int(stores_built)

func set_all_labels():
	set_name_label()
	set_money_label()
	set_store_label()

func _ready() -> void:
	set_all_labels()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	set_all_labels()
