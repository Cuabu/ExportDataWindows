#!/bin/bash

# Guardar la lista de contraseñas Wi-Fi (sólo disponible para usuarios con permisos de administrador)
sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ > wifi_passwords.txt

# Listar archivos y guardar la salida en un archivo de texto
ls -la > lista_archivos.txt

# Listar procesos y puertos y guardar la salida en un archivo de texto
ps aux > lista_procesos.txt
netstat -tuln > lista_puertos.txt

echo "Se han guardado las contraseñas Wi-Fi, la lista de archivos, la lista de procesos y la lista de puertos en archivos de texto."
