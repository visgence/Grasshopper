FROM almalinux:9.5

RUN dnf install -y epel-release && dnf update -y && dnf clean all
RUN dnf -y group install "Development Tools"
RUN dnf -y install rrdtool httpd cpan perl-XML-Dumper rrdtool-perl perl-CGI net-snmp-utils net-snmp-perl
RUN dnf -y install vim wget
RUN cpan install RRD::Simple

RUN wget https://github.com/gjcarneiro/yacron/releases/download/0.19.0/yacron-0.19.0-x86_64-unknown-linux-gnu && \
    chmod +x yacron-0.19.0-x86_64-unknown-linux-gnu && \
    mv yacron-0.19.0-x86_64-unknown-linux-gnu /usr/local/bin/yacron

RUN adduser --uid 1000 grasshopper
WORKDIR /home/grasshopper/grasshopper
COPY --chown=1000:1000 . /home/grasshopper/grasshopper/
USER grasshopper
ENTRYPOINT ["/home/grasshopper/grasshopper/entrypoint.sh"]

EXPOSE 3000