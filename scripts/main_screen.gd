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
	for door in get_tree().get_nodes_in_group("level_doors"):
		if _instance_level.is_ancestor_of(door):
			door.level_requested.connect(_change_level)
			
func _erase_level():
	_instance_level.queue_free()

func  _restart_level():
	_erase_level()
	_create_level.call_deferred(_current_level)

func _change_level(level_number: int) -> void:
	if level_number < 1 or level_number > niveles.size() or niveles[level_number - 1] == null:
		level_number = 1
	if _instance_level.is_queued_for_deletion():
		return
	_erase_level()
	_create_level.call_deferred(level_number)
	
