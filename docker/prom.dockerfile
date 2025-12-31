
FROM prom/prometheus
ARG FASTAPI_HOST
ARG STREAMLIT_HOST

WORKDIR /app

ENV FASTAPI_HOST=$FASTAPI_HOST
ENV STREAMLIT_HOST=$STREAMLIT_HOST

COPY prometheus/prometheus.yml       /etc/prometheus/prometheus.yml
COPY prometheus/prometheus.rules.yml /etc/prometheus/prometheus.rules.yml
RUN echo '[{"targets": ["'$FASTAPI_HOST'"], "labels": { "service": "streamlit" }}]' > /etc/prometheus/fastapi.json
RUN echo '[{"targets": ["'$STREAMLIT_HOST'"], "labels": { "service": "streamlit" }}]' > /etc/prometheus/streamlit.json

EXPOSE 9090
