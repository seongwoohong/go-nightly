docker build --no-cache -t seongwoohong/golang-nightly:1.18 .

docker build --no-cache -t seongwoohong/golang-nightly:latest .

docker push seongwoohong/golang-nightly:1.18

docker push seongwoohong/golang-nightly:latest

pause