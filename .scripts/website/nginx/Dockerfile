FROM nginx:latest

RUN apt-get update && \
    apt-get install zip -y
    
RUN rm /etc/nginx/conf.d/*
COPY ./webiste.conf /etc/nginx/conf.d/webiste.conf