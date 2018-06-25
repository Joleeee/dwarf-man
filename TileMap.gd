extends TileMap

var mapSize = Vector2(63, 36)
const Room = preload("res://room.gd").Room
const Array2D = preload("res://array2d.gd").Array2D

func _ready():
	randomize()
	new_map()
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		new_map()
	pass

func new_map():
	for x in mapSize.x:
		for y in mapSize.y:
			set_cell(x, y, -1)
	var sectorSize = mapSize/3
	var rooms = Array2D.new(3, 3, null)
	for x in 3:
		for y in 3:
			var size = Vector2(rand_range(4, sectorSize.x-2), rand_range(4, sectorSize.y-2))
			var pos = Vector2(0 + x * sectorSize.x, y * sectorSize.y)
			pos.x += rand_range(1, sectorSize.x - size.x-1)
			pos.y += rand_range(1, sectorSize.y - size.y-1)
			var p = Vector2(pos.x + rand_range(0, size.x), pos.y + rand_range(0, size.y))
			get_parent().find_node("Player").position = Vector2(int(p.x), int(p.y)) * cell_size
			var room = Room.new(pos, size, p)
			rooms.set_value(x, y, room)
			rooms.get_value(x, y).apply(self)
	for x in rooms.width:
		for y in rooms.height:
			var cur = rooms.get_value(x, y)
			if x < rooms.width - 1:
				cur.lineTo(self, rooms.get_value(x+1, y))
			if y < rooms.height - 1:
				cur.lineTo(self, rooms.get_value(x, y+1))