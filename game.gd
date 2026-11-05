extends Node3D

func _ready():
    create_environment()
    create_ground()
    create_house(Vector3(0, 0, -12))
    create_house(Vector3(12, 0, -22))
    create_house(Vector3(-14, 0, -25))
    create_trees()

func create_environment():
    var env = WorldEnvironment.new()
    var e = Environment.new()
    e.background_mode = Environment.BG_COLOR
    e.background_color = Color(0.25, 0.30, 0.28)
    e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
    e.ambient_light_color = Color(0.7, 0.75, 0.65)
    e.ambient_light_energy = 0.7
    e.fog_enabled = true
    e.fog_light_color = Color(0.5, 0.55, 0.5)
    e.fog_density = 0.008
    env.environment = e
    add_child(env)

    var sun = DirectionalLight3D.new()
    sun.rotation_degrees = Vector3(-45, -30, 0)
    sun.light_energy = 0.6
    add_child(sun)

func create_ground():
    var ground = MeshInstance3D.new()
    var mesh = PlaneMesh.new()
    mesh.size = Vector2(150, 150)
    ground.mesh = mesh

    var mat = StandardMaterial3D.new()
    mat.albedo_color = Color(0.18, 0.22, 0.16)
    ground.material_override = mat
    add_child(ground)

func create_house(pos):
    var house = MeshInstance3D.new()
    var mesh = BoxMesh.new()
    mesh.size = Vector3(8, 4, 7)
    house.mesh = mesh
    house.position = pos + Vector3(0, 2, 0)

    var mat = StandardMaterial3D.new()
    mat.albedo_color = Color(0.30, 0.29, 0.24)
    house.material_override = mat
    add_child(house)

func create_trees():
    for i in range(25):
        var tree = MeshInstance3D.new()
        var mesh = CylinderMesh.new()
        mesh.height = 5
        mesh.top_radius = 0.15
        mesh.bottom_radius = 0.3
        tree.mesh = mesh
        tree.position = Vector3(
            randf_range(-40, 40),
            2.5,
            randf_range(-40, -8)
        )

        var mat = StandardMaterial3D.new()
        mat.albedo_color = Color(0.15, 0.20, 0.13)
        tree.material_override = mat
        add_child(tree)
