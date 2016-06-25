FROM alpine:3.3
MAINTAINER Hannes Hochreiner <hannes@hochreiner.net>
RUN apk add --no-cache subversion apache2-webdav apache2-utils mod_dav_svn
RUN mkdir /run/apache2
RUN mkdir /var/svnrepo
ADD httpd.conf /etc/apache2/
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
