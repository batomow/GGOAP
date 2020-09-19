extends Object

class_name Action
#public
var preconditions: Array setget , get_preconditions
var posconditions: Array setget , get_posconditions
var name: String setget , get_name

#private
var _preconditions:Array = []
var _posconditions:Array = [] 
var _method: FuncRef
var _cost: float
var _name: String


func _init(name: String, method:FuncRef, cost: float=0, preconditions:Array=[], posconditions:Array=[]).():
	_name = name
	_method = method
	_preconditions = preconditions
	_posconditions = posconditions
	_cost = cost


func __void()->void: 
	pass


func execute(args:Array=[], callback:FuncRef=funcref(self, '__void')): 
	if(_method): 
		args.push_back(callback)
		_method.call_funcv(args)
	else: 
		printerr('Missing action method')


func get_name(): 
	return _name


func get_preconditions(): 
	return _preconditions


func get_posconditions(): 
	return _posconditions
