extends Node2D

@onready var player: Node2D = $Character

# Called when the node enters the scene tree for the first time.
func _ready():
	player.set_data(preload("res://resources/characters/placeholder_character.tres"))
	player.set_texture(player.create_random_skin("testing.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#player.play_animation("run")
	pass
