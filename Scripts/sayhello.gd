extends Node

var tree = ActionTree.new([
	"doesn't have an axe", 
	"an axe is available", 
	"the sun is shining"
],[
	Action.new('Get Axe', null, 2, ["an axe is available", "doesn't have an axe"], ['has an axe']),
	Action.new('Chop Log', null, 4, ["has an axe"], ["make firewood"]),
	Action.new('Collect Branches', null, 8, [], ["make firewood"])
],[
	"make firewood"
])

func _ready():
	var root = tree.build_tree()
	tree.print_tree(root)
	var planner = Greedy.new()
	var plan = planner.build_plan(root)
	planner.print_plan()