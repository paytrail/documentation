#!/bin/bash
set -euo pipefail

function teardown() {
    echo "INFO: Cleaning up."
    docker stop "${CONTAINER_ID}"
}

trap teardown EXIT

# Test Variables
EXPECTED_TITLE="Paytrail Integration Guide"

echo "INFO: Creating '${CONTAINER_NAME}' container from ${TAG} and binding it to port ${LOCAL_PORT}"
CONTAINER_ID=$(docker run --rm -dit --name "${CONTAINER_NAME}" -p "${LOCAL_PORT}:8080" ${TAG})

# Setup
echo "INFO: Waiting ${TIMEOUT} second(s) for service to be up..."
sleep ${TIMEOUT}

# Test Suites
echo "TEST: Index page responds with HTTP status 200 OK"
curl -sI "http://localhost:${LOCAL_PORT}" | grep "HTTP/1.1 200 OK"

echo "TEST: Index page HTML response contains string ${EXPECTED_TITLE}"
curl -s "http://localhost:${LOCAL_PORT}" | grep -c "${EXPECTED_TITLE}" > /dev/null

echo "INFO: Tests OK"
