FROM apachesuperset.docker.scarf.sh/apache/superset:3.0.0

USER root

RUN mkdir -p /app/theiconic/scripts \
    && chown -R superset:superset /app/theiconic

USER superset

COPY theiconic/scripts/init.sh /app/theiconic/scripts/
COPY theiconic/scripts/bootstrap.sh /app/theiconic/scripts/
COPY theiconic/scripts/superset_config.py /app/theiconic/scripts/
COPY theiconic/requirements.txt /app/theiconic/requirements.txt

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r /app/theiconic/requirements.txt
