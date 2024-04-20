extends Area2D
@export var speed = 1000
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func start(_transform):
	transform = _transform
	velocity = transform.x * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta 


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_bullet_body_entered(body):
	if body.is_in_group("rocks"):
		body.exploder()
		queue_free()
