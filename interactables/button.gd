extends Interactable

signal pressed

func interact() -> void:
	pressed.emit()
