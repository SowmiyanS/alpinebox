FROM alpine

RUN apk add --no-cache bash fluxbox supervisor xvfb xterm x11vnc firefox-esr git wget python3 py3-pip

ENV DISPLAY=:0.0 \ 
  DISPLAY_WIDTH=1024 \
  DISPLAY_HEIGHT=768 \
  RUN_XTERM=yes \
  RUN_FLUXBOX=yes

COPY . /app

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz -O /tmp/geckodriver.tar.gz \
	&& tar -C /opt -xzf /tmp/geckodriver.tar.gz \
	&& chmod 755 /opt/geckodriver \
        && ln -fs /opt/geckodriver /usr/bin/geckodriver \                                                   && ln -fs /opt/geckodriver /usr/local/bin/geckodriver 

RUN cd /app/
RUN git clone https://github.com/Sowmi-N/pwd-recurse.git
RUN cd pwd-recurse && python3 -m venv /app/pwd-recurse && . /app/pwd-recurse/bin/activate && pip install selenium

CMD ["/app/entrypoint.sh"]

EXPOSE 5900
