extends CharacterBody2D

const SPEED = 200.0 # pixels per second
const ANGLE = PI / 4.0

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(_delta: float) -> void:
	var dir := -ANGLE if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) else ANGLE
	velocity = Vector2.RIGHT.rotated(dir) * SPEED
	sprite.rotation = dir + PI / 2
	move_and_slide()
	# if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# print(global_position)


func _on_collision_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacles"):
		print("collision")
