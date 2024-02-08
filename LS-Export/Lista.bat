@echo off
setlocal enabledelayedexpansion

rem Generar un nombre aleatorio para la carpeta
set "carpeta_aleatoria=%RANDOM%_%RANDOM%"
mkdir "%carpeta_aleatoria%"

echo Listando archivos en carpetas especiales y dispositivos extraíbles:
echo -------------------------------------------------------------------

rem Listar archivos en las carpetas especificadas
echo Archivos en la carpeta Documentos:
echo -----------------------------------
dir "%USERPROFILE%\Documents" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Documentos.txt"
echo.

echo Archivos en la carpeta Documentos de OneDrive:
echo --------------------------------------------
dir "%USERPROFILE%\OneDrive - SENA\Documentos" /s /b /a:-D > "%carpeta_aleatoria%\reporte_One_Documentos.txt"
echo.

echo Archivos en la carpeta Imágenes de OneDrive:
echo -------------------------------------------
dir "%USERPROFILE%\OneDrive - SENA\Imagenes" /s /b /a:-D > "%carpeta_aleatoria%\reporte_One_Imagenes.txt"
echo.

echo Archivos en la carpeta Imágenes:
echo --------------------------------
dir "%USERPROFILE%\Pictures" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Imagenes.txt"
echo.

echo Archivos en la carpeta Escritorio:
echo ----------------------------------
dir "%USERPROFILE%\Desktop" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Escritorio.txt"
echo.

echo Archivos en la carpeta Videos:
echo -------------------------------
dir "%USERPROFILE%\Videos" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Videos.txt"
echo.

echo Archivos en la carpeta Música:
echo -------------------------------
dir "%USERPROFILE%\Music" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Musica.txt"
echo.

echo Listando archivos en la papelera de reciclaje:
echo ---------------------------------------------
rem Utilizamos la variable del sistema para obtener la unidad del sistema (%SystemDrive%) y acceder a la papelera de reciclaje
dir "%SystemDrive%\$Recycle.Bin" /s /b /a:-D > "%carpeta_aleatoria%\reporte_Papelera.txt"
echo.

echo Archivos en dispositivos extraíbles:
echo -------------------------------------
for %%d in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\" (
        if not "%%d:\"=="%SystemDrive%\" (
            echo Archivos en %%d:
            echo -----------------
            dir "%%d:\" /s /b /a:-D > "%carpeta_aleatoria%\reporte_usb.txt"
            echo.
        )
    )
)

rem Hacer que la carpeta y los archivos sean ocultos
attrib +h "%carpeta_aleatoria%"
attrib +h "%carpeta_aleatoria%\reporte*.txt"

echo Resultado guardado en: %carpeta_aleatoria%\reporte*.txt
pause
