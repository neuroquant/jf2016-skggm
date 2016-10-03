FROM andrewosh/binder-base

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y libblas3gf libblas-doc libblas-dev liblapack3gf liblapack-doc liblapack-dev

USER main

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
