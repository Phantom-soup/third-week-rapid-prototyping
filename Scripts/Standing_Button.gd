extends CollisionObject3D
class_name Interactable

@export var prompt_message = "Interact"
@export var prompt_input = "Interact"

signal touched(body)

func interact(body):
	touched.emit(body)
	print("Button pushed")
