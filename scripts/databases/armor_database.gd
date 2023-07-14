extends Node

var armors = Array()

func _ready():
	var directory = DirAccess.open("res://resources/armors/")
	directory.list_dir_begin()
	
	var filename = directory.get_next()
	while (filename):
		if not directory.current_is_dir():
			print("res://resources/armors/%s" % filename)  # TODO: remove on prod
			armors.append(load("res://resources/armors/%s" % filename))
		filename = directory.get_next()


func get_armor(armor_name):
	for armor in armors:
		if armor.name == armor_name:
			set_texture(armor)
			return armor
	return null


# !!! After load Armor setup section !!!
func set_texture(a: Armor):
	var spritesheet: Image = load("res://sprites/Armors.png").get_image()
	const exit_rect: Rect2i = Rect2i(0, 0, 192, 64)
	var cropped_image: Image = Image.create(exit_rect.size.x, exit_rect.size.y, false, Image.FORMAT_RGBA8)
	cropped_image.blit_rect(spritesheet, a.texture_region_rect, Vector2i.ZERO)
	a.texture = ImageTexture.create_from_image(cropped_image)
	cropped_image.save_png("res://sprites/armor_test.png")
