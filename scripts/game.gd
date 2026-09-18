extends Node2D

const PROJECTILE_SCENE_PATH: String = "res://scenes/projectile.tscn"
const PROJECTILE_SCENE: PackedScene = preload(PROJECTILE_SCENE_PATH)

@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	player.shoot_projectile.connect(_on_player_shoot_projectile)
	
func _on_player_shoot_projectile() -> void:
	var projectile: Area2D = PROJECTILE_SCENE.instantiate()
	projectile.global_position = player.muzzle.global_position
	add_child(projectile)
