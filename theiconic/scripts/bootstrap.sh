#!/usr/bin/env bash

set -eo pipefail

case "${1}" in
  worker)
    echo "Starting Celery worker..."
    celery --app=superset.tasks.celery_app:app worker -O fair -l INFO
    ;;
  beat)
    echo "Starting Celery beat..."
    rm -f /tmp/celerybeat.pid
    celery --app=superset.tasks.celery_app:app beat --pidfile /tmp/celerybeat.pid -l INFO -s "${SUPERSET_HOME}"/celerybeat-schedule
    ;;
  app)
    echo "Starting web app (using development server)..."
    flask run -p 8088 --with-threads --reload --debugger --host=0.0.0.0
    ;;
  app-gunicorn)
    echo "Starting web app..."
    /usr/bin/run-server.sh
    ;;
  *)
    echo "Unknown Operation!!!"
    ;;
esac
