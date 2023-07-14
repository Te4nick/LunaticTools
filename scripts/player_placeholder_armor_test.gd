extends Node2D


@onready var sprites: Array = [  # TODO: create propper Character class
	$Skeleton2D/TorsoBone2D/TorsoSprite2D,
	$Skeleton2D/TorsoBone2D/HeadBone2D/HeadSprite2D,
	$Skeleton2D/TorsoBone2D/HeadBone2D/HeadSprite2D/FaceSprite2D,
	$Skeleton2D/TorsoBone2D/HeadBone2D/HeadSprite2D/HairSprite2D,
	$Skeleton2D/TorsoBone2D/ArmLeftBone2D/ArmLeftSprite2D,
	$Skeleton2D/TorsoBone2D/ArmLeftBone2D/HandLeftBone2D/HandLeftSprite2D,
	$Skeleton2D/TorsoBone2D/ArmRightBone2D/ArmRightSprite2D,
	$Skeleton2D/TorsoBone2D/ArmRightBone2D/HandRightBone2D/HandRightSprite2D,
	$Skeleton2D/TorsoBone2D/LegLeftBone2D/LegLeftSprite2D,
	$Skeleton2D/TorsoBone2D/LegLeftBone2D/FootLeftBone2D/FootLeftSprite2D,
	$Skeleton2D/TorsoBone2D/LegRightBone2D/LegRightSprite2D,
	$Skeleton2D/TorsoBone2D/LegRightBone2D/FootRightBone2D/FootRightSprite2D,
]
	
@onready var armor_sprites: Array = [  # TODO: add hands and feet
	$Skeleton2D/TorsoBone2D/ArmorTorsoSprite2D,
	$Skeleton2D/TorsoBone2D/HeadBone2D/HeadSprite2D/ArmorHeadSprite2D,
	$Skeleton2D/TorsoBone2D/ArmLeftBone2D/ArmorArmLeftSprite2D,
	$Skeleton2D/TorsoBone2D/ArmRightBone2D/ArmorArmRightSprite2D,
	$Skeleton2D/TorsoBone2D/LegLeftBone2D/ArmorLegLeftSprite2D,
	$Skeleton2D/TorsoBone2D/LegRightBone2D/ArmorLegRightSprite2D,
	$Skeleton2D/TorsoBone2D/ArmLeftBone2D/HandLeftBone2D/ArmorHandLeftSprite2D,
	$Skeleton2D/TorsoBone2D/ArmRightBone2D/HandRightBone2D/ArmorHandRightSprite2D,
	$Skeleton2D/TorsoBone2D/LegLeftBone2D/FootLeftBone2D/ArmorFootLeftSprite2D,
	$Skeleton2D/TorsoBone2D/LegRightBone2D/FootRightBone2D/ArmorFootRightSprite2D,
]

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var data: Character
var _weapon_node_exist: bool = false


func set_data(char_data: Character):
	self.data = char_data
	set_texture(data.texture)
	set_weapon(WeaponDatabase.get_weapon(self.data.weapon.name))
	set_armor(ArmorDatabase.get_armor(self.data.armor.name))
	


func set_texture_path(string_path: String) -> void:
	print(string_path)
	var texture = load(string_path)
	if texture.is_class("CompressedTexture2D"):
		for sprite in sprites:
			sprite.texture = texture


func set_texture(texture: Texture) -> void:
	for sprite in sprites:
		sprite.texture = texture


func play_animation(name: StringName):
	self.animation_player.play(name)


func create_random_skin(merged_image_name: String) -> ImageTexture:  # TODO: relocate to utility class
	# Load pixelmaps
	var faces: Image = load("res://sprites/Faces.png").get_image()
	var hairs: Image = load("res://sprites/Hairs.png").get_image()
	var heads: Image = load("res://sprites/Heads.png").get_image()
	var outfits: Image = load("res://sprites/Outfits.png").get_image()
	
	# Define Important values
	const big_crop_rect: Rect2i = Rect2i(0, 0, 64, 64)
	const limb_crop_rect: Rect2i = Rect2i(0, 0, 32, 44)
	const small_crop_rect: Rect2i = Rect2i(0, 0, 32, 20)
	const exit_rect: Rect2i = Rect2i(0, 0, 160, 128)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var cropped_image: Image = Image.create(exit_rect.size.x, exit_rect.size.y, false, Image.FORMAT_RGBA8)
	
	# Crop Face and Hand
	var head_count: int = heads.get_height() / big_crop_rect.size.y
	var hair_count: int = hairs.get_height() / big_crop_rect.size.y
	var face_count: int = faces.get_height() / big_crop_rect.size.y
	var outfit_count: int = outfits.get_height() / big_crop_rect.size.y
	var rng_offset: int = rng.randi_range(0, head_count-1)
	
	#  Adding Head
	cropped_image.blit_rect(heads,  # Src Image (ADDING HEAD)
		Rect2i(  # Src image crop rect
			Vector2i(0, rng_offset * big_crop_rect.size.y),  # Setting random position
			big_crop_rect.size  # Setting size
		), 
		Vector2i.ZERO)  # Dst image paste coords
		
	# Adding Hand
	cropped_image.blit_rect(heads,  # Src Image (ADDING HAND)
		Rect2i(  # Src image crop rect
			Vector2i(big_crop_rect.size.x, rng_offset * big_crop_rect.size.y),  # Setting random position
			small_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x * 2, limb_crop_rect.size.y))  # Dst image paste coords
	
	# Adding Hair
	rng_offset = rng.randi_range(0, hair_count-1)
	cropped_image.blit_rect(hairs,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(0, rng_offset * big_crop_rect.size.y),  # Setting random position
			big_crop_rect.size  # Setting size
		), 
		Vector2i(0, big_crop_rect.size.y))  # Dst image paste coords
	
	# Adding Face
	rng_offset = rng.randi_range(0, face_count-1)
	cropped_image.blit_rect(faces,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(0, rng_offset * big_crop_rect.size.y),  # Setting random position
			big_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x, big_crop_rect.size.y))  # Dst image paste coords
	
	# Adding Torso
	rng_offset = rng.randi_range(0, outfit_count-1)
	cropped_image.blit_rect(outfits,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(0, rng_offset * big_crop_rect.size.y),  # Setting random position
			big_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x, 0))  # Dst image paste coords
	
	# Adding Arm
	cropped_image.blit_rect(outfits,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(big_crop_rect.size.x, rng_offset * big_crop_rect.size.y),  # Setting random position
			limb_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x * 2, 0))  # Dst image paste coords
	
	# Adding Leg
	cropped_image.blit_rect(outfits,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(big_crop_rect.size.x + limb_crop_rect.size.x, rng_offset * big_crop_rect.size.y),  # Setting random position
			limb_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x * 2, big_crop_rect.size.y))  # Dst image paste coords
	
	# Adding Foot
	cropped_image.blit_rect(outfits,  # Src Image
		Rect2i(  # Src image crop rect
			Vector2i(big_crop_rect.size.x + limb_crop_rect.size.x, rng_offset * big_crop_rect.size.y + limb_crop_rect.size.y),  # Setting random position
			small_crop_rect.size  # Setting size
		), 
		Vector2i(big_crop_rect.size.x * 2, big_crop_rect.size.y + limb_crop_rect.size.y))  # Dst image paste coords
	
	cropped_image.save_png("res://sprites/" + merged_image_name)
	load("res://sprites/" + merged_image_name)
	return ImageTexture.create_from_image(cropped_image)


func get_weapon() -> Weapon:
	return self.data.weapon


func set_weapon(weapon: Weapon) -> void:
	if weapon:
		self.remove_weapon()
		self.data.weapon = weapon
		$Skeleton2D/TorsoBone2D/ArmLeftBone2D/HandLeftBone2D.add_child(self.data.weapon.node)
		_weapon_node_exist = true
	return


func remove_weapon() -> void:
	if self.data.weapon and _weapon_node_exist:
		$Skeleton2D/TorsoBone2D/ArmLeftBone2D/HandLeftBone2D.remove_child(self.data.weapon.node)
		_weapon_node_exist = false
		self.data.weapon = null
	return


func get_armor() -> Armor:
	return self.data.armor


func set_armor(armor: Armor) -> void:
	if armor:
		self.remove_armor()
		self.data.armor = armor
		for piece in armor_sprites:
			piece.texture = armor.texture
	return


func remove_armor() -> void:
	if self.data.armor:
		for piece in armor_sprites:
			piece.texture = null
		self.data.armor = null
	return


# Called when the node enters the scene tree for the first time.
func _ready():
	#set_texture_path("res://sprites/PlayerDummy2.png")
	#set_texture(create_random_skin("testing1.png"))
	#set_weapon(Weapon.new(1))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
