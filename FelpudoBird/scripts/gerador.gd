extends Position2D

onready var cano = preload("res://scenes/cano.tscn") #"onready" é quando a cena estiver compilada ou pronta

func _ready():

	randomize()

func _on_Timer_timeout(): #função gerada por uma conexão de um sinal emitido pelo timer, 
#sinais são como tuites, só quem ve eles são seus seguidores através da conexão, 
#todos os obejtos da godot emitem esses sinais e são muito úteis para criar funções após a emissão deles
	
	var novocano = cano.instance() #novocano recebe a scene cano
	novocano.set_pos(get_pos() + Vector2(0, rand_range(-500,500)))#rand_range em extenso é randomize range
	get_owner().add_child(novocano) #adiciona novocano como filho do node Canos