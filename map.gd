extends Node2D

@export var shapes: Array[PackedScene] = [
	preload("res://shapes/shape0.tscn"),
	preload("res://shapes/shape1.tscn"),
	preload("res://shapes/shape2.tscn"),
	preload("res://shapes/shape3.tscn")
]

const shapeWidths = [50, 50, 300, 50]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	const map = [3, 2, 1, 0]
	var x = 400
	for i in map:
		var shape_instance = shapes[i].instantiate()
		shape_instance.global_position = Vector2(x, 0)
		get_tree().current_scene.add_child(shape_instance)
		x += shapeWidths[i] + 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
