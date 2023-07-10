extends Resource
class_name Armor

@export var defence: int = 0
var armor_id: int = 0
var texture: ImageTexture = null

func _init(armor_id: int):
	self.armor_id = armor_id
	set_texture()


func set_texture():
	var armors: Image = load("res://sprites/Armors.png").get_image()
	const exit_rect: Rect2i = Rect2i(0, 0, 192, 64)
	var armor_crop_rect: Rect2i = Rect2i(0, 64 * self.armor_id, 192, 64)
	var cropped_image: Image = Image.create(exit_rect.size.x, exit_rect.size.y, false, Image.FORMAT_RGBA8)
	cropped_image.blit_rect(armors, armor_crop_rect, Vector2i.ZERO)
	self.texture = ImageTexture.create_from_image(cropped_image)
	cropped_image.save_png("res://sprites/armor_test.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
