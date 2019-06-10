FROM openjdk:8

ARG BAZEL_VERSION=0.23.2

RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" > /etc/apt/sources.list.d/bazel.list \
  && curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
  && apt-get update \
  && apt-get install -y bazel crunch nodejs python \
  && rm -rf /var/lib/apt/lists/*

COPY .emscripten /root/.emscripten

COPY . /usr/src/app
ENV WORKSPACE /usr/src/app
WORKDIR /usr/src/app

RUN bazel build --config=asmjs //main:helloworld --verbose_failures
