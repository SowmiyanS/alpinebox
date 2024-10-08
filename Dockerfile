FROM alpine

RUN apk add --no-cache bash fluxbox supervisor xvfb xterm x11vnc firefox-esr

ENV DISPLAY=:0.0 \ 
  DISPLAY_WIDTH=1024 \
  DISPLAY_HEIGHT=768 \
  RUN_XTERM=yes \
  RUN_FLUXBOX=yes

COPY . /app

CMD ["/app/entrypoint.sh"]

EXPOSE 5900
