extends Node2D

@onready var sprite: Sprite2D = $WeaponSprite2D

var weapon_sprite_region_rect: Rect2 = Rect2(0, 64 * 0, 64, 64)
var util: Weapon

func set_visuals():
	self.util = get_tree().get_root().get_node("Character").get_weapon()
	sprite.region_rect = Rect2(0, 64 * self.util.weapon_id, 64, 64)
	


# Called when the node enters the scene tree for the first time.
func _ready():
	set_visuals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
