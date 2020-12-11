extends Object

class_name Action
#public
var preconditions: Array setget , get_preconditions
var posconditions: Array setget , get_posconditions
var title: String setget , get_title
var cost: float

#private
var _preconditions:Array = []
var _posconditions:Array = [] 
var _method: FuncRef
var _title: String

## placeholder actions ##
func _doAction(message, callback): 
	print('doing: ', message)
var _placeholder = funcref(self, "_doAction")

func _init(title: String, cost: float=0, preconditions:Array=[], posconditions:Array=[], method:FuncRef=_placeholder).():
	_title = title
	_method = method
	_preconditions = preconditions
	_posconditions = posconditions
	self.cost = cost


func __void()->void: 
	pass


func execute(args:Array=[], callback:FuncRef=funcref(self, '__void')): 
	if(_method): 
		args.push_back(callback)
		_method.call_funcv(args)
	else: 
		printerr('Missing action method')


func get_title(): 
	return _title


func get_preconditions(): 
	return _preconditions


func get_posconditions(): 
	return _posconditions


