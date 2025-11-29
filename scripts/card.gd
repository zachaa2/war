extends Node2D

@export var suit := GameManager.CardSuit.SPADE
@export var value := 0
@export var flipped: bool = false

func get_texture(texture_suit: GameManager.CardSuit, texture_val: int):
	if flipped:
		return preload("res://assets/cards/back/00_back.png")
	
	assert (texture_val >= 0 and texture_val <= 12)
	var path = ""
	if texture_suit == GameManager.CardSuit.DIAMOND:
		path = "res://assets/cards/diamonds/%02d_diamonds.png" % texture_val
	elif texture_suit == GameManager.CardSuit.CLUB:
		path = "res://assets/cards/clubs/%02d__1.png" % texture_val
	elif texture_suit == GameManager.CardSuit.HEART:
		path = "res://assets/cards/hearts/%02d_3.png" % texture_val
	elif texture_suit == GameManager.CardSuit.SPADE:
		path = "res://assets/cards/spades/%02d_4.png" % texture_val
	else: # ERROR
		path = ""
	return load(path)
	
func update_sprite():
	$CardSprite.texture = get_texture(suit, value)

func flip():
	# TODO: should have an actual flip animation using the animation player or something
	flipped = !flipped
	update_sprite()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_sprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
