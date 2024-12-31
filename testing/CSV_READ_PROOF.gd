extends Control

var CSV_BUILDM_CARDS = "res://assets/buildm_cards.csv"

func _ready():
	var data = read_csv(CSV_BUILDM_CARDS)
	if data.size() > 0:
		var cell_a1 = data[0][0] # First row, first column
		update_label(cell_a1)
	else:
		print ("CSV is empty or does not have enough data.")

func read_csv(file_path):
	var file = File.new()
	var result = []
	if file.file_exists(file_path):
		file.open(file_path, File.READ)
		while not file.eof_reached():
			var line = file.get_line().strip_edges()
			if line != "":
				var values = line.split(",")
				result.append(values)
		file.close()
	else:
			print("File does not exist.")
	return result

func parse_csv(content):
	var result = []
	var lines = content.split("\n")
	for line in lines:
		if line.strip_edges() != "":
			var values = line.split(",")
			result.append(values)
	return result

func update_label(text):
	var label = get_node("Label")
	label.text = text
