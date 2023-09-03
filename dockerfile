FROM apache/airflow:latest-python3.11

WORKDIR /opt/airflow
COPY airflow/ .
RUN pip install --upgrade pip \
    && pip install -r requirements --no-cache-dir
