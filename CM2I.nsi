!include LogicLib.nsh

!define VERSION "1.0.0"
!define APP_NAME 'CrystalM2'

; Define Download URLs
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/Suprcode/Crystal.Database/archive/refs/heads/main.zip"
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

; Define Configuration
!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"
!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

; Set the name of installer
Name "${APP_NAME}_${VERSION}"
Outfile "${APP_NAME}_setup_${VERSION}.exe"

; Run-As Admin (some network and file operations require elevation)
RequestExecutionLevel Admin

# set prog files as install directory
InstallDir "$PROGRAMFILES64\${APP_NAME}"

; Install section
Section "Install Section"
	; Set output directory (installation path)
    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
    ; Check if .NET 8 is installed
	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Version"
	${If} $0 == ""
		; .NET 8 is NOT installed, Download...
		DetailPrint "Downloading dotNET 8.0 Runtime..."
		NScurl::http get "${NET8_URL}" "$INSTDIR\Downloads\dotnet-runtime-8.0.6-win-x64.exe" /INSIST /CANCEL /RESUME /POPUP /END
		Pop $R0
		${If} $R0 == "OK"
			; Successfully downloaded, Install...
			DetailPrint "Installing dotNET 8.0 Runtime..."
			ExecWait '"$INSTDIR\Downloads\windowsdesktop-runtime-8.0.6-win-x64.exe" /install /quiet'
		${Else}
			; Handle download failure
			MessageBox MB_ICONEXCLAMATION "Failed to download dotNET 8.0 runtime. Check Internet Connection Settings."
		${EndIf}
	${EndIf}
	
	; Check if Redistributable is installed
	ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
	${If} $0 != 12.0.30501.0
		; redist not installed, Download...
		DetailPrint "Downloading Visual C++ 2013 Redistributable..."
		NScurl::http get "${VCR13_URL}" "$INSTDIR\Downloads\vcredist_x64.exe" /INSIST /CANCEL /RESUME /POPUP /END
		Pop $R0
		${If} $R0 == "OK"
			; Successfully downloaded, Install...
			DetailPrint "Installing Visual C++ 2013 Redist..."
			ExecWait '"$INSTDIR\Downloads\vcredist_x64.exe" /install /quiet'
		${Else}
			; Handle download failure
			MessageBox MB_ICONEXCLAMATION "Failed to download Visual C++ 2013 Redist. Check Internet Connection Settings."
		${EndIf}
	${EndIf}
	
	; Get CrystalM2 Stable Release
	DetailPrint "Downloading CrystalM2 [10MB]..."
	NScurl::http get "${SCCM2_URL}" "$INSTDIR\Downloads\CrystalM2Stable.zip" /INSIST /CANCEL /RESUME /END
	Pop $R0
	${If} $R0 == "OK"
		; Successfully downloaded, install
		DetailPrint "Installing CrystalM2 Stable Release..."
		nsisunz::UnzipToLog "$INSTDIR\Downloads\CrystalM2Stable.zip" "$INSTDIR\Workspace"
		CopyFiles "$INSTDIR\Workspace\Crystal_14.06.2024_Debug\*" $INSTDIR
		
	${Else}
		; Handle download failure
		MessageBox MB_ICONEXCLAMATION "Failed to install CrystalM2 Stable Release."
	${EndIf}

	; Get Database
	DetailPrint "Downloading CrystalM2 Database [215MB]..."
	NScurl::http get "${DB_URL}" "$INSTDIR\Downloads\Databases.zip" /INSIST /CANCEL /RESUME /END
	Pop $R0
	${If} $R0 == "OK"
		; Successfully downloaded, install
		DetailPrint "Extracting CrystalM2 Database..."
		nsisunz::UnzipToLog "$INSTDIR\Downloads\Databases.zip" "$INSTDIR\Databases"
		DetailPrint "Copying Jev's Database Files..."
		CopyFiles "$INSTDIR\Databases\Crystal.Database-main\Jev\*" "$INSTDIR\Server"
	${Else}
		; Handle download failure
		MessageBox MB_ICONEXCLAMATION "Failed to install CrystalM2 Database."
	${EndIf}

	; Randomly Generate GMPassword
	StrCpy $2 ""
	badrange:
		System::Call 'advapi32::SystemFunction036(*i0r0,i1)'
		IntCmpU $0 127 "" ""  badrange ; Limit to ASCII, IsCharAlphaNumeric is locale specific
		System::Call 'user32::IsCharAlphaNumericA(ir0)i.r1'
		StrCmp $1 0 badrange
		IntFmt $0 "%c" $0
		StrCpy $2 "$2$0"
		StrLen $0 $2
		IntCmpU $0 10 "" badrange
	DetailPrint $2

	; Replace Client settings in the .ini file
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP}"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT}"	
	
	; Replace Server Settings in the .ini file
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\Client\Client.exe"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "CheckVersion" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "GMPassword" "$2"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP}"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT}"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewAccount" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowChangePassword" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowLogin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewCharacter" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowDeleteCharacter" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowStartGame" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateAssassin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateArcher" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "MaxResolution" "1920"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Optional" "SafeZoneBorder" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Optional" "SafeZoneHealing" "True"
	
	# create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
	
    # Create Start Menu shortcuts
	SetOutPath "$INSTDIR\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	SetOutPath "$INSTDIR\Server Tools\LibraryViewer"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Viewer.lnk" "$INSTDIR\Server Tools\LibraryViewer\CMirLibraryViewer.exe"
	SetOutPath "$INSTDIR\Server Tools\LibraryEditor"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Editor.lnk" "$INSTDIR\Server Tools\LibraryEditor\LibraryEditor.exe"
	SetOutPath $INSTDIR
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"
	
	; Create desktop shortcuts, SetOutPath determines "Start in" value 
	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	SetOutPath $INSTDIR
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

	; Add Uninstall to Add/Remove Programs in Windows Control Panel
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayName" "${APP_NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "HelpLink" "${HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "URLInfoAbout" "${ABOUT_URL}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "Publisher" "LOMCN"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayVersion" "${VERSION}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "EstimatedSize" "9100000"

				 
	; Clean up
	RMDir /r "$INSTDIR\Workspace"
	RMDir /r "$INSTDIR\Downloads"
	RMDir /r "$INSTDIR\Databases"
	
	; Inform user of completion and provide GM Pass
	MessageBox MB_ICONINFORMATION "Installation Complete!! $\n Note: Client will download additional Data"
	MessageBox MB_ICONINFORMATION "GM Password: $2 $\n(Use @login in-game)"
SectionEnd

Section "un.Uninstall Section"
    # Remove the shortcuts from the start menu
    Delete "$SMPROGRAMS\Uninstall ${APP_NAME}.lnk"
	Delete "$SMPROGRAMS\${APP_NAME}\Client\${APP_NAME} Client.lnk"
	Delete "$SMPROGRAMS\${APP_NAME}\Server\${APP_NAME} Server.lnk"
	
	# Remove from Add/Remove Programs in Windows Control Panel
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	# Remove Desktop Shortcuts
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	# Remove Directories
	RMDir /r "$INSTDIR"
SectionEnd



