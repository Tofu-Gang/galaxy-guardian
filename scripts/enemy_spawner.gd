extends Node2D

const ENEMY_SCENE_PATH: String = "res://scenes/enemy.tscn"
const ENEMY_SCENE: PackedScene = preload(ENEMY_SCENE_PATH)

@onready var spawn_position: Node2D = $SpawnPositions/SpawnPos_1

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var enemy: Area2D = ENEMY_SCENE.instantiate()
	enemy.global_position = spawn_position.global_position
	add_child(enemy)
