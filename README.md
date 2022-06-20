# bixpe


bixpe.sh USER PASS ACCION

ACCION (login|entrar|comer|pausar|reanudar|finalizar)

example run container
docker run -p 6080:80 -v /root/fich/:/app2 -e RESOLUTION=1024x768 bixpe/fich

##export DISPLAY=':1.0'
##sleep 2 ; xdotool getmouselocation

example crontab
00 08  *  *  1-5 /app/bixpe.sh USER PASS entrar
05 14  *  *  1-4 /app/bixpe.sh USER PASS comer
04 15  *  *  1-4 /app/bixpe.sh USER PASS 789RGJ reanudar
28 17  *  *  1-4 /app/bixpe.sh USER PASS finalizar
11 14  *  *  5   /app/bixpe.sh USER PASS finalizar
