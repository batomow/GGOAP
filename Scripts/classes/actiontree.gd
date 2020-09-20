extends Object 

class_name ActionTree
#public
var root: ATreeNode setget , get_root
var levels: int setget , get_levels

#private
var _root: ATreeNode = null
var _levels: int = 0
var _nodelist: Array = []
var _start_state:Array=[]
var _goal_state:Array=[]

func _init(start_state:Array=[], actions: Array =[], goal_state:Array=[]).(): 
	_root = ATreeNode.new(Action.new('Idle', null, 0, [], start_state))
	for action in actions: 
		_nodelist.push_back(ATreeNode.new(action))
	_start_state = start_state
	_goal_state = goal_state

func get_root()->ATreeNode: 
	return _root
  
# determines if the provided node's preconditions are all included in the provided state
func _can_pair(node: ATreeNode, state: Dictionary)->bool: 
		for condition in node.val.preconditions: 
			if not state.has(condition): 
				return false
		return true


"""""
pnode: ATreeNode ({val: Action, children: (Array, Actions)})
nodelist: (Array, ATreeNode)
currentstate: Dictionary
"""""
func _build_tree(pnode: ATreeNode, nodelist: Array =[], currentstate: Dictionary = {}, current_level: int = 0)->void: 
	#updated max tree depth
	if current_level > _levels: 
		_levels = current_level

	#accumulate posconditions
	var newstate = currentstate.duplicate()
	for condition in pnode.val.posconditions: 
		newstate[condition] = true

	#connect children and create a list of available nodes
	var newnodelist: Array = []
	for node in nodelist: 
		if _can_pair(node, newstate): 
			pnode.children.push_back(node)
		else: 
			newnodelist.push_back(node)

	#recursively call the method on the children nodes
	for child in pnode.children: 
		_build_tree(child, newnodelist, newstate, current_level + 1)


func build_tree(): 
	if _root: 
		_build_tree(_root, _nodelist)
	return _root


func print_tree(node, level=0): 
	if not level: 
		print("tree depth: ", _levels)
	var prefix = ""
	for s in range(level): 
		prefix += "  "
	print(prefix+node.val.title)
	level+=1
	for child in node.children: 
		print_tree(child, level)


func get_levels(): 
	return _levels


class ATreeNode extends Object: 
	var _val: Action
	var val: Action setget , get_val
	var children: Array #of actions

	func _init(val, children=[]).():
		_val = val
		self.children = children
	
	func get_val()->Action: 
		return _val
