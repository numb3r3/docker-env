FROM jupyter/scipy-notebook

LABEL maintainer="Numb3r3 <wangfelix87@gmail.com>"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    cmake \
    wget \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libavformat-dev \
    libpq-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jovyan to avoid accidental container runs as root
#USER $NB_USER
USER jovyan

RUN pip install captcha

RUN conda install --quiet --yes -c anaconda numpy \
    && conda install --quiet --yes -c conda-forge opencv \
    && conda install --quiet --yes tensorflow keras matplotlib\
    && conda clean -tipsy