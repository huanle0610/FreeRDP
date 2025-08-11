FROM ubuntu:22.04

# Use Aliyun mirror for faster and more reliable package downloads
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu/|http://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        git \
        nasm \
        meson \
        cmake \
        ninja-build \
        mingw-w64 \
        mingw-w64-tools \
        binutils-mingw-w64 \
        build-essential \
        sudo

# Set up working directory
WORKDIR /workspace

# Clone FreeRDP (or mount as volume in docker run)
# RUN git clone https://github.com/FreeRDP/FreeRDP.git .
# If you use a volume, remove the above line.

# Optionally copy your build scripts (if needed)
# COPY scripts/mingw.sh scripts/mingw.sh

# Entry point for interactive use or custom build scripts
CMD ["/bin/bash"]