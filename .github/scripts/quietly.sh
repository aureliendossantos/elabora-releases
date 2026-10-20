#!/usr/bin/env bash
# quietly <name> <command…>: runs a command on the private app sources with its output in a log file,
# $RUNNER_TEMP/elabora-logs/<name>.log, never in this repository's public Actions logs. Prints the step's name,
# duration and exit code only. When a job fails, its logs go to the run's draft release, which only the
# repository's maintainers see.
set -uo pipefail
name=$1
shift
logs="${RUNNER_TEMP:?}/elabora-logs"
mkdir -p "$logs"
start=$SECONDS
"$@" >"$logs/$name.log" 2>&1
code=$?
if [ "$code" -eq 0 ]; then
  echo "$name: done in $((SECONDS - start)) s."
else
  echo "::error::$name failed with exit code $code after $((SECONDS - start)) s. Its log is attached to this run's draft release (maintainers only)."
fi
exit "$code"
