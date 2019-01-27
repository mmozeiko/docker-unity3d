FROM ubuntu:18.04

ARG UNITY_SETUP=https://beta.unity3d.com/download/393bae82dbb8/UnitySetup-2018.3.3f1
ARG UNITY_COMPONENTS=Unity,Windows-Mono

RUN set -ex \
    \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade --no-install-recommends -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        sudo wget ca-certificates xvfb zip \
        gconf-service lib32gcc1 lib32stdc++6 libasound2 libc6 libc6-i386 libcairo2 libcap2 libcups2 \
        libdbus-1-3 libexpat1 libfontconfig1 libfreetype6 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
        libgl1 libglib2.0-0 libglu1 libgtk2.0-0 libgtk-3-0 libnspr4 libnss3 libpango1.0-0 libstdc++6 \
        libx11-6 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 \
        libxrender1 libxtst6 zlib1g debconf npm libgtk2.0-0 libsoup2.4-1 libarchive13 libpng16-16 \
    && apt-get clean \
    \
    && wget -q -O UnitySetup ${UNITY_SETUP} \
    && chmod +x UnitySetup \
    && yes | ./UnitySetup --unattended --install-location=/opt/Unity --components=${UNITY_COMPONENTS} \
    && rm UnitySetup

COPY scripts /

ENTRYPOINT [ "/unity_build.sh" ]
