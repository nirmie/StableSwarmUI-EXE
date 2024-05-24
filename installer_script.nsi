; NSIS script to create an installer. command:  makensis.exe /LAUNCH .\installer_script.nsi

; Include Modern UI
!include "MUI2.nsh"


; Define variables
Name "StableSwarmUI"
OutFile "StableSwarmUI-Installer.exe"
;Var FilePath

;Section SetFilePath
;StrCpy $FilePath "C:\Users\nirma\StableSwarmUI-EXE"
;SectionEnd

; Default installation directory
InstallDir "$PROFILE\StableSwarmUI"

; Request application privileges for Windows Vista and later
RequestExecutionLevel admin

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English" ; The first language is the default language

; Sections
Section "MyProgram (required)"
    SetOutPath "$INSTDIR"
    ; Add files to be installed
    File /r /x *.bat /x *.sh /x *.ps1 /x StableSwarmUI-Installer.exe /x colab /x .github /x .git /x bin C:\Users\nirma\StableSwarmUI-EXE\*.*

    #SetOutPath "$TEMP"
    ;Delete Unecessary Files
    #Delete "C:\Users\nirma\StableSwarmUI-EXE\StableSwarmUI-Installer.exe"
    #Delete "C:\Users\nirma\StableSwarmUI-EXE\src\bin"
    #Delete "C:\Users\nirma\StableSwarmUI-EXE\*.bat"
    #Delete "C:\Users\nirma\StableSwarmUI-EXE\*.sh"

    #SetOutPath "$INSTDIR"
    #File /r "C:\Users\nirma\StableSwarmUI-EXE\*.*"
SectionEnd

; Create Start Menu shortcut
Section "Start Menu Shortcut"
    CreateDirectory "$SMPROGRAMS\StableSwarmUI"
    CreateShortCut "$SMPROGRAMS\StableSwarmUI\StableSwarmUI.lnk" "$INSTDIR\StableSwarmUI.exe" "" "" 0
SectionEnd

; Uninstaller
Section "Uninstall"
    ; Remove installed files
    Delete "$INSTDIR\StableSwarmUI.exe"
    ; Remove Start Menu shortcut
    Delete "$SMPROGRAMS\StableSwarmUI\StableSwarmUI.lnk"
    ; Remove installation directory
    RMDir "$INSTDIR"
    ; Remove Start Menu directory if it's empty
    RMDir "$SMPROGRAMS\StableSwarmUI"
SectionEnd