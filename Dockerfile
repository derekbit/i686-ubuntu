FROM i686/ubuntu

RUN \
  apt-get update && \
  apt-get install -y gcc build-essential gettext ncdu git jq man wget screen pv xz-utils unzip vim-nox openssh-server \
                    sudo make cmake pkg-config flex mtd-utils texinfo bison gawk bc automake scons net-tools cpio rpm2cpio openjdk-7-jre nasm kmod \
                    libglib2.0-dev libglib2.0-bin transfig libncurses5-dev libmysqlclient-dev python-dev ruby ruby-dev p7zip exuberant-ctags cscope \
                    qemu  libacl1-dev libssl-dev uuid-dev uuid zlib1g-dev gcc-multilib g++-multilib yasm nasm libtool autoconf autogen

RUN echo 'root:root' | chpasswd
RUN sed --in-place=.bak 's/without-password/yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]

ENV HOME /root
WORKDIR /root

