 
default: cfg/yolov4-tiny-custom.cfg PyTorch_YOLOv4

	mkdir tmp || rm tmp/*
	wget https://raw.githubusercontent.com/pabsan-0/yolo-tools/main/makecfg.py -P tmp/
	python3 tmp/makecfg.py -i cfg/yolov4-tiny-custom.cfg -n 8991 -c 1
	mv cfg/yolov4-tiny-custom_custom.cfg cfg/tiny.cfg

	sed "3s/.*/# batch=1/" 		   -i cfg/tiny.cfg
	sed "4s/.*/# subdivisions=1/"  -i cfg/tiny.cfg
	sed "s/^group_id/# group_id/"  -i cfg/tiny.cfg
	sed "s/^resize/# resize/"  	   -i cfg/tiny.cfg


PyTorch_YOLOv4:
	git clone https://github.com/WongKinYiu/PyTorch_YOLOv4/


cfg/yolov4-tiny-custom.cfg:
	mkdir cfg || true
	wget https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4-tiny-custom.cfg -P cfg/




