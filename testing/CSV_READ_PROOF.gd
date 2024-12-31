extends Control

var CSV_BUILDM_CARDS = "res://assets/buildm_cards.csv"
@onready var label: Label = $Label

func _ready() -> void:
	var file = FileAccess.open(CSV_BUILDM_CARDS,FileAccess.READ)
	if file:
		var content = file.get_as_text()
		file.close()
		var csv_data = parse_csv(content)
		if len(csv_data) > 0 and len(csv_data[0]) > 0:
			var cell_a1 = csv_data[0][0]
			update_label(cell_a1)
		else:
			print("CSV is empty or does not have enough data.")
	else:
		print("File does not exist or cannot be opened.")

func parse_csv(content):
	var result = []
	var lines = content.split("\n")
	for line in lines:
		if line.strip_edges() != "":
			var values = line.split(",")
			result.append(values)
	return result

func update_label(text):
	label.text = text
