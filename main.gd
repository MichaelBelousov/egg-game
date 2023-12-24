extends Node2D


var difficulty: float = 1.0
@onready var top_branches = [$BranchTL, $BranchTR]
@onready var bottom_branches = [$BranchBL, $BranchBR]
@onready var branch_groups = [top_branches, bottom_branches]

const EGG_QUEUE_SIZE = 6
var egg_queue = []

func advance_egg_queue() -> void:
	egg_queue.push_back({
		'delay' = 1.0 / difficulty,
		'branch' = ['TR', 'BR', 'TL', 'BL'].pick_random(),
	})
	difficulty += 0.1

func _ready() -> void:
	self.score = 0

	for i in range(EGG_QUEUE_SIZE):
		advance_egg_queue()

	set_wolf_pos(WolfPos.Left)

	$NextEggTimer.connect(
		"timeout",
		func():
			var next_egg = egg_queue.pop_front()
			var branch = get_node("Branch%s" % next_egg.branch)
			$NextEggTimer.wait_time = next_egg.delay
			branch.spawn_egg()
			advance_egg_queue()
	)

	$Floor.connect(
		"body_entered",
		func(body):
			# FIXME: check if egg?
			var egg = body
			var name = String(egg.get_parent().name)
			if ((name[7] == 'L' and wolf_pos == WolfPos.Left)
			 or (name[7] == 'R' and wolf_pos == WolfPos.Right)):
				score += 1
			egg.queue_free()
	)

var score: int = 0:
	set(x):
		$Score.text = "{0}".format([x])
		score = x

enum WolfPos { Left, Right }

var wolf_pos = WolfPos.Left

# FIXME: make setter
func set_wolf_pos(pos: WolfPos) -> void:
	wolf_pos = pos
	if pos == WolfPos.Left:
		$Wolf.set_global_position($Floor/Left.global_position)
	elif pos == WolfPos.Right:
		$Wolf.set_global_position($Floor/Right.global_position)

func _input(event):
	if event.is_action_pressed("go_left"):
		set_wolf_pos(WolfPos.Left)
	elif event.is_action_pressed("go_right"):
		set_wolf_pos(WolfPos.Right)