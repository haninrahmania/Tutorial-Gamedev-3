extends Area2D



@onready var audio_player = $AudioStreamPlayer2D


	

func _on_body_entered(body):
	if body is CharacterBody2D:  
		audio_player.play()
