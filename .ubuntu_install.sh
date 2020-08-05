apt-get install -y stow vim rxvt-unicode tmux i3-wm nitrogen git fonts-firacode build-essential cmake libcairo2-dev libxcb-composite0-dev libxcb-randr0-dev xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev python3-xcbgen libjsoncpp-dev libxcb-xrm-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-shape0-dev rofi compton

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make -j4
make install
cd ../..
rm -rf i3-gaps

git clone https://github.com/polybar/polybar.git
cd polybar
git submodule update --init --recursive
mkdir build
cd build
cmake ..
make -j4
make install
cd ../..
rm -rf polybar

stow *
echo "DONE"
