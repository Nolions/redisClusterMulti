FROM redis:6.2-alpine

WORKDIR /usr/local/etc/redis

COPY configs/redis6379.conf ./redis6379.conf
COPY configs/redis7002.conf ./redis7002.conf
COPY configs/redis7003.conf ./redis7003.conf
COPY configs/redis7004.conf ./redis7004.conf
COPY configs/redis7005.conf ./redis7005.conf
COPY configs/redis7006.conf ./redis7006.conf

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh && \
    apk add --no-cache dos2unix && \
    dos2unix /usr/local/bin/start.sh

EXPOSE 6379 7002 7003 7004 7005 7006

CMD ["/usr/local/bin/start.sh"]
