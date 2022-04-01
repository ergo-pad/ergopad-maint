# FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8
FROM postgres:alpine

COPY ./app /app
WORKDIR /app

# install system dependencies
RUN apk update \
  # && apt-get -y install netcat gcc postgresql nano \
  && apk add python3 \
  && apk add py-pip

# install python dependencies
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt
# WTF: this works just fine outside of rquirements.txt
RUN pip install discord

CMD tail /dev/null -f
