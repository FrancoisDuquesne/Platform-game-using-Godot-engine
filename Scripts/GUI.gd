extends Control

onready var number_label = $CenterContainer/Label
onready var bar = $Bars/LifeBar/TextureProgress

func _ready():
	var player_max_health = $"../../Characters/Player".max_health
	number_label.text = str(player_max_health)
	bar.max_value = player_max_health
	pass

func _on_Player_health_changed(health):
	update_health(health)
#	print(health)
	pass # replace with function body
	
func update_health(new_value):
	number_label.text = str(new_value)
	bar.value = new_value