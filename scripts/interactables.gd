class_name Interactable
extends Node

var player_nearby: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("interactables")

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("player"):
		player_nearby = body
		body.set_interactable(self)

func _on_body_exited(body:Node2D) -> void:
	if body == player_nearby:
		player_nearby = null
		body.clear_interactable(self) 
