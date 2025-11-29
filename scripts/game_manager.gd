extends Node

enum CardSuit {
	CLUB,
	HEART,
	DIAMOND,
	SPADE,
}

# TODO: This should actually be 3 deck nodes, 
# which should handle all shuffle, push and pop functionality
var deck = []
var my_deck = []
var cpu_deck = []
