FROM jupyter/scipy-notebook

LABEL maintainer="Numb3r3 <wangfelix87@gmail.com>"

USER root

# Switch back to jovyan to avoid accidental container runs as root
#USER $NB_USER
USER jovyan

RUN conda install --quiet --yes -c anaconda numpy cython pillow lmdb h5py \
    && conda install --quiet --yes -c conda-forge opencv keras matplotlib mahotas \
    && conda install --quiet --yes -c soumith pytorch=0.1.12 cuda80 torchvision  \
    && conda install --quiet --yes tensorflow=1.3 tensorflow-gpu=1.3 \
    && conda clean -tipsy

RUN git clone https://github.com/numb3r3/chinese-ocr.git \
    && cd chinese-ocr \
    && git checkout chinese-ocr-python-3.6 \
    && cd ./ctpn/lib/utils \
    && sh make-for-cpu.sh
