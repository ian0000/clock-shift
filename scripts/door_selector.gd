extends Node2D

const DoorOption = preload("res://scripts/door_option.gd")

@export var doors: Array[DoorOption]

@onready var _door = $DoorVisual/Puerta

var _selected_index := 0

func _ready() -> void:
	if not doors.is_empty():
		_apply_selection()

func select_next() -> void:
	if doors.is_empty():
		return
	_selected_index = (_selected_index + 1) % doors.size()
	_apply_selection()

func _apply_selection() -> void:
	var option := doors[_selected_index]
	_door.door_text = option.door_text
	_door.door_texture = option.door_texture
	_door.next_level = option.next_level
	_door.update_visual()
