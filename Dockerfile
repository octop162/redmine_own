FROM redmine:4.0

RUN apt-get update && apt-get install -y --no-install-recommends \
      antiword\
      catdoc \
      catdvi \
      djview \
      djview3 \ 
      gcc \
      graphviz \
      gzip \
      libemail-outlook-message-perl \
      libwpd-tools \
      libwps-tools \
      libxapian-dev \
      make \
      antiword \
      poppler-utils \
      ruby-xapian \
      unrtf \
      unzip \
      uuid \
      uuid-dev \
      xapian-omega \
      xpdf \
      xz-utils \
      default-jre \
      wget\
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
RUN mkdir -p /share
RUN wget https://sourceforge.net/projects/plantuml/files/plantuml.jar -O /share/plantuml.jar
COPY plantuml.sh /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml
