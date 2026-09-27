extends Control

@onready var address_label : RichTextLabel = $StoreListingPanelContainer/StoreListingVBoxContainer/AddressRichTextLabel
@onready var foot_traffic_label : RichTextLabel = $StoreListingPanelContainer/StoreListingVBoxContainer/FootTrafficAndProfitHBoxContainer/FootTrafficRichTextLabel
@onready var profit_label : RichTextLabel = $StoreListingPanelContainer/StoreListingVBoxContainer/FootTrafficAndProfitHBoxContainer/ProfitRichTextLabel
@onready var build_cost_label : RichTextLabel = $StoreListingPanelContainer/StoreListingVBoxContainer/BuildCostAndButtonHBoxContainer/BuildCostRichTextLabel
@onready var build_store_button : Button = $StoreListingPanelContainer/StoreListingVBoxContainer/BuildCostAndButtonHBoxContainer/BuildStoreButton

@export var store_built : bool = false

var address : String
var foot_traffic : int
var profit : float
var build_cost : float

func initialize(store_data : Store):
	store_data.create_variables()
	address = store_data.address
	foot_traffic = store_data.foot_traffic
	profit = store_data.profit
	build_cost = store_data.build_cost
	

func set_address_label():
	address_label.text = address

func set_foot_traffic_label():
	foot_traffic_label.text = "Foot Traffic: " + NumberLogic.format_int(foot_traffic)

func set_profit_label():
	profit_label.text = "Profit: " + NumberLogic.format_currency(profit)

func set_build_cost_label():
	build_cost_label.text = "Build Cost: " + NumberLogic.format_currency(build_cost)

func set_all_labels():
	set_address_label()
	set_foot_traffic_label()
	set_profit_label()
	set_build_cost_label()

func _ready() -> void:
	set_all_labels()

func _on_build_store_button_pressed() -> void:
	build_store_button.disabled = true
	if PlayerCompany.current_funds - build_cost < 0:
		build_store_button.text = "Insufficient Funds!"
		await get_tree().create_timer(0.5).timeout
		build_store_button.disabled = false
		build_store_button.text = "Build Store"
	else:
		build_store_button.text = "Store Built!"
		PlayerCompany.weekly_profit += profit
		PlayerCompany.current_funds -= build_cost
		PlayerCompany.stores_built += 1
		store_built = true
