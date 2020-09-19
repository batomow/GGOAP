extends Node

func respond(message): 
	print(message)

func saySomething(message:String, callback:FuncRef):
	print(message)
	callback.call_func('hello my fren')

var myCallback = funcref(self, "respond")
var myFunction = funcref(self, "saySomething")

var action1 = Action.new("sayHello", myFunction, 1, ['silent'], ['talked'])
var action2 = Action.new("Root", myFunction, 1, [], ['silent'])
var tree = ActionTree.new([], [action1, action2], [])

func _ready():
	var root = tree.root
	print(root.val.name)
