extends Control

func _ready():
    var bg = ColorRect.new()
    bg.color = Color(0.04, 0.06, 0.05)
    bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(bg)
    move_child(bg, 0)

    var title = Label.new()
    title.text = "STALKER\nSHADOW OF THE ZONE"
    title.position = Vector2(50, 80)
    title.add_theme_font_size_override("font_size", 48)
    title.add_theme_color_override("font_color", Color(0.75, 0.82, 0.65))
    add_child(title)

    var subtitle = Label.new()
    subtitle.text = "ЧЕРНОБЫЛЬСКАЯ ЗОНА ОТЧУЖДЕНИЯ"
    subtitle.position = Vector2(55, 205)
    subtitle.add_theme_font_size_override("font_size", 17)
    add_child(subtitle)

    create_button("НОВАЯ ИГРА", 330, start_game)
    create_button("ВЫХОД", 410, exit_game)

func create_button(text_value, y, action):
    var btn = Button.new()
    btn.text = text_value
    btn.position = Vector2(55, y)
    btn.size = Vector2(330, 60)
    btn.pressed.connect(action)
    add_child(btn)

func start_game():
    get_tree().change_scene_to_file("res://main.tscn")

func exit_game():
    get_tree().quit()
