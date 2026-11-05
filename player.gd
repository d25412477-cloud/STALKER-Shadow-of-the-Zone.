extends CharacterBody3D

@export var speed = 4.0
@export var sensitivity = 0.003

var gravity = 9.8

func _physics_process(delta):
    var input_dir = Vector2.ZERO

    if Input.is_key_pressed(KEY_W):
        input_dir.y -= 1
    if Input.is_key_pressed(KEY_S):
        input_dir.y += 1
    if Input.is_key_pressed(KEY_A):
        input_dir.x -= 1
    if Input.is_key_pressed(KEY_D):
        input_dir.x += 1

    input_dir = input_dir.normalized()

    var direction = transform.basis * Vector3(input_dir.x, 0, input_dir.y)

    velocity.x = direction.x * speed
    velocity.z = direction.z * speed

    if not is_on_floor():
        velocity.y -= gravity * delta

    move_and_slide()
