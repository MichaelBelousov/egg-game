extends Node2D


@onready var top_branches = [$BranchTL, $BranchTR]
@onready var bottom_branches = [$BranchBL, $BranchBR]
@onready var branch_groups = [top_branches, bottom_branches]

# FIXME: must be calculated based on speed...
const egg_top_fall_time = 4.0666
const egg_bot_fall_time = 3.4666

var rng = RandomNumberGenerator.new()

const egg_queue_size = 6
var egg_queue = []

# The difficulty curve is based on the idea that difficulty of the sized "egg queue" is a (polynomial?) function with parameters:
# - sum intervals between egg landings
# - speed of each egg in the queue
# - spawn location variance (how often it switches between left and right, top and bottom eggs)
# being a (polynomial?) simple function, we can choose guassian distributed random values for all but one parameter, set a
# target output difficulty that gets more difficult with each spawned egg, and solve the resulting equation for the one unknown parameter.
# NOTE: this function is no longer accurate once the average spawn frequency (or proportional difficulty thereof) is so high that the queue throughput is higher than the average egg lifetime

const x_switch_factor = 0.5
const y_switch_factor = 0.25
const interval_variance_factor = 1.5
const speed_variance_factor = 0.5

var difficulty: float = 0.8
## amount by which difficulty increases with every egg
const difficulty_scale = 0.05

func calc_next_queue_stats(next_branch: String):
	var last_x = egg_queue[0].branch[1]
	var last_y = egg_queue[0].branch[0]
	var x_switches = 0
	var y_switches = 0
	var interval_variance = 0
	var speed_variance = 0
	for i in range(egg_queue.size()):
		var egg = egg_queue[i]
		if last_x == egg.branch[1]:
			x_switches += 1
		if last_y == egg.branch[0]:
			y_switches += 1
		# if i + 1 >= egg_queue.size:
			# var next_egg = egg_queue[i + 1]
		assert(egg.delay > 0.0, "delay must be positive (nor zero)")
		interval_variance += (1 / egg.delay) ** 2
		speed_variance += egg.speed ** 2

		last_x = egg_queue[0].branch[1]
		last_y = egg_queue[0].branch[0]

	var next_x_switch_offset = 0
	var next_y_switch_offset = 0

	if next_branch != null:
		if last_x == next_branch[1]:
			x_switches += 1
			next_x_switch_offset += 1
		if last_y == next_branch[0]:
			y_switches += 1
			next_y_switch_offset += 1
	
	return {
		'x_switches' = x_switches,
		'next_x_switch_offset' = next_x_switch_offset,
		'next_y_switch_offset' = next_y_switch_offset,
		'y_switches' = y_switches,
		'interval_variance' = interval_variance,
		'speed_variance' = speed_variance,
		'difficulty' = (
			0
			+ x_switch_factor * (x_switches - next_x_switch_offset)
			+ y_switch_factor * (y_switches - next_y_switch_offset)
			+ speed_variance_factor * speed_variance
			+ interval_variance_factor * interval_variance
		)
	}

func enqueue_egg() -> void:
	const max_speed = 2.0
	const min_speed = 0.25
	const mean_speed = min_speed + (max_speed - min_speed) / 2
	# recall that ~60% of the curve falls within 1 standard deviation
	const speed_variance = (max_speed - min_speed) / 4
	var speed = clamp(rng.randfn(mean_speed, speed_variance), min_speed, max_speed)
	var branch = ['TR', 'BR', 'TL', 'BL'].pick_random()
	var next_queue_stats = calc_next_queue_stats(branch)

	# NOTE: the fact that we're summing and not multiplying intervals for variance may lead to
	# jitteriness (non-smoothness) in the difficulty
	var target_interval_variance = difficulty
	var needed_variance = target_interval_variance - next_queue_stats.interval_variance
	var needed_difficulty = difficulty - next_queue_stats.difficulty
	var next_egg_non_interval_difficulty = (
		0
		+ x_switch_factor * (next_queue_stats.next_x_switch_offset / next_queue_stats.x_switches)
		+ y_switch_factor * (next_queue_stats.next_y_switch_offset / next_queue_stats.y_switches)
		+ speed_variance_factor * (speed ** 2 / next_queue_stats.speed_variance)
	)
	var needed_interval_difficulty = needed_difficulty - next_egg_non_interval_difficulty
	var needed_interval_variance = needed_interval_difficulty / interval_variance_factor
	# inverse of interval variance in function above
	var needed_delay = 1 / sqrt(needed_interval_variance)

	next_queue_stats.delay = needed_delay
	print(next_queue_stats)

	egg_queue.push_back({
		'delay' = needed_delay,
		## this is really the gravity factor so technically its acceleration
		'speed' = speed,
		'branch' = branch,
	})
	
func simple_enqueue_egg() -> void:
	var branch = ['TR', 'BR', 'TL', 'BL'].pick_random()

	const min_speed = 0.3
	var max_speed = min_speed + self.difficulty * 0.5
	var mean_speed = min_speed + (max_speed - min_speed) / 2
	var speed_variance = ((max_speed - min_speed) * clamp(self.difficulty, 0, 4)) / 8

	const abs_max_delay = 3.2
	const abs_min_delay = 0.01
	var abs_mean_delay = abs_min_delay + (abs_max_delay - abs_min_delay) / 2
	var min_delay = abs_mean_delay - self.difficulty * 0.5
	var max_delay = abs_max_delay / (2 ** self.difficulty) # exponential decay
	var delay_variance = ((max_delay - min_delay) * clamp(self.difficulty, 0, 4)) / 8
	var mean_delay = min_delay + (max_delay - min_delay) / 2

	var speed = clamp(rng.randfn(mean_speed, speed_variance), min_speed, max_speed)
	var delay = clamp(rng.randfn(mean_delay, delay_variance), min_delay, max_delay)

	var new_egg = {
		## this is really the gravity factor so technically its acceleration
		'speed' = speed,
		'delay' = delay,
		'branch' = branch,
	}


	egg_queue.push_back(new_egg)

	print("queueing egg with speed={speed}, delay={delay}, branch={branch} at difficulty %s".format(new_egg) % self.difficulty)

func _ready() -> void:
	self.score = 0

	for i in range(egg_queue_size):
		simple_enqueue_egg()

	wolf_pos = WolfPos.Left
	$NextEggTimer.connect(
		"timeout",
		func():
			var next_egg = egg_queue.pop_front()
			var branch = get_node("Branch%s" % next_egg.branch)
			$NextEggTimer.wait_time = next_egg.delay
			branch.spawn_egg(next_egg)
			simple_enqueue_egg()
			difficulty += difficulty_scale
	)

	$Floor.connect(
		"body_entered",
		func(body):
			# FIXME: check if egg?
			var egg = body
			var name = String(egg.get_parent().name)
			# name is like "BranchTL" or "BranchBR" for top-left/bottom-right
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

var wolf_pos: WolfPos = WolfPos.Left:
	set(pos):
		wolf_pos = pos
		if pos == WolfPos.Left:
			$Wolf.set_global_position($Floor/Left.global_position)
		elif pos == WolfPos.Right:
			$Wolf.set_global_position($Floor/Right.global_position)

func _input(event):
	if event.is_action_pressed("go_left"):
		wolf_pos = WolfPos.Left
	elif event.is_action_pressed("go_right"):
		wolf_pos = WolfPos.Right
