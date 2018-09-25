extends Node2D

onready var felpudo = get_node("Felpudo") #referencia o node Felpudo
onready var timeReplay = get_node("TimeToReplay")
onready var label = get_node("NodeControl/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass

func kill(): #comando que faz a animação de morte e para o jogo
	felpudo.apply_impulse(Vector2(0,0), Vector2(-1000,0))#quando o personagem bater no cano, será jogado para trás
	get_node("BackAnim").stop()
	estado = PERDENDO
	timeReplay.start()
	get_node("SomHit").play()

func _on_TimeToReplay_timeout():
	
	get_tree().reload_current_scene()

func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SomScore").play()