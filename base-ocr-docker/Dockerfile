FROM jupyter/scipy-notebook

LABEL maintainer="Numb3r3 <wangfelix87@gmail.com>"

ENV TESSDATA_PREFIX=/usr/local/share/

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    cmake \
    autoconf autoconf-archive automake g++ libtool \
    wget \
    aria2 \
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
    libleptonica-dev \
    imagemagick \
    libmagickwand-dev \
    cython \
    pkg-config \
    libicu-dev \
    libpango1.0-dev \
    libcairo2-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet http://www.leptonica.com/source/leptonica-1.75.1.tar.gz \
  && tar -xvf leptonica-1.75.1.tar.gz \
  && cd leptonica-1.75.1 \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -r leptonica-1.75.1 \
  && rm -r leptonica-1.75.1.tar.gz


RUN git clone https://github.com/tesseract-ocr/tesseract.git \
  && cd tesseract \
  && ./autogen.sh \
  && ./configure --enable-debug \
  && LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make \
  && make install \
  && make training \
  && make training-install \
  && ldconfig \
  && cd .. \
  && rm -r tesseract


RUN git clone https://github.com/tesseract-ocr/tessdata.git \
    && mkdir -p ${TESSDATA_PREFIX}/tessdata \
    && mv tessdata/* ${TESSDATA_PREFIX}/tessdata \
    && rm -rf tessdata


# Switch back to jovyan to avoid accidental container runs as root
#USER $NB_USER
USER jovyan

RUN conda install --quiet --yes -c anaconda numpy \
    && conda install --quiet --yes -c conda-forge opencv \
    && conda clean -tipsy
