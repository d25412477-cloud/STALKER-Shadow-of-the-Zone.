extends CanvasLayer

var health = 100

func _ready():
    var label = Label.new()
    label.name = "HealthLabel"
    label.text = "ЗДОРОВЬЕ: 100%"
    label.position = Vector2(25, 25)
    label.add_theme_font_size_override("font_size", 24)
    add_child(label)

    var health_bar = ProgressBar.new()
    health_bar.name = "HealthBar"
    health_bar.position = Vector2(25, 65)
    health_bar.size = Vector2(220, 20)
    health_bar.max_value = 100
    health_bar.value = 100
    add_child(health_bar)

func set_health(value):
    health = clamp(value, 0, 100)
    get_node("HealthBar").value = health
    get_node("HealthLabel").text = "ЗДОРОВЬЕ: " + str(health) + "%"
