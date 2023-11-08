#!/usr/bin/env bash

APP_IMAGE="ti-superset:1.0"
CONTEXT_PATH="${cicd_working_directory}"
DEFAULT_DOCKERFILES_PATH="${cicd_working_directory}/docker"

echo "${CONTEXT_PATH}"
echo "${DEFAULT_DOCKERFILES_PATH}"

docker build -t "${APP_IMAGE}" \
    -f "${DEFAULT_DOCKERFILES_PATH}/Dockerfile" \
    "${CONTEXT_PATH}"
