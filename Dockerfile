FROM wordpress:5.0.3-apache

RUN apt-get update && \
    apt-get install -y  --no-install-recommends ssl-cert && \
    rm -r /var/lib/apt/lists/* && \
    a2enmod ssl && \
    a2ensite default-ssl 
    
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 80
EXPOSE 443
