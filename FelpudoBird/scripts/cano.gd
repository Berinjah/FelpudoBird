extends Node2D

export var vel = -400#export permite que o valor da variável seja modificado sem a necessidade de abrir o script, 
#ter cuidado ao usar pois nada será alterado no script em si
var cena

func _ready():
	cena = get_tree().get_current_scene()#get_tree "pega" todo o jogo
	set_process(true) #verifica cada frame
	
func _process(delta): #delta é o tempo que passou no game
	if cena.estado == cena.JOGANDO: #impede que o cano se movimente quando o jogador perder
		set_pos(get_pos() + Vector2(vel * delta, 0)) #seta a posição do cano
	
	if get_pos().x < -100: 
		queue_free() #após o cano sair da tela, o cano é "destruído"

func _on_Area2D_body_enter( body ):
	
	if body.get_name() == "Felpudo":
		cena.kill()


func _on_Ponto_body_enter( body ):
	
	cena.pontuar()
