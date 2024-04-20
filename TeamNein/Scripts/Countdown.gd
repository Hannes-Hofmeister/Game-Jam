extends Label

var minutes = 2
var seconds = 0
var dsec = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if seconds > 0 and dsec <= 0 :
		seconds -=1
		dsec = 10
	if minutes > 0 and seconds <= 0:
		minutes -= 1
		seconds = 59
		
	if seconds >= 10:
		$sec.set_text(str(seconds))
	else:
		$sec.set_text("0" + str(seconds))
	if dsec >= 10:
		$dsec.set_text(str(dsec))
	else:
		$dsec.set_text("0" + str(dsec))
	if minutes >= 1:
		$min.set_text(str(minutes))
	else:
		$min.set_text("0" + str(minutes))



func _on_timer_timeout():
	dsec -= 1


func _on_button_pressed():
	if seconds+10 >= 60:
		seconds = 60-seconds
		minutes +=1
	elif seconds + 10 < 60:
		seconds += 10
	pass # Replace with function body.
	
