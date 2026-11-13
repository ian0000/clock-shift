extends Node

signal update_death
signal start_timer

var death_count: int = 0
var level: int
var phase: int
var time:float 
var items: Array

func death_add():
	death_count += 1
	update_death.emit()

func collect_item(name:String):
	if items.has(name) :
		return 
	else:
		items.push_back(name)
	start_timer_signal()

func start_timer_signal():
	if items.size() == 4:
		start_timer.emit()
		
func change_phase():
	if phase < 3:
		phase += 1
	else:
		phase = 0

func auto_phase_change():
	if items.size() > 3:
		change_phase()
