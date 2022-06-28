# yolov4-tiny on torch

Basic skel to effortlesly move around a yolov4-tiny training environment. Uses a needlessly beefy docker image, replace if you want to use a lighter one.

## Quickstart
- Clone repo
- Link your data to `dataset`: `ln -sf <your/dataset/path> dataset` 
- Run docker image with `bash docker_run.sh`
- Run `make` to download and configure the net architecture
- Train with `bash train.sh`