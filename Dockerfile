FROM registry.eorlbruder.de/nginx-php
MAINTAINER  David Magnus Henriques <david.magnus@acagamics.de

ADD assets/ /

RUN pacman -Syyu --noconfirm --noprogressbar git && \
    pacman -Sc --noconfirm

WORKDIR /srv/http
RUN git clone https://github.com/electerious/Lychee.git

RUN chown http:http -R Lychee
RUN chmod 777 -R Lychee/uploads/ Lychee/data/

WORKDIR /

CMD ["supervisord", "-n"]
