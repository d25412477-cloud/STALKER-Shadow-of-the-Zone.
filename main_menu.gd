
extends Control

func _ready():
    var background = ColorRect.new()
    background.color = Color(0.055, 0.07, 0.06, 1)
    background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(background)
    move_child(background, 0)

    var title = Label.new()
    title.text = "STALKER\nSHADOW OF THE ZONE"
    title.position = Vector2(30, 70)
    title.add_theme_font_size_override("font_size", 38)
    title.add_theme_color_override("font_color", Color(0.75, 0.8, 0.65))
    add_child(title)

    var subtitle = Label.new()
    subtitle.text = "ЧЕРНОБЫЛЬСКАЯ ЗОНА ОТЧУЖДЕНИЯ"
    subtitle.position = Vector2(32, 180)
    subtitle.add_theme_font_size_override("font_size", 14)
    add_child(subtitle)

    create_button("НОВАЯ ИГРА", 280, start_game)
    create_button("ПРОДОЛЖИТЬ", 350, continue_game)
    create_button("НАСТРОЙКИ", 420, settings)
    create_button("ВЫХОД", 490, exit_game)

    var version = Label.new()
    version.text = "BUILD 0.1 · ANDROID"
    version.position = Vector2(30, 650)
    version.add_theme_font_size_override("font_size", 13)
    add_child(version)


func create_button(button_text: String, y: float, callback: Callable):
    var button = Button.new()
    button.text = button_text
    button.position = Vector2(35, y)
    button.size = Vector2(280, 55)
    button.pressed.connect(callback)
    add_child(button)


func start_game():
    print("Загрузка Зоны...")
    var error = get_tree().change_scene_to_file("res://main.tscn")

    if error != OK:
        push_error("Не удалось загрузить main.tscn. Код ошибки: " + str(error))


func continue_game():
    start_game()


func settings():
    print("Настройки пока разрабатываются")


func exit_game():
    get_tree().quit()
