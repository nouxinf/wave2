extends Camera2D

var locked_y: float

func _ready() -> void:
	locked_y = global_position.y

func _process(_delta: float) -> void:
	global_position.y = locked_y
	global_position.x = %Sprite2D.global_position.x + 500
