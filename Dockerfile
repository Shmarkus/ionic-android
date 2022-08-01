FROM eclipse-temurin:11-jdk
MAINTAINER markus.karileet@codehouse.ee

ENV NODE_BIN_VER=v16.16.0
ENV NODE_BIN_NAME=node-"$NODE_BIN_VER"-linux-x64
ENV NODE_ZIP_PKG="$NODE_BIN_NAME.tar.xz"

ENV GRADLE_BIN_VER=7.5
ENV GRADLE_BIN_NAME=gradle-"$GRADLE_BIN_VER"
ENV GRADLE_ZIP_PKG="$GRADLE_BIN_NAME"-bin.zip

ENV ANDROID_HOME=/opt/android
ENV ANDROID_SDK_ROOT=$ANDROID_HOME

ENV PATH=$PATH:/opt/$NODE_BIN_NAME/bin:/opt/$GRADLE_BIN_NAME/bin

ADD cmdline-tools $ANDROID_HOME/cmdline-tools/latest

RUN apt update
RUN apt install xz-utils unzip git

RUN curl -L https://nodejs.org/dist/$NODE_BIN_VER/$NODE_ZIP_PKG > $NODE_ZIP_PKG
RUN tar xf $NODE_ZIP_PKG
RUN mv $NODE_BIN_NAME /opt/$NODE_BIN_NAME

RUN curl -L https://services.gradle.org/distributions/$GRADLE_ZIP_PKG > $GRADLE_ZIP_PKG
RUN unzip $GRADLE_ZIP_PKG
RUN mv $GRADLE_BIN_NAME /opt/$GRADLE_BIN_NAME

RUN npm i --location=global cordova
RUN npm i --location=global @ionic/cli
RUN cordova telemetry off

#Cleanup
RUN rm $NODE_ZIP_PKG
RUN rm $GRADLE_ZIP_PKG
RUN apt remove xz-utils unzip -y

RUN mkdir /app
WORKDIR /app
