extends CharacterBody2D

const SPEED = 200.0 # pixels per second
const ANGLE = PI / 4.0

var running = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var game_over: Label = %GameOver
@onready var click_anywhere_text: Label = %ClickAnywhereText
@onready var player_collision_area: Area2D = %PlayerCollisionArea

func _physics_process(_delta: float) -> void:
	if !running:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			running = true
			click_anywhere_text.visible = false
	if running:
		var dir := -ANGLE if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) else ANGLE
		velocity = Vector2.RIGHT.rotated(dir) * SPEED
		sprite.rotation = dir + PI / 2
		move_and_slide()


func _on_collision_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacles"):
		print("collision")
		%GameOver.visible = true
		running = false
