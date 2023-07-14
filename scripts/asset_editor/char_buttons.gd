extends HBoxContainer

@onready var character: Node2D = $"../ColorRect/Character"
@onready var armor: Armor = ArmorDatabase.get_armor("D Class robe")
@onready var weapon: Weapon = WeaponDatabase.get_weapon("DubstepGun")

# Called when the node enters the scene tree for the first time.
func _ready():
	character.set_data(load("res://resources/characters/placeholder_character.tres"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_armor_toggle_toggled(button_pressed):
	if button_pressed:
		character.set_armor(armor)
	else:
		character.remove_armor()


func _on_weapon_toggle_toggled(button_pressed):
	if button_pressed:
		character.set_weapon(weapon)
	else:
		character.remove_weapon()


func _on_screen_resized():
	
	if character != null:
		print(DisplayServer.window_get_size())
		var screen_size = DisplayServer.window_get_size()
		character.position = Vector2(screen_size.x - 152, 194)
		print("CHAR: ", character.position)
		
	pass # Replace with function body.
