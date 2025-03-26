extends StaticBody3D

@onready var anim = $AnimationPlayer
var pressing = 0

signal press(body)
signal release(body)


func _on_area_3d_body_entered(body: Node3D) -> void:
	pressing += 1
	
	if pressing > 0:
		anim.play("pressdown")
		press.emit(body)
		print("on button")


func _on_area_3d_body_exited(body: Node3D) -> void:
	pressing =- 1
	
	if pressing <= 0: 
		anim.play("pressup")
		release.emit(body)
		print("off button")

func _process(delta: float) -> void:
	if pressing == -1:
		pressing = 0
	
	print("Press value: " + str(pressing))
