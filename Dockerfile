# creates an image containing vg and hal2vg

# build on compatible vg image
FROM quay.io/vgteam/vg:v1.17.0-0-gaa0b37860-t315-build

# update system and install dependencies not present in vg image
RUN apt-get -qq update && apt-get -qq install -y libhdf5-serial-dev

RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y --no-install-recommends libnss-sss

# copy current directory to docker
ADD . /hal2vg

# set working directory
WORKDIR /hal2vg

# build
RUN make

# add hal2vg to the PATH
ENV PATH /hal2vg:$PATH
