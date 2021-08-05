FROM archlinux:latest

#VOLUME /opt/compiler-explorer
ENV INSTALL_DIR=/opt
ENV APP_DIR=${INSTALL_DIR}/compiler-explorer

WORKDIR /opt

# SETUP LOCALES
#RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
#RUN echo 'LANG=en_US.UTF-8' > /etc/locale.conf        
#RUN locale-gen

# UPDATE AND INSTALL ARCHLINUX PACKAGES
# CLONE COMPILER-EXPLORER AT /opt/compiler-explorer
# PREPARE THE APP
RUN pacman --noconfirm -Syu \
        fd \
        git \
        make \
        neovim \
        nodejs-lts-erbium \
        npm6 \
        ripgrep \
        which \
                \
    && git clone https://github.com/compiler-explorer/compiler-explorer.git \
        compiler-explorer \
                            \
    && make prereqs -C ${APP_DIR}



# CLONE COMPILER-EXPLORER AT /root/compiler-explorer
# RUN git clone https://github.com/compiler-explorer/compiler-explorer.git \
#         compiler-explorer

#WORKDIR /opt/compiler-explorer

#RUN make prereqs -C ${APP_DIR}

ENTRYPOINT "make"

CMD "run"


