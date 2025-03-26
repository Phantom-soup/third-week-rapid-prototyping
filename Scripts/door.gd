extends Node3D

@onready var anim: AnimationNodeStateMachinePlayback

var is_open := false


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
