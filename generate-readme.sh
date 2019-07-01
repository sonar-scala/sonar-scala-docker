#!/usr/bin/env bash
set -e

mustache vars.json README.tpl.md > README.md
mustache vars.json README_DOCKERHUB.tpl.md > README_DOCKERHUB.md
