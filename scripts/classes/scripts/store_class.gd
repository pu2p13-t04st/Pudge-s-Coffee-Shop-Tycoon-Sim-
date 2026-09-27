extends Resource

class_name Store

@export var address : String
@export var street_number : int
@export var foot_traffic : int
@export var build_cost : float
@export var profit : float
@export var store_level : int

#This set of functions create randomized variables deterimined by the "store level" 
#this store level is set when I make a new store resource
func create_address(level : int) -> String:
	var range_start = 0 if level == 0 else level * 10
	var range_end = range_start + 10
	@warning_ignore("integer_division")
	street_number = int(str(range_start/10) + str(range_end)) + randi_range(100, 175)
	address = str(street_number) + " " + NameLists.street_names[randi_range(range_start, range_end)]
	return address

func create_foot_traffic(level : int) -> int:
	var range_start = 10000 if level == 0 else 10000 - (level * 1000)
	var range_end = 12000 if level == 0 else 12000 - (level * 1000)
	foot_traffic = randi_range(range_start, range_end)
	return foot_traffic

func create_build_cost(level : int) -> float:
	var range_start = 40000 if level == 0 else 40000 - (level * 10000)
	var range_end = 50000 if level == 0 else 50000 - (level * 10000)
	build_cost = randf_range(range_start, range_end)
	return build_cost

func create_profit(level : int):
	@warning_ignore("integer_division", "incompatible_ternary")
	var range_start = foot_traffic / 10 if level == 0 else foot_traffic / (10 * (level + randf_range(0.1, 0.5)))
	var range_end =  build_cost / 10 if level == 0 else build_cost / (10 * (level + randf_range(0.1, 0.5)))
	profit = randf_range(range_start, range_end) * 7
	return profit

#Just calls all previous scripts at once so I can keep them separated in case I only need to call one function and also
#makes it so I don't have to write out all of them
func create_variables():
	create_address(store_level)
	create_foot_traffic(store_level)
	create_build_cost(store_level)
	create_profit(store_level)
