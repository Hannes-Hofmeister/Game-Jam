extends Control

@export var minutes = 1
var seconds = 0
var dsec = 0
var minLabel
var secLabel
var descLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	# Überprüfe die Pfade zu den Labels
	minLabel = get_node("./Countdown/HBoxContainer/min")
	secLabel = get_node("./Countdown/HBoxContainer/sec")
	descLabel = get_node("./Countdown/HBoxContainer/dsec")
	
	# Überprüfe, ob die Labels erfolgreich gefunden wurden
	if minLabel == null:
		print("Fehler: minLabel nicht gefunden!")
	if secLabel == null:
		print("Fehler: secLabel nicht gefunden!")
	if descLabel == null:
		print("Fehler: descLabel nicht gefunden!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Zähle die Sekunden und Dezisekunden herunter
	if seconds > 0 or dsec > 0:
		dsec -= delta * 10
		if dsec <= 0:
			seconds -= 1
			dsec = 10
	
	# Wenn die Sekunden auf Null fallen und die Dezisekunden ebenfalls Null sind, dekrementiere die Minuten
	if seconds == 0 and dsec <= 0 and minutes > 0:
		minutes -= 1
		seconds = 59
	
	# Aktualisiere die Anzeige der Zeit
	update_time_labels()


# Funktion zur Aktualisierung der Zeit-Labels
func update_time_labels():
	if seconds >= 10:
		secLabel.text = str(seconds)
	else:
		secLabel.text = "0" + str(seconds)
	
	# Begrenze die Dezisekunden auf die ersten zwei Stellen
	descLabel.text = str(dsec).substr(0, 3)
	
	if minutes >= 10:
		minLabel.text = str(minutes)
	else:
		minLabel.text = "0" + str(minutes)

# Handler für das Timer-Timeout-Signal
func _on_timer_timeout():
	# Dekrementiere die Dezisekunden
	dsec -= 1
	# Wenn die Dezisekunden auf 0 fallen, setze sie auf 9 und dekrementiere die Sekunden
	if dsec <= 0:
		dsec = 9
		seconds -= 1
		# Wenn die Sekunden auf 0 fallen, setze sie auf 59 und dekrementiere die Minuten
		if seconds < 0:
			seconds = 59
			minutes -= 1
	
	# Aktualisiere die Zeit-Labels
	update_time_labels()

# Handler für den Button-Pressed-Signal
# Handler für den Button-Pressed-Signal
func _on_button_pressed():
	# Füge 10 Sekunden zur aktuellen Zeit hinzu
	seconds += 10
	
	# Überprüfe, ob die Sekunden größer oder gleich 60 sind
	if seconds >= 60:
		# Reduziere die Sekunden um 60 und erhöhe die Minuten entsprechend
		seconds -= 60
		minutes += 1
	
	# Aktualisiere die Zeit-Labels
	update_time_labels()
