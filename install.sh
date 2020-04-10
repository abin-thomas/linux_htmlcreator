#!/bin/bash
echo " ********************************************************************************************** "
echo " sudo password will be most likely asked since i am creating a folder for the man page of htmlcreator "
echo " sudo mkdir -p /usr/local/share/man/man1 "
echo " ********************************************************************************************** "
echo " This installer will extract htmlcreator.sh in ur current directory and the man page will be placed in the above mentioned path "
echo " ********************************************************************************************** "
sleep 3

sudo mkdir -p /usr/local/share/man/man1
sudo chmod 755 /usr/local/share/man/man1
sudo cp htmlcreator.1.gz /usr/local/share/man/man1/
sudo chmod 644 /usr/local/share/man/man1/htmlcreator.1.gz
echo "man page for htmlcreator successfully created"
echo "Script Extracted Successfully"
rm htmlcreator.1.gz
rm install.sh
