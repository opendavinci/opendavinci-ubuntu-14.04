# Dockerfile to create an image for building and running OpenDaVINCI.
# Copyright (C) 2016 Christian Berger
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# Date: 2016-03-05

FROM ubuntu:14.04
MAINTAINER Christian Berger "christian.berger@gu.se"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

# Installing OpenDaVINCI dependencies.
RUN apt-get -y --no-install-recommends && \
    ant \                       # odDataStructureGenerator
    build-essential \           # libopendavinci
    cmake \                     # libopendavinci
    default-jre \               # odDataStructureGenerator
    default-jdk \               # odDataStructureGenerator
    freeglut3 \                 # libopendlv
    freeglut3-dev \             # libopendlv
    git \                       # libopendavinci
    libboost-dev \              # libopendlv
    libopencv-dev \             # libopendlv
    libopencv-core-dev \        # libopendlv
    libopencv-highgui-dev \     # libopendlv
    libopencv-imgproc-dev \     # libopendlv
    libqt4-dev \                # odcockpit
    libqt4-opengl-dev \         # odcockpit
    libqwt5-qt4-dev \           # odcockpit
    libqwt5-qt4 \               # odcockpit
    qt4-dev-tools \             # odcockpit
    rpm \                       # libopendavinci
    psmisc \                    # compileTest.sh
    wget                        # Updating sources.list

# Clean-up downloaded packages.
RUN apt-get clean && \
    apt-get autoremove

