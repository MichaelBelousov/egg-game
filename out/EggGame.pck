GDPC                �                                                                         P   res://.godot/exported/133200997/export-107ad9e3c1741f97fada8b05a3260de2-wolf.scn�:      �      "��Ա�^}"����    P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scnP3      �      �u���-��Z�3>f,    P   res://.godot/exported/133200997/export-3eea939e9f728804b9fd2edbd0e2bd16-egg.scn        �      �3t���:/�.F�_    T   res://.godot/exported/133200997/export-76c1b413dddf388dab2deca18513082f-branch.scn         �      �Z˛%e����G�iܺ    ,   res://.godot/global_script_class_cache.cfg  `?             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  @C      �       _2�e�d�Wf|�x��       res://branch.gd               ݨ������qDzhi       res://branch.tscn.remap �=      c       ?��֒t�g<~0�k��       res://egg.gd�      p      ���Yv/m�]�~��       res://egg.tscn.remap >      `       ly|ic�vU�R�a       res://icon.svg  �?      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       �Q�,����<�~'�Rl       res://main.gd   �      �      Eu�ޗdE���\�1�
       res://main.tscn.remap   �>      a       �J�Sw� ������       res://project.binary�C      �	      �2�]�֋�����3       res://wolf.tscn.remap   �>      a       ���.��wd�6m��    extends Line2D

var egg_scene = preload("res://egg.tscn")

@onready var main = get_tree().get_root().get_node("Main")

var egg = null

func spawn_egg(egg_data):
	self.egg = egg_scene.instantiate()
	egg.init(egg_data)
	self.egg.position = $Spawn.position
	self.add_child(self.egg);
       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   friction    rough    bounce 
   absorbent    script 	   _bundled       Script    res://branch.gd ��������      local://PhysicsMaterial_onwix a         local://PackedScene_f1e63 �         PhysicsMaterial                      PackedScene          	         names "         Branch    points    default_color    script    Line2D    Spawn 	   position    Node2D    StaticBody2D    physics_material_override    CollisionPolygon2D    polygon    	   variants       %        �@  �?  BC  �B   ���>��X>�� =  �?          
     B  �          
     �?  @�%        �   B  C  �B  C  �B  �  $B      node_count             nodes     ,   ��������       ����                                        ����                           ����         	                 
   
   ����                         conn_count              conns               node_paths              editable_instances              version             RSRC          extends RigidBody2D

var branch: String = ''
var lifetime: float = 0.0

# egg_data should be { branch: "${'B'|'T'}${'L'|'R'}" }
func init(egg_data):
	self.branch = egg_data.branch
	# self.connect("tree_exiting", func(): print('egg died in %ss from %s' % [self.lifetime, self.branch]))
	self.gravity_scale = egg_data.speed

func _process(delta):
	self.lifetime += deltaRSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script    res://egg.gd ��������      local://CircleShape2D_5qjgq N         local://PackedScene_5sf2n l         CircleShape2D             PackedScene          	         names "   	      Egg    gravity_scale    script    RigidBody2D    CollisionShape2D    shape 
   Polygon2D    color    polygon    	   variants          ���>                       ��O?��1?��?  �?%         �      ��  ��       �  �@  ��   A      �@  �@       A  ��  �@      node_count             nodes        ��������       ����                                  ����                           ����                         conn_count              conns               node_paths              editable_instances              version             RSRC GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bq3fipbq1po6t"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Node2D


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
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    normal 	   distance    script 	   _bundled       Script    res://main.gd ��������   PackedScene    res://branch.tscn �&����   PackedScene    res://wolf.tscn �~p1�/�;   #   local://WorldBoundaryShape2D_6j2c1 �         local://PackedScene_3a8s1 �         WorldBoundaryShape2D             PackedScene          	         names "         Main    script    Node2D    CanvasLayer    Score    offset_left    offset_top    offset_right    offset_bottom    text    horizontal_alignment    Label    NextEggTimer 
   autostart    Timer    EndText    RichTextLabel 	   BranchTL 	   position 	   BranchTR    scale 	   BranchBL 	   BranchBR    Wolf    Floor    Area2D    CollisionShape2D    shape    metadata/_edit_lock_    Left    Right    	   variants                      �A     �A     �B     �B      0                   B         
     C  �B
    @�D  �B
     ��  �?
     HC  �C
     zD  �C         
     D �D          
     ��    
     �B          node_count             nodes     �   ��������       ����                            ����                      ����                           	      
                        ����                           ����                           ���   	         
               ���   	                              ���   	                        ���   	                              ���                            ����             
             ����                   
             ����             
             ����                   conn_count              conns               node_paths              editable_instances              version             RSRC       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_dml6f �          PackedScene          	         names "      
   Polygon2D    scale    color    polygon    	   variants       
     @@  @@   ���>���>���>  �?%         �      ��  ��       �  �@  ��   A      �@  �@       A  ��  �@      node_count             nodes        ��������        ����                                conn_count              conns               node_paths              editable_instances              version             RSRC   [remap]

path="res://.godot/exported/133200997/export-76c1b413dddf388dab2deca18513082f-branch.scn"
             [remap]

path="res://.godot/exported/133200997/export-3eea939e9f728804b9fd2edbd0e2bd16-egg.scn"
[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-107ad9e3c1741f97fada8b05a3260de2-wolf.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �&����   res://branch.tscn�i#��,O   res://egg.tscn�g�w��1   res://icon.svg ��-�i   res://main.tscn�~p1�/�;   res://wolf.tscn     ECFG
      application/config/name         EggGame    application/run/main_scene         res://main.tscn    application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     display/window/stretch/mode         viewport   display/window/stretch/aspect      
   keep_width     dotnet/project/assembly_name         EggGame    input/go_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script         input/go_right�              deadzone      ?      events              InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script      2   rendering/environment/defaults/default_clear_color      ���>��D?��t?  �?        