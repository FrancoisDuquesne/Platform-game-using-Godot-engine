extends Control


func _on_GoToLevel1Button_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_GoToLevel2Button_pressed():
	get_tree().change_scene("res://World2.tscn")
