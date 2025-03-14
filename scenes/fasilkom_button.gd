extends Area2D

@export var meteor_path: NodePath  

func _on_body_entered(body):
	if body is CharacterBody2D: 
		var meteor = get_node(meteor_path)
		if meteor:
			meteor.queue_free()  
