# Base docker image
FROM ubuntu:18.04

# Update APT
RUN apt-get update

# Dependendencies required for viber
# viber depends on libssl1.0.0; 
# viber depends on gstreamer1.0-plugins-ugly; 
# viber depends on gstreamer1.0-libav; 

# Install Deps required for viber
#RUN apt-get install -y \
#    dbus-x11 \
#    dunst \
#    hunspell-en-us \
#    python3-dbus \
#    software-properties-common \
#    libx11-xcb1 \
#    gconf2 \
#    wget libgl1-mesa-dri libgl1-mesa-glx libxcomposite1 libxslt1.1 libgstreamer0.10-0 libgstreamer-plugins-base0.10-0  \
#    zenity  --no-install-recommends

RUN apt-get install -y libssl1.0
RUN apt-get install -y gstreamer1.0-plugins-ugly
RUN apt-get install -y gstreamer1.0-libav
RUN apt-get install -y wget

RUN apt-get install -y libpulse0 \
    libnss3 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-pulseaudio

# Install other requirements with dependencies
#RUN apt-get install -y  libpulse0 libasound2 libnss3 libcurl3  binutils

# APT Clean
RUN apt-get clean

#Download Viber
RUN wget -c http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -O /tmp/viber.deb
RUN dpkg -i /tmp/viber.deb
RUN rm /tmp/viber.deb

#RUN strip /opt/viber/Viber

RUN apt-get install -y libx11-xcb1 libxcb-composite0 libxcb-present0 libxcb-sync1 libxcb-icccm4 libxcb-image0 libxcb-keysyms1  libxcb-render0 libxcb-render-util0 libxcb-xfixes0 libxcb-xfixes0 libxcb-randr0 libxcb-shape0 libxcb-xkb1 libxtst6

RUN apt-get install -y libxss1 libgl1-mesa-glx
RUN apt-get install -y libpulse-mainloop-glib0 libxi6 libxrandr2 libpci3 libxslt1.1 libegl1
RUN apt-get install -y libqt5gui5

RUN useradd -s /bin/bash -m gui

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
#ENV QT_GRAPHICSSYSTEM="native"

USER gui
# Autorun x11vnc
CMD /opt/viber/Viber

