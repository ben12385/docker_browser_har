FROM debian:stable-slim

# for the VNC connection
EXPOSE 5900
# Use environment variable to allow custom VNC passwords
ENV VNC_PASSWD=123456

# Install VNC dependencies
ENV APT_INSTALL_PRE="apt -o Acquire::ForceIPv4=true update && DEBIAN_FRONTEND=noninteractive apt -o Acquire::ForceIPv4=true install -y --no-install-recommends"
RUN eval ${APT_INSTALL_PRE} tigervnc-standalone-server tigervnc-common tigervnc-tools fluxbox eterm xterm net-tools python3 python3-pip scrot chromium

# Add non-root user
RUN useradd -m -s /bin/bash -g users -u 1000 user
RUN chown -R user:users /home/user && chown user:users /opt

# Install scanURL dependencies
RUN apt install -y python3-tk python3-dev gnome-screenshot

# Install ffmeg
# RUN apt install -y ffmpeg

USER user


# Subsequent images can put their scripts to run at startup here
RUN mkdir /opt/startup_scripts


COPY --chown=user:users requirements.txt /opt/startup_scripts/requirements.txt
RUN pip3 install --break-system-packages -r /opt/startup_scripts/requirements.txt

# Copy various files to their respective places
COPY --chown=user:users --chmod=776 container_startup.sh /opt/container_startup.sh
COPY --chown=user:users --chmod=776 x11vnc_entrypoint.sh /opt/x11vnc_entrypoint.sh
COPY --chown=user:users harDlButton.png /opt/startup_scripts/harDlButton.png
COPY --chown=user:users --chmod=776 scanURL.py /opt/startup_scripts/scanURL.py

ENV DISPLAY=":0"

# COPY --chown=user:users chromium_profile/chromium /home/user/.config/chromium

ENTRYPOINT ["/opt/container_startup.sh"]