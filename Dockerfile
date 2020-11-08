FROM ubuntu:20.04

RUN apt-get update && apt-get install -y build-essential make git g++ protobuf-compiler sudo net-tools iputils-ping
RUN apt-get clean

##  Download VSSS files
WORKDIR /app
RUN git clone https://github.com/ger-unicamp/VSSSClient.git /app/client

## Build protobuffer files
WORKDIR /app/client/src/pb/proto
RUN chmod +x compile.sh && ./compile.sh

# Exec
WORKDIR /app/client/src
RUN make

CMD ./vss.exe
