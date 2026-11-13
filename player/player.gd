extends CharacterBody2D

signal dead_player

@export var animacion: AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -270.0
#dash vars
const DASH_COOLDOWN = 2.0
const DASH_DURATION = 0.2
const DASH_SPEED = 600.0

var _doble_jump = true
var _dash = true
var _is_dashing = false

#interact w object
var current_interactable:Interactable = null
var _is_dead:bool = false

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if _is_dead:
		return
		
	var was_on_floor := is_on_floor()
	if not was_on_floor:
		velocity += get_gravity() * delta
	else:
		_doble_jump = true

	var jumped := Input.is_action_just_pressed("Jump") and (was_on_floor or _doble_jump)
	if jumped:
		_doble_jump = was_on_floor
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction != 0.0:
		animacion.flip_h = direction < 0.0
	if Input.is_action_just_pressed("Dash") and _dash:
		start_dash(direction)
	if !_is_dashing:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	_update_animation(was_on_floor, jumped)

func _update_animation(was_on_floor: bool, jumped: bool) -> void:
	if not is_on_floor():
		var air_animation := &"jump" if velocity.y < 0.0 else &"fall"
		if jumped and air_animation == &"jump":
			animacion.set_frame_and_progress(0, 0.0)
		if jumped or animacion.animation != air_animation:
			animacion.play(air_animation)
	elif not was_on_floor:
		animacion.play(&"land")
	elif animacion.animation != &"land" or not animacion.is_playing():
		animacion.play(&"idle" if is_zero_approx(velocity.x) else &"run")

func _process(delta: float) -> void:
	if _is_dead:
		return
	if Input.is_action_just_pressed("Interact") and current_interactable != null:
		current_interactable.interact()
		
func start_dash(direction):
	_dash = false
	_is_dashing = true
	velocity.x = direction * DASH_SPEED
	await get_tree().create_timer(DASH_DURATION).timeout
	_is_dashing = false
	await get_tree().create_timer(DASH_COOLDOWN).timeout
	_dash = true

func set_interactable(object:Interactable) -> void:
	current_interactable = object

func clear_interactable(object:Interactable) -> void:
	if current_interactable == object:
		current_interactable = null


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _is_dead:
		return
	_is_dead = true
	await get_tree().create_timer(0.5).timeout
	dead_player.emit()
