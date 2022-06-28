 
default: PyTorch_YOLOv4 cfg/yolov4-tiny-custom.cfg 

	mkdir tmp || rm tmp/*
	wget https://raw.githubusercontent.com/pabsan-0/yolo-tools/main/makecfg.py -P tmp/
	python3 tmp/makecfg.py -i cfg/yolov4-tiny-custom.cfg -n 8991 -c 1
	mv cfg/yolov4-tiny-custom_custom.cfg cfg/tiny.cfg

	sed "3s/.*/# batch=1/" 		              -i cfg/tiny.cfg
	sed "4s/.*/# subdivisions=1/"             -i cfg/tiny.cfg
	sed "s/^subdivisions=.*/subdivisions=1/"  -i cfg/tiny.cfg


PyTorch_YOLOv4:
	git clone https://github.com/WongKinYiu/PyTorch_YOLOv4/
	sed '98i\                pred = pred.cpu()' -i.backup PyTorch_YOLOv4/utils/plots.py

cfg/yolov4-tiny-custom.cfg:
	mkdir cfg || true
	cp PyTorch_YOLOv4/cfg/yolov4-tiny.cfg cfg/yolov4-tiny-custom.cfg


clean:
	rm -rf cfg
	rm -rf tmp
	rm -rf PyTorch_YOLOv4


