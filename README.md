# FastDFS Docker

Usage:
```
docker run -dti --network=host --name tracker -v /var/fdfs/tracker:/var/fdfs luhuiguo/fastdfs tracker

docker run -dti --network=host --name storage0 -e TRACKER_SERVER=10.1.5.85:22122 -e -v /var/fdfs/storage0:/var/fdfs luhuiguo/fastdfs storage

docker run -dti --network=host --name storage1 -e TRACKER_SERVER=10.1.5.85:22122 -e -v /var/fdfs/storage1:/var/fdfs luhuiguo/fastdfs storage

docker run -dti --network=host --name storage2 -e TRACKER_SERVER=10.1.5.85:22122 -e GROUP_NAME=group2 -e PORT=22222 -v /var/fdfs/storage2:/var/fdfs luhuiguo/fastdfs storage
```
