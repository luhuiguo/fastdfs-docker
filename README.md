docker run -dti --name tracker1 -p 22122:22122 -v ~/Documents/tracker1:/var/fdfs luhuiguo/fastdfs

docker run -dti --name storage1 -e TRACKER_SERVER=tracker1:22122 -p 23000:23000 -v ~/Documents/storage1:/var/fdfs --link tracker1:tracker1 luhuiguo/fastdfs


docker run -dti --network=host --name tracker1 -v ~/Documents/tracker1:/var/fdfs luhuiguo/fastdfs

docker run -dti --network=host --name storage1 -e TRACKER_SERVER=10.1.90.2:22122 -v ~/Documents/storage1:/var/fdfs luhuiguo/fastdfs