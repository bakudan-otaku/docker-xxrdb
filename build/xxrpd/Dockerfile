# Inspired by:
# https://github.com/danchitnis/container-xrdp

FROM ubuntu:resolute

ENV DEBIAN_FRONTEND=noninteractive

COPY sources.list /etc/apt/

RUN apt-get -y update  \
 && apt-get -y upgrade

RUN apt-get install -y \
    xfce4 \
    xfce4-clipman-plugin \
    xfce4-cpugraph-plugin \
    xfce4-netload-plugin \
    xfce4-screenshooter \
    xfce4-taskmanager \
    xfce4-terminal \
    xfce4-xkb-plugin \
    dbus-x11 \
    ristretto \
    vlc \
    vlc-l10n vlc-plugin-fluidsynth vlc-plugin-jack \
    libxvidcore4 libfaac0 \
    firefox \
    emacs \
    gnome-commander \
    nomacs \
 && apt-get install -y \
    sudo \
    wget \
    xorgxrdp \
    xrdp && \
    apt remove -y light-locker xscreensaver && \
    apt autoremove -y && \
    rm -rf /var/cache/apt /var/lib/apt/lists

# https://github.com/danielguerra69/ubuntu-xrdp/blob/master/Dockerfile
RUN mkdir /var/run/dbus && \
    cp /etc/X11/xrdp/xorg.conf /etc/X11 && \
    sed -i "s/console/anybody/g" /etc/X11/Xwrapper.config && \
    sed -i "s/xrdp\/xorg/xorg/g" /etc/xrdp/sesman.ini && \
    echo "xfce4-session" >> /etc/skel/.Xsession

COPY run.sh /usr/bin

# Docker config
EXPOSE 3389
ENTRYPOINT ["/usr/bin/run.sh"]

