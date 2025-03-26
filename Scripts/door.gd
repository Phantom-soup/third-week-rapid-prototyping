extends Node3D

@onready var anim: AnimationNodeStateMachinePlayback

var is_open := false

<<<<<<< HEAD

func _ready() -> void:
	anim = $AnimationTree.get("parameters/playback")

func toggle(_body):
	if is_open == true:
		is_open = false
	else:
		is_open = true
	
	if is_open == true:
		anim.travel("Door_Open")
	if is_open == false:
		anim.travel("Door_Close")


func turnon(body):
	is_open = true
	
	if is_open == true:
		anim.travel("Door_Open")
	if is_open == false:
		anim.travel("Door_Close")


func turnoff(body):
	is_open = false
	
	if is_open == true:
		anim.travel("Door_Open")
	if is_open == false:
		anim.travel("Door_Close")
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
