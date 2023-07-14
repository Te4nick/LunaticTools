extends Node2D

@onready var sprite: Sprite2D = $WeaponSprite2D

var util: Weapon

func set_visuals():
	#self.util = get_tree().get_root().get_node("Character").get_weapon()
	sprite.region_rect = util.texture_region_rect
	sprite.position = util.texture_position_offset
	sprite.rotation_degrees = util.texture_rotation_degrees
	


# Called when the node enters the scene tree for the first time.
func _ready():
	set_visuals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
