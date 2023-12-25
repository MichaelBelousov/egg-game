extends Line2D

var egg_scene = preload("res://egg.tscn")

@onready var main = get_tree().get_root().get_node("Main")

var egg = null

func spawn_egg(egg_data):
	self.egg = egg_scene.instantiate()
	egg.init(egg_data)
	self.egg.position = $Spawn.position
	self.add_child(self.egg);
