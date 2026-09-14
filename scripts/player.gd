extends CharacterBody2D

# ship speed
const SPEED: int = 120

# player input actions
const MOVE_LEFT_ACTION: StringName = "move_left"
const MOVE_RIGHT_ACTION: StringName = "move_right"
const MOVE_UP_ACTION: StringName = "move_up"
const MOVE_DOWN_ACTION: StringName = "move_down"

# ship animations
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const ANIMATION_DEFAULT: StringName = "default"
const ANIMATION_UP: StringName = "up"
const ANIMATION_DOWN: StringName = "down" 

func _physics_process(_delta: float) -> void:
	move()

# move the ship according to player input; keeps the ship inside the viewport
func move() -> void:
	# compute the ship velocity according to player input
	var horizontal_direction: float = Input.get_axis(MOVE_LEFT_ACTION, MOVE_RIGHT_ACTION)
	var vertical_direction: float = Input.get_axis(MOVE_UP_ACTION, MOVE_DOWN_ACTION)
	var direction: Vector2 = Vector2(horizontal_direction, vertical_direction).normalized()
	velocity = SPEED * direction
	
	if vertical_direction < 0:
		animation_player.play(ANIMATION_UP)
	elif vertical_direction > 0:
		animation_player.play(ANIMATION_DOWN)
	else:
		animation_player.play(ANIMATION_DEFAULT)
		
	# move the ship in the direction according to player input
	move_and_slide()
	# keep the ship inside the viewport
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
