#!/bin/bash

# This script has been written by Isabelle RICHARD (2014).
# It should download and configure Eclipse to be used on Ubuntu 14.04
# to develop in Python with Subversion.

URL=http://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/mars/R/eclipse-java-mars-R-linux-gtk-x86_64.tar.gz
TARGZ=eclipse.tar.gz
VERSION=4.5
WORKSPACE=$HOME/workspace

function usage {
    echo "Usage:"
    echo "./eclipse-install.sh --install"
    echo "./eclipse-install.sh --clean"
}

if [ $# = 0 ]
then
    usage
    exit -1
fi

if [ $1 = "--clean" ] 
then
    echo "Removing all Eclipse files..."
    sudo rm -rf /opt/eclipse /usr/bin/eclipse /usr/share/applications/eclipse.desktop
    find $WORKSPACE -depth -name ".metadata" -exec rm -rf {} \;
    echo "Eclise is now uninstalled."

elif [ $1 = "--install" ]
then
    # Create workspace
    echo "Creating workspace in "$WORKSPACE"..."
    mkdir -p $WORKSPACE

    # Install requirements
    echo "Installing Java..."
    sudo apt-get install aptitude
    sudo aptitude -y install openjdk-7-jre openjdk-7-jdk

    # Get Eclipse 
    echo "Installing Eclipse..."
    cd /tmp
    wget $URL -O $TARGZ
    tar xvf $TARGZ
    rm $TARGZ
    sudo mv eclipse /opt
    # Symlink to run Eclipse from a terminal
    sudo ln -svf /opt/eclipse/eclipse /usr/bin/eclipse
    # Unity launcher for Eclipse
    sudo sh -c 'echo """
    [Desktop Entry]
    Version='''$VERSION'''
    Name=Eclipse
    Comment=IDE for all seasons
    Exec=env UBUNTU_MENUPROXY=0 /opt/eclipse/eclipse
    Icon=/opt/eclipse/icon.xpm
    Terminal=false
    Type=Application
    Categories=Utility;Application;Development;IDE
    """ > /usr/share/applications/eclipse.desktop'
    echo "Eclipse is now installed."
else
    usage
fi

