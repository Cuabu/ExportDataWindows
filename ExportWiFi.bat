@echo off

rem Obtener la ubicación actual del script
set "UbicacionScript=%~dp0"

rem Definir el nombre de la carpeta y del archivo
set "CarpetaExportacion=%UbicacionScript%CarpetaExportada"
set "NombreArchivo=PerfilesWiFi.txt"

rem Crear la carpeta si no existe
if not exist "%CarpetaExportacion%" mkdir "%CarpetaExportacion%"

rem Ejecutar el comando netsh para exportar perfiles WiFi
netsh wlan export profile key=clear folder="%CarpetaExportacion%" > "%CarpetaExportacion%\%NombreArchivo%"

echo "Exportación completada. El archivo se ha guardado en: %CarpetaExportacion%\%NombreArchivo%"
pause
