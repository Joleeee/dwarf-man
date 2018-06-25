class Array2D:
	var width
	var height
	var array
	
	
	func _init(width, height, fill):
		self.width = width
		self.height = height
		array = []
		for x in width * height:
			array.append(fill)
	
	func get_value(x, y):
		return array[x + y * width]
	
	func set_value(x, y, id):
		var i = x + y * width
		array[i] = id