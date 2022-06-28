
# Assert dataset paths
sed "s:images/:$PWD/dataset/images/:g" dataset/dataset.yaml > tmp/dataset.yaml

cd PyTorch_YOLOv4
    python3 test.py                         \
        --conf 0.001                        \
        --batch 8                           \
        --device 0                          \
        --img 1280                          \
        --data ../tmp/dataset.yaml          \
        --cfg ../cfg/tiny.cfg               \
        --weights ../best.pt                \
        --name tiny

## This fixed a bug (already on makefile)     
## 	sed '98i\                pred = pred.cpu()' -i.backup PyTorch_YOLOv4/utils/plots.py
