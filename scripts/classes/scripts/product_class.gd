class_name Product
extends Resource
## Defines Product Class


@export var name : String
@export_enum("Hot", "Iced", "Frozen") var temp : String
@export var ingredients : Array[Ingredient]
@export var expenses : float
@export var sale_price : float
@export var markup : float = 0.75


func set_expenses():
	for ingredient in ingredients:
		expenses += ingredient.cost_per_part



func set_sale_price():
	sale_price = expenses + (expenses * markup)


func set_variables():
	set_expenses()
	set_sale_price()
