extends ParallaxBackground

onready var projectResolution = get_viewport().get_visible_rect().size
onready var sky = get_node("sky")
onready var Cloud1 = get_node("Clouds/Cloud1")
onready var Cloud2 = get_node("Clouds/Cloud2")
onready var Cloud3 = get_node("Clouds/Cloud3")



func _ready():
	var projectResolution = get_viewport().get_visible_rect().size
#	sky.scale = Vector2(projectResolution[0]/32,projectResolution[1]/32)
	print(projectResolution)
	print(projectResolution[0])
	print(projectResolution[1])
	appear_random(Cloud1)
	appear_random(Cloud2)
	appear_random(Cloud3)

func appear_random(Cloud):

	Cloud.position = Vector2(rand_range(-projectResolution[0],projectResolution[0]),rand_range(-projectResolution[1],projectResolution[1]))
	print(Cloud.position)
	print("======Clouddd======")
	