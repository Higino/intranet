FROM montefuscolo/tiki-wiki:16x
MAINTAINER Higino Silva <higino@gmail.com>

#Copy enear images to be used in site template
COPY img/enear-logo1.png /var/www/html/img/enear-logo1.png
COPY img/logo-enear-black.png /var/www/html/img/logo-enear-black.png
COPY img/logo-enear-white.png /var/www/html/img/logo-enear-white.png
COPY lastiki_BRANCH-16-x.zip /root

RUN apt-get update
#Install php LDAP module to connect intranet to ActiveDirectory
RUN apt-get -y install php5-ldap

# Fix issues with LDAP apache module instalation
RUN cp /etc/php5/mods-available/ldap.ini /usr/local/etc/php/conf.d/
RUN cp /usr/lib/php5/20131226/ldap.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/

#Copy tikiwiki 16.3 (daily build) to fixx issues in the login page
RUN cd ~ && mkdir www && unzip lastiki_BRANCH-16-x.zip -d ./www
# Intall tikiwiki 16.3
RUN cd ~ && cp -R ./www/BRANCH-16-x/* /var/www/html/
