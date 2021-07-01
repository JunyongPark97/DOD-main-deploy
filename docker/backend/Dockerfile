# docker/backend/Dockerfile

FROM python:3.8.3

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install gunicorn

ADD ./DOD-main-server/requirements.txt /app/backend/
RUN pip install -r backend/requirements.txt

ADD ./docker /app/docker
ADD ./DOD-main-server /app/backend

RUN chmod +x ./docker/backend/wsgi-entrypoint.sh
RUN chmod +x ./docker/backend/wsgi-entrypoint-dev.sh