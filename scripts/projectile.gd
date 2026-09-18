extends Area2D

# frames per second
@export var speed: float = 5.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position.x += speed
