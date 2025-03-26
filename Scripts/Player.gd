extends CharacterBody3D

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var interaction = $Head/Camera3D/Interaction
@onready var hand = $Head/Camera3D/Hand

#Movement
@export var speed = 5.0
@export var accel = 16.0
@export var jump = 4.5
const sensitivity = 0.007

#Interactions
var picked_object
var pull_power = 4


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func pickup_object():
	var collider = interaction.get_collider()
	if collider != null and collider is RigidBody3D:
		picked_object = collider

func drop_object():
	if picked_object != null:
		picked_object = null

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interaction"):
		if picked_object == null:
			pickup_object()
		elif picked_object != null:
			drop_object()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump
	
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (head.transform.basis * transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * speed, accel * delta)
		velocity.z = lerp(velocity.z, direction.z * speed, accel * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, accel * delta)
		velocity.z = lerp(velocity.z, 0.0, accel * delta)
	
	move_and_slide()
	
	if picked_object != null:
		var a = picked_object.global_transform.origin
		var b = hand.global_transform.origin
		picked_object.set_linear_velocity((b-a) * pull_power)
