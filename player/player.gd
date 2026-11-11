extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#dash vars
const DASH_COOLDOWN = 2.0
const DASH_DURATION = 0.2
const DASH_SPEED = 900.0

var _doble_jump = true
var _dash = true
var _is_dashing = false

#interact w object
var current_interactable:Interactable = null

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		_doble_jump = true
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#doble jump
	elif Input.is_action_just_pressed("ui_accept") and _doble_jump:
		_doble_jump = false
		velocity.y = JUMP_VELOCITY
		 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("Dash") and _dash:
		start_dash(direction)
		
	if !_is_dashing:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	#dash

	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and current_interactable != null:
		print("interaccion")
		
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
