class Room:
	var position
	var size
	var pathPoint
	
	func _init(position, size, pathPoint):
		self.position = position
		self.size = size
		self.pathPoint = pathPoint
	
	func apply(tilemap):
		for x in size.x:
				for y in size.y:
					tilemap.set_cell(x + position.x, y + position.y, 0)
	
	func lineTo(tm, room):
		var start = pathPoint
		var end = room.pathPoint
		var k = end.y - start.y
		var r = end.x - start.x
		if r > k:
			for x in r:
				place(tm, x + start.x, lerp(start.y, end.y, x/r))
		else:
			for y in k:
				place(tm, lerp(start.x, end.x, y/k), y + start.y)
	
	func place(tm, x, y):
		if tm.get_cell(x, y) == -1:
			tm.set_cell(x, y, 1)