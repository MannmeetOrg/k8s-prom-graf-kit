#!/bin/bash
# Validate all prometheus alert rules using promtool

RULES_DIR="./crds/prometheusrules"

for rulefile in $RULES_DIR/*.yaml; do
  if ! promtool check rules $rulefile; then
    echo "Error in $rulefile"
    exit 1
  else
    echo "$rulefile is valid"
  fi
done
