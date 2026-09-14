extends CharacterBody2D

const SPEED: int = 120
const MOVE_LEFT_ACTION: StringName = "move_left"
const MOVE_RIGHT_ACTION: StringName = "move_right"
const MOVE_UP_ACTION: StringName = "move_up"
const MOVE_DOWN_ACTION: StringName = "move_down"

func _physics_process(_delta: float) -> void:
	var horizontal_direction: float = Input.get_axis(MOVE_LEFT_ACTION, MOVE_RIGHT_ACTION)
	var vertical_direction: float = Input.get_axis(MOVE_UP_ACTION, MOVE_DOWN_ACTION)
	var direction: Vector2 = Vector2(horizontal_direction, vertical_direction).normalized()
	velocity = SPEED * direction
	move_and_slide()
