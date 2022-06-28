# yolov4-tiny on torch

Basic skel to effortlesly move around a yolov4-tiny training environment. Uses a needlessly beefy docker image, replace if you want to use a lighter one.

## Quickstart
- Clone repo
- Link your data to `dataset`: `ln -sf <your/dataset/path> dataset` 
- Run docker image with `bash docker_run.sh`
- Run `make` to download and configure the net architecture
- Train with `bash train.sh`
- Test with `bash test.sh`


## Handy stuff

```
# Symlink to avoid tree navigation through results
ln -s PyTorch_YOLOv4/runs/train train-runs

# Plot output from results.txt
import numpy as np
import matplotlib.pyplot as plt
res = np.loadtxt('results.txt', dtype=object)
ap50 = np.array(res[:,10], dtype=float)
map = np.array(res[:,11], dtype=float)
plt.plot(ap50)
plt.plot(map)
plt.savefig('results.png')

```


## Credits

- [WongKinYiu/PyTorch_YOLOv4/](https://github.com/WongKinYiu/PyTorch_YOLOv4/):
    - Most code
    - Cfg architecture base file
