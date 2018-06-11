# robotframework_selenium2library_vnc
Dockerfile for robotframework test case execution environment.
run docker images should add --privileged for run chrome.


can run like:
docker run -it -p 8001:5901 -v $PWD:/home/robot --rm --name robot --privileged frank809/robotframework_selenium2library_vnc

Notes:
1. --privileged is mandatory  because of Chromium's sandbox mechanism
2. /home/robot will be used for saving robot test cases.