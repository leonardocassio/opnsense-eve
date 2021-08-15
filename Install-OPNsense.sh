#!/bin/sh

# Instalar Imagem do Firewall OPNsense
#	Autor: Leonardo Silva
#	GIT: https://github.com/leonardocassio/opnsense-eve

echo "
########################################################################
#                                                                      #
#           SCRIPT APENAS TESTADO NO EVE COMMUNITY EDITION             #
#                                                                      #
########################################################################"

sleep 03 

echo "
#FAZENDO DOWNLOAD DA IMAGEMS"

# Diretorio de Download da Imagem
cd /tmp/
# Baixando Imagem
curl -L -o opnsense.zip https://www.dropbox.com/s/0dp02jc9qb7hibh/OPNsense-Firewall.zip?dl=1

echo "
#DESCOMPACTADO IMAGENS"

# Descompactar .zip
unzip -o opnsense.zip -d /tmp/ | awk 'BEGIN {ORS=" "} {print "."}'

echo "
#INSTALANDO IMAGENS"

cd /tmp/OPNsense-Firewall/
mv opnsense-21.7.1/ /opt/unetlab/addons/qemu/
mv opnsense-amd.yml /opt/unetlab/html/templates/amd/opnsense.yml
mv opnsense-intel.yml /opt/unetlab/html/templates/intel/opnsense.yml
mv opnsense.yml /opt/unetlab/html/templates_legacy/
mv config_opnsense.py /opt/unetlab/scripts/

echo "
#Firewall OPNsense - OK"

echo "
#FIXANDO PERMISSÃO"

/opt/unetlab/wrappers/unl_wrapper -a fixpermissions

echo "
#EXCLUINDO ARQUIVOS TEMPORÁRIOS"

rm -r /tmp/opnsense.zip