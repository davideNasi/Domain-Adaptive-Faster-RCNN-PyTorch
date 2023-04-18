FROM pytorch/pytorch
RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt tmp/requirements.txt
COPY ./configs/da_faster_rcnn/e2e_da_faster_rcnn_R_50_C4_park1_to_park2.yaml tmp/settings.yaml
COPY ./maskrcnn_benchmark tmp/maskrcnn_benchmark
COPY ./setup.py tmp/setup.py
COPY ./tools/train_net.py tmp/train_net.py
RUN python3 -m pip install ultralytics
RUN python3 -m pip install -r tmp/requirements.txt
RUN python3 -m pip install tmp