extends Control

@export var stores : Array[Store]

@onready var store_listing_container : VBoxContainer = $AvailableStoresScreenPanelContainer/AvailableStoresScreenVBoxContainer/StoreListingsScrollContainer/StoreListingsVBoxContainer
@onready var store_listing_template : PackedScene = preload("res://scenes/store_listing_template.tscn")

func _ready() -> void:
	for i in 5:
		var instantiated = store_listing_template.instantiate()
		var randomized_store = stores.pick_random()
		instantiated.initialize(randomized_store)
		store_listing_container.add_child(instantiated)

func add_stores():
	var child_count : int = 0
	for child in store_listing_container.get_child_count():
		if store_listing_container.get_child(child_count).store_built == true:
			store_listing_container.get_child(child_count).queue_free()
			print("queue free")
			print(child_count)
			await get_tree().create_timer(.05).timeout
		elif store_listing_container.get_child(child_count).store_built == false:
			child_count += 1
			print("store unbuilt")
			print(child_count)
	if child_count == 0:
		child_count = randi_range(2, 3)
		print("child count 0")
	for i in child_count:
		var instantiated = store_listing_template.instantiate()
		var randomized_store = stores.pick_random()
		instantiated.initialize(randomized_store)
		store_listing_container.add_child(instantiated)
		print("instantiated")
		print(child_count)
