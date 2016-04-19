#!/bin/bash

# This script has been written by Isabelle RICHARD (2014).
# It should download required packages for Odoo 8.0 and
# PostgreSQL on Ubuntu 14.04.

# Get Ubuntu packages
echo "Getting Ubuntu packages..."
sudo apt-get install aptitude
sudo aptitude -y install bzr git python-setuptools python-pip postgresql \
    postgresql-server-dev-9.3 libxss1 python-dev libxml2-dev libxslt1-dev \
    libjpeg62 libsvn-java htop tree pgadmin3 ipython \
    python-matplotlib pylint libwebkitgtk-1.0-0 git-core \
    python-pychart
sudo pip install -r requirements.txt

# Create Odoo user
echo "Creating Odoo user..."
sudo su postgres -c "createuser --createdb --no-createrole --pwprompt odoo"

