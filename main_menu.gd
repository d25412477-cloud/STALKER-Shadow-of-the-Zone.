extends Control

func _ready():
    var title = Label.new()
    title.text = "STALKER\nSHADOW OF THE ZONE"
    title.position = Vector2(30, 80)
    title.add_theme_font_size_override("font_size", 34)
    add_child(title)

    create_button("НОВАЯ ИГРА", 250, start_game)
    create_button("ПРОДОЛЖИТЬ", 320, continue_game)
    create_button("НАСТРОЙКИ", 390, settings)
    create_button("ВЫХОД", 460, exit_game)

func create_button(text_value, y, callback):
    var button = Button.new()
    button.text = text_value
    button.position = Vector2(40, y)
    button.size = Vector2(260, 55)
    button.pressed.connect(callback)
    add_child(button)

func start_game():
    get_tree().change_scene_to_file("res://main.tscn")

func continue_game():
    start_game()

func settings():
    print("Настройки")

func exit_game():
    get_tree().quit()
