
FROM prom/prometheus
ARG BA_FASTAPI_HOST
ARG BA_STREAMLIT_HOST

WORKDIR /app

ENV E_FASTAPI_HOST=$BA_FASTAPI_HOST
ENV E_STREAMLIT_HOST=$BA_STREAMLIT_HOST

COPY prometheus/prometheus.yml       /etc/prometheus/prometheus.yml
COPY prometheus/prometheus.rules.yml /etc/prometheus/prometheus.rules.yml
RUN echo '[{"targets": ["'${E_FASTAPI_HOST}'"], "labels": { "service": "streamlit" }}]' > /etc/prometheus/fastapi.json
RUN echo '[{"targets": ["'${E_STREAMLIT_HOST}'"], "labels": { "service": "streamlit" }}]' > /etc/prometheus/streamlit.json

EXPOSE 9090

