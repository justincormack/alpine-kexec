FROM alpine:3.3

RUN apk update && apk add linux-headers alpine-sdk

WORKDIR /root

ADD https://www.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.11.tar.gz .

RUN zcat kexec-tools-2.0.11.tar.gz | tar xvf - && \
  cd kexec-tools-2.0.11 && \
  sed 's/loff_t/off_t/g' -i vmcore-dmesg/vmcore-dmesg.c && \
  ./configure && \
  make && \
  make install
