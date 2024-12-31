extends Node

var CSV_BUILDM_CARDS = "res://assets/buildm_cards.csv"

func read_csv(X, Y):
	var data = open_csv()
	if data.size() > 0:
		var cell_a1 = data[X][Y] # First row, first column
		return cell_a1
	else:
		print ("CSV is empty or does not have enough data.")


func open_csv():
	var file_path = CSV_BUILDM_CARDS
	
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
