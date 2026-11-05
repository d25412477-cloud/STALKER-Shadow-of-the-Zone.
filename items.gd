extends Node

var item_database = {
    "medkit": {
        "name": "Аптечка",
        "description": "Восстанавливает здоровье",
        "type": "medical"
    },
    "food": {
        "name": "Консервы",
        "description": "Еда сталкера",
        "type": "food"
    },
    "artifact": {
        "name": "Медуза",
        "description": "Необычный артефакт из Зоны",
        "type": "artifact"
    },
    "bandage": {
        "name": "Бинт",
        "description": "Предмет первой помощи",
        "type": "medical"
    }
}

func get_item(item_id):
    return item_database.get(item_id, {})
