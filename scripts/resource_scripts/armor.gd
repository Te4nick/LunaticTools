extends Resource
class_name Armor

enum ObjectClass {Safe, Euclid, Keter, Thaumiel, Appolyon, Archon}

@export var id: int = 0
@export var object_class: ObjectClass = ObjectClass.Safe
@export var name: String = ""

@export var defence: int = 0


# Visuals
@export var texture: Texture = null
@export var texture_region_rect: Rect2 = Rect2(0, 0, 192, 64)
