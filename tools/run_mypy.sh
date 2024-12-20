#!/usr/bin/env bash

# Run mypy in check mode to ensure that there are no missing types
# Will exit non-zero if there are errors or incorrectly formatted python imports.

set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${DIR}/..
source ./venv/bin/activate

export PYTHONPATH="./devon_bray_portfolio:./test${PYTHONPATH+:}${PYTHONPATH:-}"

mypy --show-error-codes create_static_portfolio.py  # Run on loose files within this project
mypy --show-error-codes -p devon_bray_portfolio -p test  # Run on sub-packages within this project

