extends StaticBody3D

@export var direction : Vector3
@export var speed = 2
@export var closetime = 2

var og_pos : Vector3

func _ready() -> void:
	og_pos = position

func opendoor():
	pass
