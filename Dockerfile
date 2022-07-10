FROM python:3.10.5-slim

RUN apt update \
    && apt install python3-dev libpq-dev gcc -y \
    && apt install mc vim -y

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
#
#ENV SECRET_KEY=django-insecure-9ogf#fg+8hx75=h=sa#lat6o2*q(%1)%sakti-*sf8lrnskq@u
#ENV DEBUG=True
#ENV ALLOWED_HOSTS=''

RUN mkdir /opt/src
WORKDIR /opt/src

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN rm -f requirements.txt

#COPY src .

EXPOSE 8060

#CMD python manage.py runserver 0.0.0.0:8060