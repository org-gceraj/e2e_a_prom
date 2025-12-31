
FROM prom/prometheus

WORKDIR /app
RUN mkdir -p /gceraj

COPY prometheus/prometheus.yml /etc/prometheus/prometheus.yml
COPY prometheus/prometheus.rules.yml /etc/prometheus/prometheus.rules.yml
EXPOSE 9090
