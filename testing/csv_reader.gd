extends Node

var CSV_BUILDM_CARDS = "res://assets/buildm_cards.csv"
@onready var label: Label = $Label

func open_CSV():
	var file = FileAccess.open(CSV_BUILDM_CARDS,FileAccess.READ)
	if file:
		var content = file.get_as_text()
		file.close()
		var csv_data = parse_csv(content)
		return csv_data
	else:
		print("File does not exist or cannot be opened.")

func open_read_CSV(X, Y):
	var csv_data = open_CSV()
	if len(csv_data) > X and len(csv_data[X]) > Y:
		var cell_a1 = csv_data[X][Y]
		return cell_a1
	else:
		print("CSV is empty or does not have enough data.")

func parse_csv(content):
	var result = []
	var lines = content.split("\n")
	for line in lines:
		if line.strip_edges() != "":
			var values = line.split(",")
			result.append(values)
	return result
