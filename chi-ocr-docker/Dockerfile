FROM jupyter/scipy-notebook

LABEL maintainer="Numb3r3 <wangfelix87@gmail.com>"

USER root

# Switch back to jovyan to avoid accidental container runs as root
#USER $NB_USER
USER jovyan

RUN pip install lmdb

RUN conda install --quiet --yes -c anaconda numpy cython pillow \
    && conda install --quiet --yes -c conda-forge opencv keras matplotlib mahotas \
    && conda install -c pytorch pytorch-cpu torchvision \
    && conda install --quiet --yes tensorflow=1.3 tensorflow-gpu=1.3 \
    && conda install --quiet --yes --name pytorch-py36 \
    	h5py \
    && conda clean -tipsy

# Install HDF5 Python bindings
RUN conda install -y h5py \
 && conda clean -ya
RUN pip install h5py-cache

RUN git clone https://github.com/numb3r3/chinese-ocr.git \
    && cd chinese-ocr \
    && git checkout chinese-ocr-python-3.6 \
    && cd ./ctpn/lib/utils \
    && sh make-for-cpu.sh
