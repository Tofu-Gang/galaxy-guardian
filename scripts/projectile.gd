extends Area2D

# projectile speed; pixels per second
@export var speed: float = 300.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
