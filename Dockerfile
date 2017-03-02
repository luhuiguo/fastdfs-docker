FROM centos:7

LABEL maintainer "luhuiguo@gmail.com"

ENV FASTDFS_PATH=/opt/fdfs \
    FASTDFS_BASE_PATH=/var/fdfs \
    TRACKER_SERVER=

#get all the dependences
RUN yum install -y git gcc make

#create the dirs to store the files downloaded from internet
RUN mkdir -p ${FASTDFS_PATH}/libfastcommon \
 && mkdir -p ${FASTDFS_PATH}/fastdfs \
 && mkdir ${FASTDFS_BASE_PATH}

#compile the libfastcommon
WORKDIR ${FASTDFS_PATH}/libfastcommon

RUN git clone --depth=1 https://github.com/happyfish100/libfastcommon.git ${FASTDFS_PATH}/libfastcommon \
 && ./make.sh \
 && ./make.sh install \
 && rm -rf ${FASTDFS_PATH}/libfastcommon

#compile the fastdfs
WORKDIR ${FASTDFS_PATH}/fastdfs

RUN git clone --depth=1 https://github.com/happyfish100/fastdfs.git ${FASTDFS_PATH}/fastdfs \
 && ./make.sh \
 && ./make.sh install \
 && rm -rf ${FASTDFS_PATH}/fastdfs


#modify config
# RUN sed -e 's#/home/yuqing/fastdfs#'${FASTDFS_BASE_PATH}'#g' /etc/fdfs/tracker.conf.sample > /etc/fdfs/tracker.conf
# RUN sed -e 's#/home/yuqing/fastdfs#'${FASTDFS_BASE_PATH}'#g' -e 's#tracker_server=.*$#tracker_server='${TRACKER_SERVER}'#g' /etc/fdfs/storage.conf.sample > /etc/fdfs/storage.conf
# RUN sed -e 's#/home/yuqing/fastdfs#'${FASTDFS_BASE_PATH}'#g' -e 's#tracker_server=.*$#tracker_server='${TRACKER_SERVER}'#g' /etc/fdfs/client.conf.sample > /etc/fdfs/client.conf

VOLUME ["$FASTDFS_BASE_PATH"] 
EXPOSE 22122 23000 8080 8888

COPY start.sh /usr/bin/

#make the start.sh executable 
RUN chmod 777 /usr/bin/start.sh

ENTRYPOINT ["/usr/bin/start.sh"]
