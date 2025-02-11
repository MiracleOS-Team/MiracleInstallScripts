echo "Preparing system"

emerge --quiet app-eselect/eselect-repository

eselect repository enable wayland-desktop
eselect repository enable guru

echo "Syncing system"

emaint sync

echo "Enable USE Flags"

euse -g -E wayland dbus wifi udev X alsa opengl vulkan

echo "Installing required libraries"

emerge --quiet dev-libs/libdbusmenu[gtk3]

echo "Updating system"

emrge --quiet --update --newuse @world

echo "Installing required software"

emerge --autounmask-write --quiet \
    gui-wm/sway \
    gui-wm/labwc \
    gui-apps/eww \
    x11-terms/alacritty \
    net-misc/networkmanager \
    media-sound/pavucontrol \
    gui-apps/wdisplays \
    gui-apps/swaybg \
    gui-apps/swayidle \
    www-client/firefox \
    dev-lang/python:3.11 \
    dev-vcs/git \
    x11-misc/sddm

echo "You will now be faced with a validation thing. Please just press 'u' until it disapears"
read -p "Press Enter to continue" </dev/tty
dispatch-conf

emerge --autounmask-write --quiet \
    gui-wm/sway \
    gui-wm/labwc \
    gui-apps/eww \
    x11-terms/alacritty \
    net-misc/networkmanager \
    media-sound/pavucontrol \
    gui-apps/wdisplays \
    gui-apps/swaybg \
    gui-apps/swayidle \
    www-client/firefox \
    dev-lang/python:3.11 \
    dev-vcs/git \
    x11-misc/sddm

echo "Installing MiracleOS software"

mkdir -p /opt/miracleos-software
cd /opt/miracleos-sofware


git clone --recurse-submodules https://github.com/MiracleOS-Team/VideoPlayer
git clone --recurse-submodules https://github.com/MiracleOS-Team/Vib
git clone --recurse-submodules https://github.com/MiracleOS-Team/desktop
git clone --recurse-submodules https://github.com/MiracleOS-Team/Icons
git clone --recurse-submodules https://github.com/MiracleOS-Team/File-manager-utility
git clone --recurse-submodules https://github.com/MiracleOS-Team/recorder
git clone --recurse-submodules https://github.com/MiracleOS-Team/notifications-service
git clone --recurse-submodules https://github.com/MiracleOS-Team/Miracle-system-operator
git clone --recurse-submodules https://github.com/MiracleOS-Team/ABG
git clone --recurse-submodules https://github.com/MiracleOS-Team/Dotfiles
git clone --recurse-submodules https://github.com/MiracleOS-Team/file-manager
git clone --recurse-submodules https://github.com/MiracleOS-Team/wvkbd

mkdir -p /usr/share/icons
cp Icons/MiracleOSIcons /usr/share/icons/


cd /usr/bin

wget https://github.com/MiracleOS-Team/Vib/releases/latest/download/vib

echo "Download MiracleOS's things. Now you can manually install them"