
sudo docker build -t yolov4tiny/torch .
xhost +
sudo docker run                    \
    -it                            \
    --rm                           \
    --runtime nvidia               \
    --name "yolov4-tiny-torch"             \
    -h "yolov4-tiny-torch"                 \
    -v '/dev/bus/usb':'/dev/bus/usb' \
    --privileged                    \
    -e DISPLAY=$DISPLAY            \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --network host                 \
    -v $PWD:/pablo               \
    -v $(readlink -f dataset):/pablo/dataset               \
    --shm-size=12g                      \
    yolov4tiny/torch
