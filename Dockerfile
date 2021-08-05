FROM mercvrivs/compiler-explorer-archlinux:latest

#VOLUME /opt/compiler-explorer
ENV INSTALL_DIR=/opt
ENV APP_DIR=${INSTALL_DIR}/compiler-explorer
ENV TOOLS_DIR=${INSTALL_DIR}/compiler-explorer-tools

# /opt
WORKDIR ${INSTALL_DIR}

RUN pacman --noconfirm -Syu gcc rust

RUN git clone https://github.com/compiler-explorer/compiler-explorer-tools \
        ${TOOLS_DIR}

RUN cargo install --path ${TOOLS_DIR}/rust --root /usr

ADD rust.local.properties ${APP_DIR}/etc/config/rust.local.properties

# /opt/compiler-explorer
WORKDIR ${APP_DIR}

ENTRYPOINT make
CMD run

