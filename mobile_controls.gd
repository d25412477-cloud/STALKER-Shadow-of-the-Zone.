extends CanvasLayer

var joystick := Vector2.ZERO
var joystick_touch := -1
var joystick_center := Vector2(110, 0)
var joystick_radius := 75.0

func _ready():
    var background = ColorRect.new()
    background.color = Color(0.15, 0.15, 0.15, 0.45)
    background.size = Vector2(150, 150)
    background.position = Vector2(35, -185)
    background.anchor_top = 1.0
    background.anchor_bottom = 1.0
    add_child(background)

func _input(event):
    if event is InputEventScreenTouch:
        if event.pressed:
            if event.position.y > get_viewport().get_visible_rect().size.y * 0.65:
                joystick_touch = event.index
        elif event.index == joystick_touch:
            joystick_touch = -1
            joystick = Vector2.ZERO

    if event is InputEventScreenDrag and event.index == joystick_touch:
        var center = Vector2(110, get_viewport().get_visible_rect().size.y - 110)
        joystick = (event.position - center).limit_length(75) / 75
