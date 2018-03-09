FROM jupyter/scipy-notebook

LABEL maintainer="Numb3r3 <wangfelix87@gmail.com>"

ENV TESSDATA_PREFIX /usr/local/share/tessdata

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
  && make training && make training-install \
  && ldconfig \
  && cd .. \
  && rm -r tesseract


#RUN git clone https://github.com/tesseract-ocr/tessdata.git \
#  && mkdir -p ${TESSDATA_PREFIX}/tessdata \
#  && mv tessdata/* ${TESSDATA_PREFIX}/tessdata \
#  && rm -rf tessdata

# osd Orientation and script detection
RUN wget -O ${TESSDATA_PREFIX}/osd.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/osd.traineddata
# equ Math / equation detection
RUN wget -O ${TESSDATA_PREFIX}/equ.traineddata https://github.com/tesseract-ocr/tessdata/raw/3.04.00/equ.traineddata
# latin 
RUN wget -O ${TESSDATA_PREFIX}/lat.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/lat.traineddata
# grc Greek, Ancient(-1453)
RUN wget -O ${TESSDATA_PREFIX}/grc.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/grc.traineddata
# eng English
RUN wget -O ${TESSDATA_PREFIX}/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/eng.traineddata
# chi_sim 
RUN wget -O ${TESSDATA_PREFIX}/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/chi_sim.traineddata
# other languages: https://github.com/tesseract-ocr/tesseract/wiki/Data-Files

RUN git clone https://github.com/madmaze/pytesseract.git \
  && cd pytesseract \
  && python setup.py install \
  && cd .. \
  && rm -rf pytesseract

# Switch back to jovyan to avoid accidental container runs as root
#USER $NB_USER
USER jovyan

RUN conda install --quiet --yes -c anaconda numpy \
    && conda install --quiet --yes -c conda-forge opencv \
    && conda clean -tipsy
