extends Resource

@export var door_texture: Texture2D
@export var door_text: String
@export_range(1, 100, 1, "or_greater") var next_level: int = 1
