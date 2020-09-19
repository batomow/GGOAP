extends Object 

class_name ActionTree
#public
var root: ATreeNode setget , get_root

#private
var _root: ATreeNode = null
var _nodelist: Array = []
var _start_state:Array=[]
var _goal_state:Array=[]

func _init(start_state:Array=[], nodelist: Array =[], goal_state:Array=[]).(): 
	_nodelist = nodelist
	_start_state = start_state
	_goal_state = goal_state
	for node in nodelist: 
		if node.preconditions.size() == 0: 
			_root = ATreeNode.new(node)
			break 

func get_root()->ATreeNode: 
    return _root
    
func pair_nodes(pnode: ATreeNode, nodelist: Array =[], currentstate: Dictionary = {})->void: 
    var newstate = currentstate.duplicate()
    for condition in pnode.val.posconditions: 
        newstate[condition] = true
   
    var allgood = true
    for node in nodelist: 
        for condition in node.val.preconditions: 
            if newstate.has(condition) == false: 
                allgood = false
        if allgood: 
            node.parent = pnode
        allgood = true
    
    ## you need to call recursively here something lol
    


                
    
    


class ATreeNode extends Object: 
	var _val: Action
	var val: Action setget , get_val
	var parent: Action

	func _init(val, parent=null).():
		_val = val
		parent = parent
	
	func get_val()->Action: 
		return _val
