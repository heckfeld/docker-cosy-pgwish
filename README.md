

Mo 18. Dez 16:31:26 CET 2017

	Setup des Dockefile
	start mit der bash und allen Befehlen von Hand
	Infos aus der documentation von thorin, plisch und lukas

apt-get update
apt-get upgrade
apt-get install -y autoconf automake libtool \
		libpq-dev libx11-dev libxmu6 libxmu-dev \
		libxmu-headers libxpm-dev build-essential \
		xfonts-traditional xfonts-100dpi xfonts-75dpi \
		libpcap-dev libpq-dev tclx tcllib iwidgets4 tcl-dev \
		itcl3-doc itk3-doc iwidgets4-doc tcl-doc tcl8.6-doc tclx8.4-doc \
		wmctrl libpgtcl tk-table bwidget libncurses5-dev git

cd /tmp
git clone https://gitlab.3utilities.com/mike/cosy-pgwish.git
cd cosy-pgwish
autoreconf -i
./configure
make

docker build -t docker-cosy-pgwish ./
docker run -it --rm docker-cosy-pgwish
