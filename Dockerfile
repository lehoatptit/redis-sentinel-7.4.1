#redis version 7.4.1
FROM docker.io/library/redis:7.4.1-alpine3.20

#tao thu muc lam viec
RUN mkdir -p /etc/redis-sentinel
RUN mkdir -p /etc/redis-sentinel/data && \
    mkdir -p /etc/redis-sentinel/logs

# thu muc lam viec
WORKDIR /etc/redis-sentinel

# Copy file sentinel.conf vao container
COPY /conf/sentinel.conf /etc/redis-sentinel/sentinel.conf

# Copy script entrypoint
COPY sentinel-entrypoint.sh /usr/local/bin/

# thiet lap quyen thuc thi va so huu file
RUN chown redis:redis /etc/redis-sentinel/* && \
    chmod +x /usr/local/bin/sentinel-entrypoint.sh

# mo port  26379 cho Redis Sentinel trong image
EXPOSE 26379

# dat entrypoint cho contaienr thuc thi lenh chay service sentinel
