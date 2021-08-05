FROM archlinux:latest

WORKDIR /root

#COPY script.sh /root
#RUN chmod +x script.sh

#RUN /root/script.sh

# SET LOCALE
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
RUN echo 'LANG=en_US.UTF-8' > /etc/locale.conf        
RUN locale-gen

#RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -Syu \
        fd \
        git \
        make \
        neovim \
        nodejs-lts-erbium \
        npm6 \
        ripgrep \
        which

RUN git clone https://github.com/compiler-explorer/compiler-explorer.git compiler-explorer

WORKDIR /root/compiler-explorer

ENTRYPOINT "make"


