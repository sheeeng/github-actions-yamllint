FROM library/python:3.8.2-alpine

RUN pip install \
    --no-cache-dir \
    yamllint==1.23.0 \
    && apk add \
    --no-cache \
    bash=5.0.11-r1 \
    figlet=2.2.5-r0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
