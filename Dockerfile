FROM jenkins:2.32.3

USER root

RUN curl -sSL https://get.docker.com/ | sh \
    && curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && rm -rf /var/lib/apt/lists/* \
    && usermod -aG docker jenkins

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8 \
	&& echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
	
ENV LANG fr_FR.utf8

USER jenkins
