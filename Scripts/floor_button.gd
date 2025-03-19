extends StaticBody3D

@onready var anim = $AnimationPlayer
signal pressed
signal release


func _on_area_3d_body_entered(body: Node3D) -> void:
	anim.play("pressdown")
	emit_signal("pressed")
	print("on button")


func _on_area_3d_body_exited(body: Node3D) -> void:
	anim.play("pressup")
	emit_signal("release")
	print("off button")
