extends Node

@export var niveles: Array[PackedScene]
var _current_level: int = 1
var _instance_level: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_create_level(_current_level)
	
func _create_level(level_number: int) -> void:
	_current_level = level_number
	_instance_level = niveles[level_number - 1].instantiate()
	add_child(_instance_level)
	var childs := _instance_level.get_children()
	for i in childs.size():
		if childs[i].is_in_group("player"):
			childs[i].dead_player.connect(_restart_level)
			break
			
func _erase_level():
	_instance_level.queue_free()

func  _restart_level():
	_erase_level()
	_create_level.call_deferred(_current_level)

func _change_level(level_number: int) -> void:
	_erase_level()
	_create_level(level_number)
	
