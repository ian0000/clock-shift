extends AnimatableBody2D

@export var movement: Vector2 = Vector2(150, 0)
@export var speed: float = 80.0
@export var active: bool = true

var start_position: Vector2
var progress: float = 0.0
var direction: float = 0.0

func _ready() -> void:
	start_position = position

func _physics_process(delta: float) -> void:
	if not active:
		return
	
	var distance := movement.length()
	
	if distance == 0.0:
		return
	
	progress += direction * speed * delta / distance
	
	if progress >= 1.0:
		progress = 1.0
		direction = -1.0
	elif progress <= 0.0:
		progress = 0.0
		direction = 1.0
		
	position = start_position + movement * progress
		
