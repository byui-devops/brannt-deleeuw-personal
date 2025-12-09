
#!/usr/bin/env bash
set -euo pipefail
APP_URL="$1"
code=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/health")
if [[ "$code" == "200" ]]; then
  echo "App healthy at $APP_URL"
else
  echo "App not healthy (HTTP $code) at $APP_URL" && exit 1
fi
