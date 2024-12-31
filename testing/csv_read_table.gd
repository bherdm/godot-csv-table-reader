extends Control

var rows = 10
var columns = 10

func _ready() -> void:
	var hbox = HBoxContainer.new()
	add_child(hbox)
	
	for row in rows:
		var vbox = VBoxContainer.new()
		hbox.add_child(vbox)
		for column in columns:
			var label = Label.new()
			label.text = $CSV_READER.open_read_CSV(column, row)
			vbox.add_child(label)
