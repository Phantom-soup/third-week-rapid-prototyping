extends StaticBody3D

@export var direction : Vector3
@export var speed = 2
@export var closetime = 2

var og_pos : Vector3
var new_pos : Vector3
@export var pos_offset = 100

func _ready() -> void:
	og_pos = position
	new_pos = Vector3(position.x, position.y + pos_offset, position.z)

func open_door_timer():
	pass


func open_door_temp(delta):
	position = position.move_toward(new_pos, delta * speed)


func close_door_temp(delta):
	position = position.move_toward(og_pos, delta * speed)
