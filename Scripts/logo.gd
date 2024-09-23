extends Node2D



		

func go_title_screen():
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	
	
func _on_animation_player_animation_finished(anim_name):
	go_title_screen()
	pass # Replace with function body.
