#!/bin/bash

export DISPLAY=':0.0'
ACCION=$3
USER=$1
PASS=$2


login() {
	echo "LOGIN"
	USER=$1
	PASS=$2
	#echo $USER
	#echo $PASS
	#export DISPLAY=':0.0'
	chromium-browser https://worktime.bixpe.com/ &
	sleep 10
	xdotool key Tab
	xdotool type $USER
	sleep 1
	xdotool key  Tab
	sleep 1
	xdotool type $PASS
	sleep 1 
	xdotool key Return
	xdotool mousemove 300 415 click 1
	sleep 20
}


entrar() {
	echo "ENTRAR"
	login $USER $PASS
	sleep 1
	xdotool mousemove 333 322 click 1
	sleep 1
	xdotool mousemove 271 353 click 1
	sleep 1
}

comer() {
	echo "COMER"
	login $USER $PASS
	sleep 1
	xdotool mousemove 312 322 click 1
        sleep 1
}

pausar() {
        login $USER $PASS
	sleep 1
	xdotool mousemove 237 325 click 1
	sleep 1
	xdotool mousemove 267 408 click 1
	sleep 1
}

reanudar() {
       echo "REANUDAR"	
       login $USER $PASS
       sleep 1
       xdotool mousemove 346 323 click 1
       sleep 1
       #xdotool mousemove 271 353 click 1
       #sleep 1


}

finalizar() {
	echo "FINALIZAR"
	login $USER $PASS
	sleep 1
	xdotool mousemove 451 320 click 1
        sleep 1
        xdotool mousemove 252 353 click 1
        sleep 1
}

#MAIN



case $ACCION in
  entrar)
    entrar
  ;;
  login)
    login $USER $PASS 
  ;;
  comer)
    comer
  ;;
  reanudar)
    reanudar
  ;;
  finalizar)
    finalizar
  ;;
  *)
    echo "ERROR ACCION NO ESPECIFICADA"
  ;;
esac
 
sleep 10
killall /usr/lib/chromium-browser/chromium-browser-v7
