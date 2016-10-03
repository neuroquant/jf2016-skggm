FROM andrewosh/binder-base

USER root

# Add dependency
RUN apt-get update
#RUN conda remove libgfortran
RUN conda update libgfortran --force
RUN conda install libgcc --force
# RUN apt-get install -y libblas3gf libblas-doc libblas-dev liblapack3gf liblapack-doc liblapack-dev

# Environment variable try to fix lapack issue
ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libgfortran.so.3

USER main

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
