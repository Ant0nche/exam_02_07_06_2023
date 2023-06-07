FROM ubuntu

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools -y
RUN apt-get install build-essential -y

WORKDIR /chelyshev221-3532/
RUN mkdir server
WORKDIR /chelyshev221-3532/server/
COPY *.cpp /chelyshev221-3532/server/
COPY *.h /chelyshev221-3532/server/
COPY *.pro /chelyshev221-3532/server/

RUN qmake echoServer_ex.pro
RUN make

ENTRYPOINT ["./HallServer"] 
