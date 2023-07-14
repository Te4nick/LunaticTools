extends Node

var weapons = Array()
var weapon_scene: PackedScene = preload("res://scenes/items/weapon.tscn")

func _ready():
	var directory = DirAccess.open("res://resources/weapons/")
	directory.list_dir_begin()
	
	var filename = directory.get_next()
	while (filename):
		if not directory.current_is_dir():
			print("res://resources/weapons/%s" % filename)  # TODO: remove on prod
			weapons.append(load("res://resources/weapons/%s" % filename))
		filename = directory.get_next()


func get_weapon(weapon_name):
	for weapon in weapons:
		if weapon.name == weapon_name:
			set_texture(weapon)
			return weapon
	return null


# !!! After load weapon setup section !!!
func set_texture(w: Weapon):
	var spritesheet: Image = load("res://sprites/Weapons.png").get_image()
	const exit_rect: Rect2i = Rect2i(0, 0, 64, 64)
	var cropped_image: Image = Image.create(exit_rect.size.x, exit_rect.size.y, false, Image.FORMAT_RGBA8)
	cropped_image.blit_rect(spritesheet, w.texture_region_rect, Vector2i.ZERO)
	w.texture = ImageTexture.create_from_image(cropped_image)
	
	# Adding weapon_scene to Weapon class_name object
	w.node = weapon_scene.instantiate()
	w.node.util = w
