extends CharacterBody2D

# ship speed; pixels per second
@export var speed: int = 120

# player input actions
const MOVE_LEFT_ACTION: StringName = "move_left"
const MOVE_RIGHT_ACTION: StringName = "move_right"
const MOVE_UP_ACTION: StringName = "move_up"
const MOVE_DOWN_ACTION: StringName = "move_down"
const SHOOT_ACTION: StringName = "shoot"

# ship animations
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const ANIMATION_DEFAULT: StringName = "default"
const ANIMATION_UP: StringName = "up"
const ANIMATION_DOWN: StringName = "down" 

# custom signals
signal shoot_projectile

# ship muzzle; position of projectiles spawn
@onready var muzzle: Marker2D = $Muzzle

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(SHOOT_ACTION):
		shoot()

func _physics_process(_delta: float) -> void:
	move()

func shoot() -> void:
	shoot_projectile.emit()

# move the ship according to player input; keeps the ship inside the viewport
func move() -> void:
	# compute the ship velocity according to player input
	var horizontal_direction: float = Input.get_axis(MOVE_LEFT_ACTION, MOVE_RIGHT_ACTION)
	var vertical_direction: float = Input.get_axis(MOVE_UP_ACTION, MOVE_DOWN_ACTION)
	var direction: Vector2 = Vector2(horizontal_direction, vertical_direction).normalized()
	velocity = speed * direction
	
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
