FROM ubuntu:18.04

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Setup new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/Sdk
RUN mkdir flutter
ENV ANDROID_SDK_ROOT /home/developer/Android/Sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Setup Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/Sdk/tools
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/Sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"

# Download Flutter SDK
# RUN git clone https://github.com/flutter/flutter.git
RUN wget -O flutter_linux_v1.12.13+hotfix.9-stable.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz
RUN tar -xf /home/developer/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz \
    && rm /home/developer/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz
ENV PATH "$PATH:/home/developer/flutter/bin"
ENV PATH "$PATH:/home/developer/Android/Sdk/platform-tools"

# Run basic check to download Dark SDK
RUN flutter doctor
