# Dockerfile 

FROM python:3.8.3
MAINTAINER eren@mondeique.com

ENV PYTHONUNBUFFERED 0

# django settings module
# ENV DJANGO_SETTINGS_MODULE siiot.settings.prod

# 우분투 환경 업데이트 및 기본 패키지 설치
RUN apt-get -y update
RUN apt-get upgrade -y
RUN apt-get -y dist-upgrade
RUN apt-get install -y python3-pip git vim 

RUN pip3 install --upgrade pip
RUN pip install --upgrade pip

# pyenv setting 
RUN apt-get install -y make build-essential \
curl \
libreadline-gplv2-dev \
libncursesw5-dev \
libssl-dev \
libsqlite3-dev \
tk-dev \
libgdbm-dev \
libc6-dev \
libbz2-dev \
zlib1g-dev \
openssl \
libffi-dev \
python3-dev \
python3-setuptools \
wget
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
ENV PATH /root/.pyenv/bin:$PATH
RUN pyenv install 3.8.3

# zsh 
#RUN apt-get install -y zsh
#RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
#RUN chsh -s /usr/bin/zsh

# pyenv settings
RUN echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
RUN ["/bin/bash", "-c", "source ~/.bashrc"]

# pyenv virtualenv
RUN pyenv virtualenv 3.8.3 mondeique-dod
CMD ["pyenv", "activate", "mondeique-dod"]

# supervisord install
RUN apt-get -y install supervisor

# gunicorn install 
RUN pip install gunicorn

# make folder
WORKDIR /mondeique_dod

# requirements install
ADD ./DOD-main-server/requirements.txt /mondeique_dod/backend/
RUN pip install -r backend/requirements.txt

# mysqlclient install
RUN apt-get install -y mariadb-client
RUN apt-get install -y python3-dev default-libmysqlclient-dev gcc
RUN pip install mysqlclient==1.4.4

# Main Backend Docker + code copy
ADD ./docker /mondeique_dod/docker
ADD ./DOD-main-server /mondeique_dod/backend

# sort out permissions
RUN chown -R www-data:www-data /mondeique_dod

EXPOSE 80 22

ENTRYPOINT ["bash", "wsgi-entrypoint.sh"]
CMD ["supervisord", "-n"]
