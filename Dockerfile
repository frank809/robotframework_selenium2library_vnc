FROM ubuntu:16.04

MAINTAINER Frank liu "frank.cd.liu@gmail.com"

RUN apt-get update && \
    apt-get install -y xubuntu-desktop chromium-browser chromium-chromedriver vnc4server python-pip && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

RUN pip install robotframework robotframework-Selenium2Library

# Define default command.
RUN echo '#!/bin/bash' > /startup.sh && \
    echo "USER=root" >> /startup.sh && \
    echo "HOME=/root" >> /startup.sh && \
    echo "DISPLAY=:1.0" >> /startup.sh && \
    echo "export USER HOME DISPLAY" >> /startup.sh && \
    echo "vncserver :1" >> /startup.sh && \
    echo "bash" >> /startup.sh && chmod +x /startup.sh
CMD ["/startup.sh"]