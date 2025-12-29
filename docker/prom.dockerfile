
FROM prom/prometheus

WORKDIR /app

COPY prometheus/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090
