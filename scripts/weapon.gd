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
	


func get_weapon_node():
	return weapon_root_node


func set_sprite():
	#weapon_sprite.set_region_rect(weapon_sprite_region_rect)
	#print(weapon_sprite.get_region_rect())
	#weapon_sprite.texture = load("res://sprites/Faces.png")
	pass


func _ready():
	set_sprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
