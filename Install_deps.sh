#!/usr/bin/env bash
set -euo pipefail

# Install Python dependencies for Label-Only MIA. Run inside the target conda environment.
pip install --upgrade pip
pip install \
  runx \
  adversarial-robustness-toolbox \
  foolbox \
  scikit-image \
  scikit-learn \
  matplotlib \
  seaborn \
  pandas \
  tqdm
