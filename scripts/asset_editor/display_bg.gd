extends ColorRect

@onready var color_picker: ColorPickerButton = $ColorPickerButton
@onready var picker_label: Label = $ColorPickerButton/PickerLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	picker_label.modulate = Color(0, 0, 0, 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_color_picker_button_color_changed(color):
	self.color = color
	picker_label.modulate = Color(1-color.r, 1-color.g, 1-color.b, 1)
