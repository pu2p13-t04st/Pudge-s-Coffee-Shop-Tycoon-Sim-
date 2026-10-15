class_name Company
extends Resource
## Defines Company Class


@export var company_name : String = " "
@export var ceo : CEO = null
@export var date_founded :  String = " "
@export var weeks_since_founding : int = 0
@export var current_funds : float = 500000
@export var weekly_revenue : float = 0
@export var weekly_expenses : float = 0
@export var weekly_profit : float = 0
@export var owned_store_count : int = 0
@export var owned_stores : Array[Store] = []


func set_ceo(ceo_res : CEO):
	ceo = ceo_res
