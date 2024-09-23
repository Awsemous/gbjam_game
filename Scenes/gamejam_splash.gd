extends Node2D



		

func go_logo_screen():
	get_tree().change_scene_to_file("res://Scenes/logo.tscn")
	
	

func _on_animation_player_animation_finished(anim_name):
	go_logo_screen()
	pass
	
