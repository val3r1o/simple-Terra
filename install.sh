#!/bin/bash
# 
sudo apt install snapd

sudo snap install terraform --classic

terraform --version

sudo mv provider.tf /timple-terra
