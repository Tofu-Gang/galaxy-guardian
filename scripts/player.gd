extends CharacterBody2D

# ship speed
const SPEED: int = 120

# player input actions
const MOVE_LEFT_ACTION: StringName = "move_left"
const MOVE_RIGHT_ACTION: StringName = "move_right"
const MOVE_UP_ACTION: StringName = "move_up"
const MOVE_DOWN_ACTION: StringName = "move_down"

# viewport bounds
const NEGATIVE_BOUNDS: Vector2 = Vector2(0, 0)
@onready var POSITIVE_BOUNDS: Vector2 = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	move()
	keep_in_viewport()

# move the ship according to player input
func move() -> void:
	var horizontal_direction: float = Input.get_axis(MOVE_LEFT_ACTION, MOVE_RIGHT_ACTION)
	var vertical_direction: float = Input.get_axis(MOVE_UP_ACTION, MOVE_DOWN_ACTION)
	var direction: Vector2 = Vector2(horizontal_direction, vertical_direction).normalized()
	velocity = SPEED * direction
	move_and_slide()

# keep the ship inside the viewport
func keep_in_viewport() -> void:
	if global_position.x < NEGATIVE_BOUNDS.x:
		global_position.x = NEGATIVE_BOUNDS.x
	elif global_position.y < NEGATIVE_BOUNDS.y:
		global_position.y = NEGATIVE_BOUNDS.y
	
	if global_position.x > POSITIVE_BOUNDS.x:
		global_position.x = POSITIVE_BOUNDS.x
	elif global_position.y > POSITIVE_BOUNDS.y:
		global_position.y = POSITIVE_BOUNDS.y
