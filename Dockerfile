FROM registry.access.redhat.com/ubi8/ubi:latest

RUN yum -y update
RUN yum -y install httpd
RUN yum -y install python3
RUN yum -y install git
RUN echo 'httpd v2.5 test' > /var/www/html/index.html
RUN mkdir /home/project
WORKDIR /home/project
RUN git init
RUN git remote add origin https://github.com/AJIOXA/prebeta
RUN git pull https://github.com/AJIOXA/prebeta
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
EXPOSE 80
