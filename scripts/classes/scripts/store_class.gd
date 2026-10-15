class_name Store
extends Resource
## Defines Store Class


@export_category("Location")
@export var address : String
@export var foot_traffic : int
@export_enum ( 
	"City Center:100",
	"Second Block:200",
	"Third Block:300",
	"Fourth Block:400",
	"Suburbs:500",
	"SuburbanRural:600",
	"Rural:700",
	"Boons:800",
	) var distance : int
@export_enum (
	"Famous:300",
	"Popular:200",
	"Local Favorite:100",
	"Unknown:0",
	"Disliked:-100",
	"Hated:-200",
	) var popularity : int

@export_category("Money")
@export var build_cost : float 
@export var weekly_revenue : float
@export var weekly_expenses : float
@export var weekly_profit : float

@export_category("Management")
@export var products : Array[Product]
@export var store_manager : StoreManager


var street_number : int
var product_sale_price_total : float = 0
var product_expense_total : float = 0
var distance_multiplier : float
var product_multiplier : float
var popularity_multiplier : float


func set_products(): 
	for product in products:
		product.set_variables()
		product_sale_price_total += product.selling_price
		product_expense_total += product.expenses


func set_address():
	@warning_ignore("integer_division")
	var range_start : int = (distance / 10) - 11 if (distance / 10) - 11 >= 0 else 0
	var range_end : int = range_start + 10 if range_start + 10 <= 49 else 49
	var random_name : int = randi_range(range_start, range_end)
	street_number = distance + randi_range(0, 99)
	address = str(street_number) + " " + Lists.street_names.get(random_name)
	return street_number


func set_foot_traffic():
	distance_multiplier = 10000 / float(street_number)
	product_multiplier = float(products.size()) / 50
	popularity_multiplier = (1000 * (distance_multiplier * product_multiplier)) * (popularity * 0.001)
	@warning_ignore("narrowing_conversion")
	foot_traffic = (1000 * (distance_multiplier * product_multiplier)) + popularity_multiplier


func set_revenue():
	weekly_revenue = (product_sale_price_total * (foot_traffic * (9 * 7))) / 1000


func set_expenses():
	weekly_expenses = (product_expense_total * (foot_traffic * (9 * 7))) / 1000


func set_profit():
	weekly_profit = weekly_revenue - weekly_expenses


func set_build_cost():
	build_cost = (foot_traffic * 0.25) + (weekly_expenses * 2)


func set_variables(): 
	set_products()
	set_address()
	set_foot_traffic()
	set_revenue()
	set_expenses()
	set_profit()
	set_build_cost()
