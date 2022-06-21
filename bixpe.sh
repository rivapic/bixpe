#!/bin/bash
#export DISPLAY=':0.0'
export DISPLAY=':1.0'
ACCION=$3
USER=$1
PASS=$2
WAITRANDON=$(( RANDOM % 300 ))
echo "randon=$WAITRANDON"
##docker run -p 6080:80 -v /root/fich/:/app2 -e RESOLUTION=1024x768 bixpe/fich
##export DISPLAY=':1.0'
##sleep 2 ; xdotool getmouselocation


##### 640x480
stopx=460
stopy=352

confirmastopx=253
confirmastopy=376

#x:273 y:352
comerx=275
comery=352

loginuserx=287
loginusery=295

###x:287 y:295


#x:310 y:348
reanudarx=310
reanudary=348

##x:217 y:381

#x:252 y:389
confirmarentrarx=217
confirmarentrary=381

login() {
	echo "LOGIN"
	USER=$1
	PASS=$2
	#echo $USER
	#echo $PASS
	#chromium-browser https://worktime.bixpe.com/ &
	firefox https://worktime.bixpe.com/ &
	sleep 40
	#xdotool key Tab
	xdotool mousemove $loginuserx $loginusery click 1
	#####xdotool key BackSpace
	#xdotool key Tab
	##### ACEPTAR COOKIES
	sleep 1
	xdotool type $USER
	sleep 1
	xdotool key  Tab
	sleep 1
	xdotool type $PASS
	sleep 2
	sleep 1
        xdotool key Return
	sleep 1
        xdotool mousemove $confirmarentrarx $confirmarentrary click 1	
	sleep $WAITRANDON
	sleep 1
}

entrar() {
	echo "ENTRAR"
	login $USER $PASS
	sleep 1
	xdotool mousemove $reanudarx $reanudary click 1
	sleep 1
	xdotool mousemove $confirmarentrarx $confirmarentrary click 1

	sleep 1
}

comer() {
	echo "COMER"
	login $USER $PASS
	sleep 1
	xdotool mousemove $comerx $comery click 1
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
       xdotool mousemove $reanudarx $reanudary click 1
       sleep 1
       #xdotool mousemove 271 353 click 1
       #sleep 1
}

finalizar() {
	echo "FINALIZAR"
	login $USER $PASS
	sleep 1
	xdotool mousemove $stopx $stopy click 1
	#finalizar con 1366x768   #x:844 y:347 
        sleep 1
        xdotool mousemove $confirmastopx $confirmastopy click 1
        sleep 1
}

test2() {
        echo "TEST "
        login $USER $PASS
        sleep 1
        xdotool mousemove $stopx $stopy click 1
	echo "PULSADO"
        sleep 1
        ##xdotool mousemove 252 353 click 1
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
  test)
    test2
  ;;
  *)
    echo "ERROR ACCION NO ESPECIFICADA"
  ;;
esac
 
sleep 10
#killall /usr/lib/chromium-browser/chromium-browser-v7
killall firefox

