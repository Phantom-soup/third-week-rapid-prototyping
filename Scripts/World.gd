extends Node3D

@onready var door1 = $Door


func _on_standing_button_touched() -> void:
	pass


func _on_floor_button_pressed() -> void:
	door1.open_door_temp()


func _on_floor_button_release() -> void:
	door1.close_door_temp()
