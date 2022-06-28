FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /pablo

# This goes first so we dont have repo key issues (cuda)
RUN rm /etc/apt/sources.list.d/* && apt clean && apt update && \ 
    apt-get install -y terminator --no-install-recommends && \
    apt-get install -y python3-opencv                     && \
    apt-get install -y tmux                               && \
    apt-get install -y vim                                && \
    apt-get install -y nano                               && \
    apt-get install -y tree                               && \
    apt-get install -y git                                && \
    apt-get install -y wget                               && \
    git config --global --add safe.directory /pablo 

RUN python3 -m pip install --upgrade pip                && \
    python3 -m pip install termcolor                    && \    
    python3 -m pip install paho-mqtt                    && \
    python3 -m pip install pandas                       && \
    python3 -m pip install matplotlib   && \
    python3 -m pip install numpy && \
    python3 -m pip install Pillow && \
    python3 -m pip install PyYAML && \
    python3 -m pip install requests && \
    python3 -m pip install scipy && \
    python3 -m pip install torch && \
    python3 -m pip install torchvision && \
    python3 -m pip install tqdm && \
    python3 -m pip install tensorboard && \
    python3 -m pip install pandas && \
    python3 -m pip install seaborn && \
    python3 -m pip install thop && \
    python3 -m pip install pycocotools && \
    python3 -m pip install imagesize && \
    python3 -m pip install opencv-python>=4.1.2 && \
    python3 -m pip install Cython   && \
    python3 -m pip install pycocotools==2.0.2   && \
    python3 -m pip uninstall -y protobuf && pip3 install protobuf==3.19

CMD ["/bin/bash"]

