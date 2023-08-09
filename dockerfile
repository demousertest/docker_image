FROM ubuntu:latest
COPY . /reverse
WORKDIR /reverse
CMD python reverse.py

