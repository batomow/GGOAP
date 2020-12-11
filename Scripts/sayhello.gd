extends Node

func _doNothing():
	pass

var mycallback = funcref(self, "_doNothing")

var tree = ActionTree.new([
	"doesn't have an axe", 
	"an axe is available", 
	"the sun is shining"
],[
	Action.new('Get Axe', 2, ["an axe is available", "doesn't have an axe"], ['has an axe']),
	Action.new('Chop Log', 4, ["has an axe"], ["make firewood"]),
	Action.new('Take shower', 1, ["make firewood"], ["showered"]),
	Action.new('Collect Branches', 8, [], ["make firewood"])
],[
	"make firewood"
])

# func enter(): 
# 	pass

# func execute(delta): 
# 	if plan.empty() == false: 
# 		var next_action = plan.pop_front() 
# 		next_action.execute()

# func evaluate(delta):
# 	# cada 10 frames
# 	make_plan()

# func make_plan():
# 	# var root = tree.build_tree()
# 	# tree.print_tree(root)
# 	var planner = Greedy.new()
# 	var plan = planner.build_plan(root)
# 	planner.print_plan()
# 	for p in plan: 
# 		p.execute([p.title], mycallback)
