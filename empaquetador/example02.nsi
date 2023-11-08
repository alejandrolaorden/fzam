#Install a file and create an uninstaller to remove it

#This script will do the following: create an installer named "installer.exe"; 
#Install a file named "test.txt" to the desktop; create an uninstaller named "uninstaller.exe" on the desktop. 
#The uninstaller will remove itself and the installed text file.
!define APPNAME "Fzam"

RequestExecutionLevel admin

InstallDir "$PROGRAMFILES\${APPNAME}"

# define installer name
OutFile "fzam_installer_x64.exe"
 
# set desktop as install directory
#InstallDir $DESKTOP
 
# default section start
Section
 
# define output path
SetOutPath $INSTDIR
 
# specify file to go in output path
File fzam.ini
File fzam.exe
File fsqlf.exe
File fzam.ico
File factuzam_original.sql

createShortCut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\fzam.exe" "" "$INSTDIR\fzam.ico"

# define uninstaller name
WriteUninstaller $INSTDIR\uninstaller.exe
 
# Install MariaDB silently
DetailPrint "Instalando MariaDB silenciosamente..."
SetOutPath $TEMP
File "mariadb_installer.msi" 
#mariadb_installer.msi
#SERVICENAME=MariaDB DATADIR="C:\Program Files (x86)\Fzam\mariadb\data" PORT=3310 PASSWORD=default REMOVE=DEVEL REMOVE=HeidiSQL /qn
ExecWait 'msiexec /i "$TEMP\mariadb_installer.msi"
 
#-------
# default section end
SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"
 
# Delete installed file
Delete $INSTDIR\fzam.ini
Delete $INSTDIR\fzam.exe
Delete $INSTDIR\fsqlf.exe
Delete $INSTDIR\fzam.ico

DetailPrint "Desinstalando MariaDB silenciosamente..."
#mariadb_installer.msi
ExecWait 'msiexec /i "$TEMP\mariadb_installer.msi" REMOVE=ALL ' 

# Delete the uninstaller
Delete $INSTDIR\uninstaller.exe
 
# Delete the directory
RMDir $INSTDIR
SectionEnd