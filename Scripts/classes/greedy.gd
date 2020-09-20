extends Object 

class_name Greedy

#public 
var plan: Array = []

func _init().():
	pass

func _build_plan(node): 
	plan.push_back(node.val)
	var _min:int = 9999
	var next
	for child in node.children: 
		if child.val.cost < _min: 
			_min = child.val.cost
			next = child
	if next: 
		_build_plan(next)


func build_plan(node)->Array: 
	_build_plan(node)
	return plan

func print_plan(): 
	var string = ""
	for action in plan: 
		string += action.title + ' -> '
	print(string)
