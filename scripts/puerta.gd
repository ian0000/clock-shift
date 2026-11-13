extends Interactable

signal level_requested(level_number: int)

@export_range(1, 100, 1, "or_greater") var next_level: int 
@export var door_text:String = "Exit"
@export var door_texture:Texture2D

@onready var door_label: Label = $Indicator/Label
@onready var door_sprite: Sprite2D = $Indicator/Background

func _ready() -> void:
	add_to_group("level_doors")
	update_visual()

func interact() -> void:
	if is_instance_valid(player_nearby):
		level_requested.emit(next_level)
		
func update_visual() -> void:
	door_label.text = door_text
	if door_texture != null:
		door_sprite.texture = door_texture
