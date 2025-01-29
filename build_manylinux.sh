#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Activate the Python version you want to build for
# PYTHON_VERSION="cp38-cp38"  # Change this for other versions
# PYTHON_BIN="/opt/python/${PYTHON_VERSION}/bin/python"


# Upgrade pip & install dependencies
python -m pip install --upgrade pip build scikit-build-core

# Build the wheel
python -m build

# Audit the wheel for manylinux compliance
AUDITWHEEL_REPAIR="auditwheel repair dist/*.whl --plat manylinux_2_36_x86_64 -w dist/"
echo "Running: ${AUDITWHEEL_REPAIR}"
eval ${AUDITWHEEL_REPAIR}
