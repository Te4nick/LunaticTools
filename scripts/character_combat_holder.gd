extends Control

@export var data: Character

@onready var character: Node2D = $Character
@onready var name_display: Label = find_child("NameDisplay")
# HP
@onready var hp_bar: ProgressBar = find_child("HpBar")
@onready var current_hp: Label = find_child("CurrentHp")
# SP
@onready var sp_bar: ProgressBar = find_child("SpBar")
@onready var current_sp: Label = find_child("CurrentSp")

func test_setup():
	name_display.text = data.name
	hp_bar.max_value = data.max_hp
	sp_bar.max_value = data.max_sp
	update_hp()
	update_sp()
	

"""
Updates Character hp and displays updated values. Positive hp values decreases current hp, negative - increases
"""
func update_hp(hp: int = 0):
	data.current_hp = max(min(data.current_hp - hp, data.max_hp), 0)
	
	hp_bar.value = data.current_hp
	current_hp.text = str(data.current_hp)


"""
Updates Character sp and displays updated values. Positive sp values decreases current sp, negative - increases
"""
func update_sp(sp: int = 0):
	data.current_sp = max(min(data.current_sp - sp, data.max_sp), 0)
	
	sp_bar.value = data.current_sp
	current_sp.text = str(data.current_sp)


# Called when the node enters the scene tree for the first time.
func _ready():
	data = load("res://resources/characters/placeholder_character.tres")
	character.set_data(data)
	test_setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mouse_left_click"):
		update_hp(20)
	if Input.is_action_pressed("mouse_left_click"):
		update_hp(-20)


func _input(event):  # TODO: remove on prod
	if event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			update_hp(20)
			print("HP: ", data.current_hp)
		if event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			update_hp(-10)
			print("HP: ", data.current_hp)
		if event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN:
			update_sp(5)
			print("SP: ", data.current_sp)
		if event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_UP:
			update_sp(-5)
			print("SP: ", data.current_sp)
