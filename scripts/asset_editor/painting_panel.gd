extends ColorRect

@onready var mask_toggle: CheckButton = $EditorButtons/MaskToggle
@onready var template_toggle: CheckButton = $EditorButtons/TemplateToggle

@onready var mask: TextureRect = $TextureMask
@onready var template: TextureRect = $TextureMask/TextureTemplate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mask_toggle_toggled(button_pressed):
	if button_pressed:
		mask.texture  # TODO: continue dev
		
