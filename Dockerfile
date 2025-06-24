FROM almalinux:9.5

RUN dnf install -y epel-release && dnf update -y && dnf clean all
RUN dnf -y group install "Development Tools"
RUN dnf -y install rrdtool httpd cpan perl-XML-Dumper rrdtool-perl perl-CGI net-snmp-utils net-snmp-perl
RUN dnf -y install vim wget python3-pip
RUN cpan install RRD::Simple

RUN pip install yacron

RUN adduser --uid 1000 grasshopper
WORKDIR /home/grasshopper/grasshopper
COPY --chown=1000:1000 . /home/grasshopper/grasshopper/
RUN usermod -a -G apache grasshopper

ENTRYPOINT ["/home/grasshopper/grasshopper/entrypoint.sh"]

EXPOSE 3000