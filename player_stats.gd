extends Node

var max_health = 100
var health = 100

func take_damage(amount):
    health = max(0, health - amount)
    print("Здоровье: ", health)

func heal(amount):
    health = min(max_health, health + amount)
    print("Здоровье: ", health)

func is_alive():
    return health > 0

func get_health_percent():
    return float(health) / max_health * 100.0
