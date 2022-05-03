#!/bin/bash
set -e

# Init venv
python -m venv .trashnet-keras

# Pip deps
.trashnet-keras/bin/pip install --upgrade pip
.trashnet-keras/bin/pip install -e ../../fedn
.trashnet-keras/bin/pip install -r requirements.txt