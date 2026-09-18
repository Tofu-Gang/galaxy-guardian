extends Area2D

# projectile speed; pixels per second
@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# remove the projectile from the game when it leaves the screen
	queue_free()
