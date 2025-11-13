extends Task
class_name TakeTask

var product_storage: ProductStorage
var count: int

func _init(ps: ProductStorage, c: int):
	product_storage = ps
	count = c
