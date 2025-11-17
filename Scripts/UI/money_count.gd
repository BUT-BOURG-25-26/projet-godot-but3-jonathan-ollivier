extends Control
class_name MoneyCount

@export var label: Label
@export var delta_label: Label
@export var delta_timer: Timer
@export var sound: AudioStreamPlayer3D

func _ready() -> void:
	Game.instance.money.observe(update)

func update(old, new):
	label.text = "%.2f$" % new
	if new != old:
		sound.play()
		
		var color = Color.GREEN if new > old else Color.RED
		var sign = "+" if new > old else ""
		delta_label.text = sign + "%.2f$" % (new - old)
		delta_timer.start()
		delta_label.add_theme_color_override("font_color", color)
		
func _on_delta_timer_timeout() -> void:
	delta_label.text = ""
