
# Assert dataset paths
sed "s:images/:$PWD/dataset/images/:g" dataset/dataset.yaml > tmp/dataset.yaml

cd PyTorch_YOLOv4
    python3 train.py                        \
        --device 0                          \
        --batch-size 4                      \
        --img 1280                          \
        --data ../tmp/dataset.yaml    \
        --cfg ../cfg/tiny.cfg               \
        --weights ''                        \
        --name tiny
