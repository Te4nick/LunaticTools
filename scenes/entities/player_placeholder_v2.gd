extends Node2D


@onready var sprites: Array = [
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

func set_texture(string_path: String) -> void:
	var texture = load(string_path)
	if texture.is_class("CompressedTexture2D"):
		for sprite in sprites:
			sprite.texture = texture

# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture("res://sprites/PlayerDummy2.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
