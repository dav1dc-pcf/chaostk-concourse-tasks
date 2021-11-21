#!/usr/bin/env bash

# DEBUG
set -x

# Generate a k6 config file for a simple test
echo -ne "import http from 'k6/http';\n\nexport default function () {\n  http.get(\"${SITE_TO_TEST}\");\n}\n" > http_get.js

# DO IT!
k6 run -u ${VIRTUAL_USERS} -i ${REQUEST_COUNT} -d ${TEST_DURATION_LIMIT} http_get.js
