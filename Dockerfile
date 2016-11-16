FROM wordpress:latest

RUN groupadd admin 

# setup init user
RUN useradd --user-group --create-home --shell /bin/bash localadmin &&\
usermod -aG admin localadmin && chown -R localadmin:localadmin /home/localadmin

ENV HOME=/home/localadmin

# WARNING! Changing WORKDIR can compromise the inherited configurations from the parent / source container
# Bundle app source 
#COPY . /usr/src/app
#
#WORKDIR /usr/src/app

# Housekeeping - Not working: no apt, aptitude or apt-get. Not sure what OS is running.
#RUN apt-get update && apt-get upgrade -y && apt autoremove -y

EXPOSE 80
EXPOSE 443

# CMD ["./bin/launch"]