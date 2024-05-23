; NSIS script to create an installer

; Define variables
Name "StableSwarmUI-Installer"
OutFile "MyProgramInstaller.exe"

; Default installation directory
InstallDir "$USERS\$USER"

; Request application privileges for Windows Vista and later
RequestExecutionLevel admin

; Pages
Page components
Page directory
Page instfiles

; Sections
Section "MyProgram (required)"
    SetOutPath "$INSTDIR"
    ; Add files to be installed
    File "MyProgram.exe"
SectionEnd

; Create Start Menu shortcut
Section "Start Menu Shortcut"
    CreateDirectory "$SMPROGRAMS\MyProgram"
    CreateShortCut "$SMPROGRAMS\MyProgram\MyProgram.lnk" "$INSTDIR\MyProgram.exe" "" "" 0
SectionEnd

; Uninstaller
Section "Uninstall"
    ; Remove installed files
    Delete "$INSTDIR\MyProgram.exe"
    ; Remove Start Menu shortcut
    Delete "$SMPROGRAMS\MyProgram\MyProgram.lnk"
    ; Remove installation directory
    RMDir "$INSTDIR"
    ; Remove Start Menu directory if it's empty
    RMDir "$SMPROGRAMS\MyProgram"
SectionEnd