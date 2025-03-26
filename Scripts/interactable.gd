extends Interactable



func _on_touched(body: Variant) -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	emit_signal("touched")
	#print("this should open the door")
