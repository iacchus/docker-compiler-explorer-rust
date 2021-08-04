FROM archlinux:latest

WORKDIR /root

COPY script.sh /root
RUN chmod +x script.sh

RUN /root/script.sh

CMD "bash"


