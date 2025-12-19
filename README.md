# Label-Only Membership Inference Attacks

This repository contains the reference implementation for the CCS 2021 paper *Membership Leakage in Label-Only Exposures*. The code trains target/shadow models and evaluates label-only membership inference attacks (entropy/loss based and decision-based).

## Quick Start
- Create/activate a conda environment (Python 3.10 is known to work), then install Python dependencies: `bash Install_deps.sh`.
- Datasets
  - CIFAR10/100 download automatically via torchvision into `data/`.
  - GTSRB and Face need to be placed under `data/GTSRB/` and `data/lfw/` respectively if you plan to use them.
- Run training or attacks from the project root. Examples assume CUDA is available; omit `--gpus` for CPU.

### Common Commands
- Train target models for CIFAR10 and CIFAR100:
  - `python main.py --action 0 --dataset-ids 0 1 --gpus 0`
- Train shadow models (CIFAR10 and CIFAR100):
  - `python main.py --action 1 --dataset-ids 0 1 --gpus 0`
- Adversary One (loss/entropy/maximum statistics; ensure target and shadow checkpoints exist):
  - `python main.py --action 3 --dataset-ids 0 1 --gpus 0 --advOne_metric AUC`
- Adversary Two (decision-based; HopSkipJump by default):
  - `python main.py --action 5 --dataset-ids 0 1 --gpus 0 --blackadvattack HopSkipJump`
- Certified radius evaluation (requires trained target checkpoints):
  - `python main.py --action 6 --dataset-ids 0 1 --gpus 0`

Key flags:
- `--dataset-ids`: choose which datasets to process (0=CIFAR10, 1=CIFAR100, 2=GTSRB, 3=Face).
- `--action`: selects the pipeline stage (0=train target, 1=train shadow, 2=train shadow with varying size, 3=Adversary One, 4=Adversary One varying size, 5=Adversary Two, 6=Decision Radius).
- `--gpus`: comma-separated GPU ids to expose (e.g., `0` or `0,1`). Leave empty to use current visibility/CPU.
- `--batch-size`, `--epochs`, `--lr`: standard training hyperparameters.

Outputs are written under `results/<DATASET>/` with `runx` logs and checkpoints for each cluster size.

## Citation
```bibtex
@inproceedings{LZ21,
author = {Zheng Li and Yang Zhang},
title = {{Membership Leakage in Label-Only Exposures}},
booktitle = {{ACM SIGSAC Conference on Computer and Communications Security (CCS)}},
publisher = {ACM},
year = {2021}
}
```
