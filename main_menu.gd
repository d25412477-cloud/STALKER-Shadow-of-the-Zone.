extends Control

func _ready():
    var background = ColorRect.new()
    background.color = Color(0.05, 0.07, 0.05)
    background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(background)
    move_child(background, 0)

    var title = Label.new()
    title.text = "SHADOW OF THE ZONE"
    title.position = Vector2(30, 100)
    title.add_theme_font_size_override("font_size", 32)
    add_child(title)

    create_button("НОВАЯ ИГРА", 250, start_game)
    create_button("ПРОДОЛЖИТЬ", 320, start_game)
    create_button("НАСТРОЙКИ", 390, settings)
    create_button("ВЫХОД", 460, exit_game)


func create_button(text_value, y, callback):
    var button = Button.new()
    button.text = text_value
    button.position = Vector2(40, y)
    button.size = Vector2(280, 55)
    button.pressed.connect(callback)
    add_child(button)


func start_game():
    print("НАЖАТА НОВАЯ ИГРА")
    print("ПРОВЕРКА СЦЕНЫ: ", ResourceLoader.exists("res://main.tscn"))

    if ResourceLoader.exists("res://main.tscn"):
        get_tree().change_scene_to_file("res://main.tscn")
    else:
        print("ОШИБКА: main.tscn НЕ НАЙДЕН")


func settings():
    print("Настройки")


func exit_game():
    get_tree().quit()
