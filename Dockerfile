# Base docker image
FROM ubuntu:latest

# Update APT
RUN apt-get update

# Install Deps required for viber
RUN apt-get install -y \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    python3-dbus \
    software-properties-common \
    libx11-xcb1 \
    gconf2 \
    wget libgl1-mesa-dri libgl1-mesa-glx libxcomposite1 libxslt1.1  libgstreamer0.10-0 libgstreamer-plugins-base0.10-0  \
    zenity  --no-install-recommends

# Install other requirements with dependencies
RUN apt-get install -y  libpulse0 libasound2 libnss3 libcurl3  binutils

# APT Clean
apt-get clean

#Download Viber
RUN wget http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -O /tmp/viber.deb
RUN dpkg -i /tmp/viber.deb
RUN rm /tmp/viber.deb

#RUN strip /opt/viber/Viber

RUN apt-get install -y libx11-xcb1 libxcb-composite0 libxcb-present0 libxcb-sync1 libxcb-icccm4 libxcb-image0 libxcb-keysyms1  libxcb-render0 libxcb-render-util0 libxcb-xfixes0 libxcb-xfixes0 libxcb-randr0 libxcb-shape0 libxcb-xkb1 libxtst6

RUN useradd -s /bin/bash -m gui

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun x11vnc
CMD sudo -u gui -i  -- /opt/viber/Viber
