extends Resource
class_name Weapon


enum ObjectClass {Safe, Euclid, Keter, Thaumiel, Appolyon, Archon}

# UI Data
@export var id: int = 0
@export var object_class: ObjectClass = ObjectClass.Safe
@export var name: String = ""

# Stats
@export var melee: bool = true
@export var min_damage: int = 1
@export var max_damage: int = 10
@export var socket_count: int = 0

# Visual Data
@export var texture: Texture = null
@export var texture_region_rect: Rect2 = Rect2(0, 0, 64, 64)
@export var texture_position_offset: Vector2 = Vector2(0, 0)
@export var texture_rotation_degrees: float = 0

var node: Node2D
