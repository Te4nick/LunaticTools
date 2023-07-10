extends Node2D

@onready var player: Node2D = $Character

# Called when the node enters the scene tree for the first time.
func _ready():
	player.set_texture(player.create_random_skin("testing1.png"))
	player.set_weapon(Weapon.new(1))
	player.set_armor(Armor.new(1))
	#player.remove_armor()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.play_animation("run")
