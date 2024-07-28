extends Node2D
var rng = RandomNumberGenerator.new()

const options = ["The Coconut Tree",
"The Flamingo",
"Two Birds",
"Baker's Dozen",
"The Sloth",
"The Teacup",
"Lonely Giraffe",
"The Leaping Lizards",
"Mary Poppins",
"Housecat's Pride",
"Grandfather Clock",
"Goat's Smile",
"Cinderella's Shoe",
"Hitchcock's Chariot",
"Seashell Belt",
"The Broken Umbrella",
"Pot O'Honey",
"The Night Goose",
"Larry the Chief Mouser",
"Big Piano Man",
"The Washing Machine",
]

func _ready():
	for i in range(0, 50):
		$Constellation.add_star(Vector2(rng.randf_range(-250.0, 250.0), rng.randf_range(-250.0, 250.0)))
	$Challenge.text = "You have been assigned: " + options.pick_random()
