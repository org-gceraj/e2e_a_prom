
FROM prom/prometheus

WORKDIR /app

COPY prometheus/prometheus.yml       /etc/prometheus/prometheus.yml
COPY prometheus/prometheus.rules.yml /etc/prometheus/prometheus.rules.yml
COPY prometheus/fastapi.json         /etc/prometheus/fastapi.json
COPY prometheus/streamlit.json       /etc/prometheus/streamlit.json

EXPOSE 9090
