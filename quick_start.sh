# download dataset VOC
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar

# download pretrained weights model 
wget https://pjreddie.com/media/files/yolov3-tiny.weights weights/

tar -cvf VOCtrainval_11-May-2012.tar .

# get tarin & eval dataset
python convert2text.py

# get weight init 15 layer
./darknet partial cfg/yolov3-tiny.cfg weights/yolov3-tiny.weights yolov3-tiny.conv.15 15

# train to save the weight model
./darknet detector train cfg/voc.data cfg/yolov3-tiny.cfg yolov3-tiny.conv.15 

# test
./darknet detector test cfg/voc.data cfg/yolov3-tiny.cfg backup/yolov3-tiny_final.weights data/cat.png 
