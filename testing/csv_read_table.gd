extends Control

var rows = 10
var columns = 10

func _ready():
	var hbox = HBoxContainer.new()
	add_child(hbox)
	
	for row in range(rows):
		var vbox = VBoxContainer.new()
		hbox.add_child(vbox)
		for column in range(columns):
			var label = Label.new()
			label.text = get_node("CSV_READER").read_csv(column, row)
			vbox.add_child(label)
