extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)

var xspeed = 300
var move_speed = 300
onready var SHOT = preload("res://shot.tscn")
onready var world = self.get_node("../World")

# Called when the node enters the scene tree for the first time.
func _ready():
	#velocity.x=xspeed
	velocity.x=0


func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -move_speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = move_speed	
	else: velocity.y = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -move_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = move_speed	
	else: velocity.x = 0
		
	
	velocity = move_and_slide(velocity)
	#move_and_collide(velocity*delta)
	
	if Input.is_action_just_pressed("fire"):
		print("fire")
		var shot = SHOT.instance()		
		shot.position = position + Vector2(64,0)
		
		get_parent().add_child(shot)
		
		$Sounds.play()
		
		
