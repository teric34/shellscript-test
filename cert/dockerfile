FROM alpine
RUN apk add --no-cache openssh-client
COPY shellscript.sh /shellscript.sh
RUN chmod 0744 /shellscript.sh
CMD ["crond", "-f"]