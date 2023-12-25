extends RigidBody2D

var branch: String = ''
var lifetime: float = 0.0

# egg_data should be { branch: "${'B'|'T'}${'L'|'R'}" }
func init(egg_data):
	self.branch = egg_data.branch
	self.connect("tree_exiting", func(): print('egg died in %ss from %s' % [self.lifetime, self.branch]))
	self.gravity_scale = egg_data.speed

func _process(delta):
	self.lifetime += delta