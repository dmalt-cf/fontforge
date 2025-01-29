FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    ffmpeg \
    gettext \
    git \
    intltool \
    libcairo2-dev \
    libfreetype6-dev \
    libgettextpo-dev \
    libgif-dev \
    libgirepository1.0-dev \
    libgtk-3-dev \
    libjpeg-dev \
    libmagic-dev \
    libpango1.0-dev \
    libsm6 \
    libspiro-dev \
    libtiff-dev \
    libxml2-dev \
    libxext6 \
    ninja-build \
    pkg-config \
    pngquant \
    potrace \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install auditwheel
RUN python -m pip install patchelf

# Set environment variables
# ENV PATH="/opt/python/cp10-cp10/bin:$PATH"
WORKDIR /workspace

# Copy project files
COPY . /workspace

# Run the build process
CMD ["bash", "build_manylinux.sh"]
