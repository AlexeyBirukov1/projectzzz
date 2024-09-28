extends CharacterBody2D

# Скорость перемещения персонажа
var speed = 200
# Сила прыжка
var jump_force = -400
# Гравитация
var gravity = 800

# Вектор движения
var vel = Vector2()

func _process(delta):
	# Применяем гравитацию
	velocity.y += gravity * delta

	# Обрабатываем ввод с клавиатуры
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	# Прыжок
	if is_on_floor() and Input.is_action_just_pressed("ui_select"):
		velocity.y = jump_force

	# Перемещаем персонажа с помощью KinematicBody2D
	vel = move_and_slide(velocity, Vector2.UP)
