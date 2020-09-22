FROM redmine:4.0

RUN apt-get update && apt-get install -y --no-install-recommends \
        antiword \
        catdoc \
        catdvi \
        djview \
        djview3 \
        gcc \
        gzip \
        libemail-outlook-message-perl \
        libwpd-tools \
        libwps-tools \
        libxapian-dev \
        make \
        poppler-utils \
        ruby-xapian \
        uuid \
        uuid-dev \
        unrtf \
        unzip \
        xapian-omega \
        xpdf \
        xz-utils \
;

RUN apt-get install xapian-omega ruby-xapian \
      libxapian-dev xpdf poppler-utils \
      antiword unzip \
      catdoc libwpd-tools \
      libwps-tools gzip unrtf catdvi djview djview3 \ 
      uuid uuid-dev xz-utils libemail-outlook-message-perl \
;

# plugin
RUN git clone https://github.com/danmunn/redmine_dmsf.git plugins/redmine_dmsf
RUN git clone https://github.com/onozaty/redmine-view-customize.git plugins/view_customize
RUN git clone https://github.com/mikitex70/redmine_drawio.git plugins/redmine_drawio
RUN git clone https://github.com/dkd/plantuml plugins/plantuml

# theme
RUN git clone https://github.com/makotokw/redmine-theme-gitmike public/themes/redmine-theme-gitmike
RUN git clone https://github.com/tsi/redmine-theme-flat public/themes/redmine-theme-flat
RUN git clone https://github.com/nti-ufpe/circle public/themes/circle

# plantuml
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y default-jre 
RUN apt-get install wget
RUN mkdir -p /share
RUN wget https://sourceforge.net/projects/plantuml/files/plantuml.jar -O /share/plantuml.jar
COPY plantuml.sh /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml
