FROM nvcr.io/nvidia/tensorflow:21.07-tf2-py3

WORKDIR /frontrow

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y libsndfile1 && apt-get clean

COPY requirements.txt wheels ./

RUN python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt

