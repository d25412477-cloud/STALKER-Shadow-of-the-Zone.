extends Node

var items = []

func add_item(item_name):
    items.append(item_name)
    print("Добавлен предмет: ", item_name)

func remove_item(item_name):
    items.erase(item_name)

func has_item(item_name):
    return items.has(item_name)

func get_items():
    return items
