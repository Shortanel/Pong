extends CanvasLayer

signal retry
signal exit

func _on_Retry_pressed():
	emit_signal("retry")

func _on_Exit_pressed():
	emit_signal("exit")
