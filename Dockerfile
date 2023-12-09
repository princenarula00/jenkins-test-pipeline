FROM redhat/ubi9
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/hexashop.zip /var/www/html
WORKDIR /var/www/html
RUN unzip hexashop.zip
RUN rm -rf hexashop.zip &&\
    mv templatemo_571_hexashop/* . &&\
    rm -rf templatemo_571_hexashop &&\
    mkdir /var/www/html/secure
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
