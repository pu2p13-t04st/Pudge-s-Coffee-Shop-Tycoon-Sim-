extends Node
## Loads and sets the variables for products


@export var basic_products : Array[Product] = [load("res://scripts/classes/resources/products/drip_coffee/black/drip_black_hot.tres"), load("res://scripts/classes/resources/products/drip_coffee/black/drip_black_iced.tres"), load("res://scripts/classes/resources/products/drip_coffee/cream_and_sugar/drip_cream_and_sugar_hot.tres"), load("res://scripts/classes/resources/products/drip_coffee/cream_and_sugar/drip_cream_and_sugar_iced.tres"), load("res://scripts/classes/resources/products/espresso/lattes/espresso_latte_hot.tres"), load("res://scripts/classes/resources/products/espresso/lattes/espresso_latte_iced.tres"), load("res://scripts/classes/resources/products/espresso/shots/double_shot_hot.tres"), load("res://scripts/classes/resources/products/espresso/shots/double_shot_iced.tres"), load("res://scripts/classes/resources/products/espresso/shots/triple_shot_hot.tres"), load("res://scripts/classes/resources/products/espresso/shots/triple_shot_iced.tres")]


func set_products():
	for product in basic_products:
		product.set_variables()


func _ready() -> void:
	set_products()
