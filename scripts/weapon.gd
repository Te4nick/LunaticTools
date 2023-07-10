extends Node2D

class_name Weapon  # Utility Weapon class

@export var melee: bool = true

@export var min_damage: int
@export var max_damage: int
@export var socket_count: int = 0
@export var weapon_id: int = 0

var weapon_scene: PackedScene = preload("res://scenes/items/weapon.tscn")
var weapon_root_node: Node2D = weapon_scene.instantiate()


func _init(weapon_id: int):
	self.weapon_id = weapon_id
	weapon_root_node.util = self


func get_weapon_node() -> Node2D:
	return weapon_root_node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
