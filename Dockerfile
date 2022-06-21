FROM dorowu/ubuntu-desktop-lxde-vnc
COPY . /app
RUN apt update && apt install -y \
  xdotool cron vim psmisc\
  && rm -rf /var/lib/apt/lists/*\
  && rm -rf /etc/localtime\
  && ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime 
#CMD apt-get update; apt-get install xdotool 
