FROM siali/cuda-cv2

# compile repository
RUN git clone https://github.com/AlexeyAB/darknet.git
WORKDIR /darknet
RUN sed -i -e 's/GPU=0/GPU=1/g' Makefile \
 && sed -i -e 's/CUDNN=0/CUDNN=1/g' Makefile \
 && sed -i -e 's/OPENCV=0/OPENCV=1/g' Makefile \
 && sed -i -e 's/LIBSO=0/LIBSO=1/g' Makefile \
 && sed -i -e 's/DEBUG=0/DEBUG=1/g' Makefile
RUN make 
# download yoloV3 weights
RUN mkdir weights
