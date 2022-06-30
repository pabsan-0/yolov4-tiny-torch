
# Assert dataset paths
sed "s:images/:$PWD/dataset/images/:g" dataset/dataset.yaml > tmp/dataset.yaml

rm -rf PyTorch_YOLOv4/runs/test/

pushd PyTorch_YOLOv4
    python3 test.py                         \
        --conf 0.001                        \
        --batch-size 32                     \
        --device 0                          \
        --img 1280                          \
        --data ../tmp/dataset.yaml          \
        --cfg ../cfg/tiny.cfg               \
        --task test                         \
        --weights ../best.pt \
        --name tiny                         \
        --save-json
popd

# Run with default conf threshold i.e. 0.001
python3 tmp/yaml2json.py tmp/dataset.yaml test > tmp/dataset_test.json
python3 tmp/valcoco.py tmp/dataset_test.json PyTorch_YOLOv4/runs/test/*/*_predictions.json


