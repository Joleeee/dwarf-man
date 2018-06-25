extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var move = Vector2(0, 0)
	if Input.is_action_just_pressed("left"):
		move.x -= 1
	if Input.is_action_just_pressed("right"):
		move.x += 1
	if Input.is_action_just_pressed("up"):
		move.y -= 1
	if Input.is_action_just_pressed("down"):
		move.y += 1
	var tm = get_parent().find_node("TileMap")
	move *= tm.cell_size
	if tm.get_cellv(tm.world_to_map(position + move)) != -1:
		position += move