extends Node2D

var test_front_deck = []
var test_back_deck = []

func create_front_facing_deck():
	var ctr := 0
	for suit in GameManager.CardSuit.keys():
		for val in range(13):
			var card = preload("res://scenes/card.tscn").instantiate()
			card.suit = GameManager.CardSuit.get(suit)
			card.value = val
			card.position = get_viewport_rect().size / 2.0 + Vector2((ctr * 15) - 500, 0)
			card.z_index = ctr
			test_front_deck.append(card)
			ctr += 1
	seed(42)
	test_front_deck.shuffle()
	
func create_back_facing_deck():
	var ctr := 0
	for suit in GameManager.CardSuit.keys():
		for val in range(13):
			var card = preload("res://scenes/card.tscn").instantiate()
			card.suit = GameManager.CardSuit.get(suit)
			card.value = val
			card.flipped = true
			card.position = get_viewport_rect().size / 2.0 + Vector2((ctr * 15) - 500, 145)
			card.z_index = ctr
			test_back_deck.append(card)
			ctr += 1
	seed(42)
	test_back_deck.shuffle()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_front_facing_deck()
	for card in test_front_deck:
		add_child(card)
		
	create_back_facing_deck()
	for card in test_back_deck:
		add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
