from fedora:latest

RUN dnf update -y

#COPY plexmediaserver-1.2.0.2716-837790c.x86_64.rpm /root
#RUN dnf install /root/plexmediaserver-1.2.0.2716-837790c.x86_64.rpm

COPY plex.repo /etc/yum.repos.d
RUN dnf install -y sudo plexmediaserver

RUN mkdir /config && /usr/bin/chown plex /config
RUN mkdir /data && /usr/bin/chown plex /data

ENV HOME="/config" \
    PLEX_UID=32400 \
    PLEX_GID=32400

EXPOSE 32400

COPY plex.conf /etc/security/limits.d/plex.conf
COPY start.sh /usr/local/bin
CMD ["/usr/local/bin/start.sh"]
