FROM ubuntu:16.04

MAINTAINER Frank liu "frank.cd.liu@gmail.com"


WORKDIR /

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y --force-yes xubuntu-desktop && \
    apt-get install -y chromium-browser chromium-chromedriver vnc4server python-pip openssh-server && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

RUN pip install robotframework robotframework-Selenium2Library robotframework-sshlibrary robotframework-selenium2screenshots

#for VNC use password password

# Define default command.
COPY ./startup.sh /startup.sh
RUN ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/ && \
    chmod +x /startup.sh && \
    useradd -m robot

WORKDIR /home/robot
USER robot
CMD ["/startup.sh"]
