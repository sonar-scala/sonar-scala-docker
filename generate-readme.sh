#!/usr/bin/env bash
set -e
mustache vars.js README.tpl.md > README.md
mustache vars.js README_DOCKERHUB.tpl.md > README_DOCKERHUB.md
