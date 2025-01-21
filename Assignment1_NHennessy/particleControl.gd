extends Node2D
@onready var particles : GPUParticles2D = $snowparticles
@onready var windowSizeX = get_viewport().size.x
@onready var windowSizeY = get_viewport().size.y

# Called when the node enters the scene tree for the first time.
func _ready():
	particles.emitting = false
	particles.transform.origin.x = windowSizeX/2
	particles.process_material.set("emission_box_extents",Vector3(windowSizeX/2,20,20))
	particles.emitting = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# input handling
	if Input.is_action_just_pressed("speedup") and particles.speed_scale < 5:
		particles.speed_scale += 0.1
	if Input.is_action_just_pressed("speeddown") and particles.speed_scale > 0.1:
		particles.speed_scale -= 0.1
		
	#window size handling
	#if the size changes from what is stored
	if (windowSizeX != get_viewport().size.x or windowSizeY != get_viewport().size.y):
		particles.emitting = false
		#get new values
		windowSizeX = get_viewport().size.x
		windowSizeY = get_viewport().size.y
		#reset the size of the particle emitter
		particles.transform.origin.x = windowSizeX/2
		particles.process_material.set("emission_box_extents",Vector3(windowSizeX/2,20,20))
		particles.emitting = true
		
	
