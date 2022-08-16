FROM davorg/perl-dancer2:latest
WORKDIR /srv/Timer
COPY . .
RUN cpanm --installdeps --notest --with-feature=accelerate .
EXPOSE 4000
CMD plackup -p 4000 bin/app.psgi
