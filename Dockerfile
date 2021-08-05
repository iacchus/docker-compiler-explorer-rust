FROM archlinux:latest

#VOLUME /opt/compiler-explorer
ENV INSTALL_DIR=/opt
ENV APP_DIR=${INSTALL_DIR}/compiler-explorer

# /opt
WORKDIR ${INSTALL_DIR}

RUN pacman --noconfirm -Syu \
        git \
        make \
        nodejs-lts-erbium \
        npm6 \
        which \
        \
    && git clone https://github.com/compiler-explorer/compiler-explorer.git \
        ${APP_DIR} \
        \
    && make prereqs -C ${APP_DIR}

# /opt/compiler-explorer
WORKDIR ${APP_DIR}

ENTRYPOINT make
CMD run


