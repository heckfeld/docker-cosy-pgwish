FROM debian:stretch

# install everything for building and running
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install autoconf automake libtool \
		build-essential g++ \
		libpq-dev libx11-dev libxmu6 libxmu-dev \
		libxmu-headers libxpm-dev \
		xfonts-100dpi xfonts-75dpi \
		libpcap-dev libpq-dev tclx tcllib iwidgets4 tcl-dev \
		itcl3-doc itk3-doc iwidgets4-doc tcl-doc tcl8.6-doc tclx8.4-doc \
		wmctrl libpgtcl tk-table bwidget libncurses5-dev git

# build and install
RUN cd /tmp && \
    git clone https://gitlab.3utilities.com/mike/cosy-pgwish.git && \
    cd cosy-pgwish && \
    autoreconf -iv && \
    ./configure && \
    make install

# Cleanup everything used for building
RUN apt-get -y remove --purge autoconf automake libtool build-essential g++ git ; \
    apt-get -y autoremove --purge
RUN cd /tmp && \
    rm -fr cosy-pgwish

# CMD /bin/bash
