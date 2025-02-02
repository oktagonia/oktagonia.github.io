FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install python3-markdown -y
RUN apt-get install guile-3.0 -y
RUN apt-get install apache2 -y

WORKDIR /blog
COPY ./ /blog/
RUN ./bin/build github
COPY docs /var/www/html

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
