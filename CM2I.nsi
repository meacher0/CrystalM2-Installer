!include LogicLib.nsh

; Vars
!define VERSION "1.0.0.2"
!define APP_NAME "CrystalM2"

; Define Download URLs
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/Suprcode/Crystal.Database/archive/refs/heads/main.zip"
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

; Define Client Network Configuration - Info: https://www.lomcn.net/forum/threads/port-forwarding.106595/post-1205724
!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"

; Define Server Network Configuration
!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

; Set name used for installer window
Name "${APP_NAME} ${VERSION}"

; Show Console Details as default - https://nsis.sourceforge.io/Reference/ShowInstDetails
ShowInstDetails show

; Set Installer Exe's Properties\Details tab information
!define LANG_ENGLISH "1033"
VIProductVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME} Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${APP_NAME} Installer Application"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Fake company"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${APP_NAME}® is a trademark of Fake company"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "2024"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME} Installer Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

; Set the output file for the new installer binary
Outfile "${APP_NAME}_setup_${VERSION}.exe"

; Request Run-As Admin (some network and file operations require elevation)
RequestExecutionLevel Admin

# Set "program files" as installation directory
InstallDir "$PROGRAMFILES64\${APP_NAME}"

; Install section
Section "Install Section"
	; Let user know install is starting
	MessageBox MB_ICONINFORMATION "CrystalM2 will now be installed to $INSTDIR"
	
	; Set output directory (installation path)
    SetOutPath $INSTDIR
	
	; Create directory
	CreateDirectory $INSTDIR
	
	;Set directory permissions using security ID - Info: https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-identifiers
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	; Retry return Label
	retry_dn_download:
		; Check if .NET 8 is installed
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			; .NET 8.0.6 is NOT installed, update GUI
			DetailPrint "Downloading dotNET 8.0 Runtime..."
			; Download dotNET 8.0.6 - Info: https://nsis.sourceforge.io/NScurl_plug-in
			NScurl::http get "${NET8_URL}" "$INSTDIR\Downloads\dotnet-runtime-8.0.6-win-x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				; Successfully downloaded, Update GUI
				DetailPrint "Installing dotNET 8.0 Runtime..."
				; Silently install dotNET 8.0.6
				ExecWait '"$INSTDIR\Downloads\windowsdesktop-runtime-8.0.6-win-x64.exe" /install /quiet'
			${Else}
				; Handle download failure with retry option
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download dotNET 8.0.6.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_dn_download
				Abort ; If Cancel is clicked, abort the installation
			${EndIf}
		${EndIf}
	
	; Retry return Label
	retry_vc_download:
		; Check if VC2013 Redistributable is installed
		ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
		${If} $0 != "12.0.30501.0"
			; redist is NOT installed, update GUI
			DetailPrint "Downloading Visual C++ 2013 Redistributable..."
			; Download VC2013 redist - Info: https://nsis.sourceforge.io/NScurl_plug-in
			NScurl::http get "${VCR13_URL}" "$INSTDIR\Downloads\vcredist_x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				; Successfully downloaded, update GUI
				DetailPrint "Installing Visual C++ 2013 Redist..."
				; Silently install VC2013 redist
				ExecWait '"$INSTDIR\Downloads\vcredist_x64.exe" /install /quiet'
			${Else}
				; Handle download failure with retry option
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download Visual C++ 2013 Redist.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_vc_download
				Abort ; If Cancel is clicked, abort the installation
			${EndIf}
		${EndIf}
	
	; Label to return to if Crystal files fail to download and user clicks retry
	retry_cm_download:
		; Update GUI
		DetailPrint "Downloading CrystalM2 [10MB]..."
		; Get CrystalM2 Stable Release - Info: https://nsis.sourceforge.io/NScurl_plug-in
		NScurl::http get "${SCCM2_URL}" "$INSTDIR\Downloads\CrystalM2Stable.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			; Successfully downloaded zip, update GUI
			DetailPrint "Installing CrystalM2 Stable Release..."
			; extract zip to "workspace" temp folder - Info: https://nsis.sourceforge.io/Nsisunz_plug-in
			nsisunz::UnzipToLog "$INSTDIR\Downloads\CrystalM2Stable.zip" "$INSTDIR\Workspace"
			; Copy extracted files to "Program Files"
			CopyFiles "$INSTDIR\Workspace\Crystal_14.06.2024_Debug\*" $INSTDIR
			; Update GUI
			DetailPrint "Downloading CrystalM2 Database [215MB]..."
			; Label to return to if download fails and user retries
			retry_db_download:
				; Get Crystal Databases zip
				NScurl::http get "${DB_URL}" "$INSTDIR\Downloads\Databases.zip" /CANCEL /RESUME /END
				Pop $R0
				${If} $R0 == "OK"
					; Successfully downloaded zip, install
					DetailPrint "Extracting CrystalM2 Database..."
					; Extract zip to "Databases" temp folder - Info: https://nsis.sourceforge.io/Nsisunz_plug-in
					nsisunz::UnzipToLog "$INSTDIR\Downloads\Databases.zip" "$INSTDIR\Databases"
					; Update GUI
					DetailPrint "Copying Jev's Database Files..."
					; Copy files from temp folder to Server dir
					CopyFiles "$INSTDIR\Databases\Crystal.Database-main\Jev\*" "$INSTDIR\Server"
				${Else}
					; Handle download failure with retry option
					MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download Database.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_db_download
					Abort ; If Cancel is clicked, abort the installation
				${EndIf}
		${Else}
			; Handle download failure with retry option
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download CrystalM2.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_cm_download
			Abort ; If Cancel is clicked, abort the installation
		${EndIf}

	; Generate Random New GMPassword - taken from https://stackoverflow.com/questions/19195286/generate-a-10-digit-alphanumeric-string-in-nsis
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

	; Replace Client settings in the .ini file - Info: https://nsis.sourceforge.io/Reference/WriteINIStr and https://nsis.sourceforge.io/Reference/ReadINIStr
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
	
	; create the uninstaller - Info: https://nsis.sourceforge.io/Reference/WriteUninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
	
    ; Create Start Menu shortcuts directory - Info: https://nsis.sourceforge.io/Reference/CreateShortCut
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	
	; Create shortcuts in Start Menu folder, SetOutPath determines "Start in" value - Info: https://nsis.sourceforge.io/Reference/CreateShortCut
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
	
	; Create desktop shortcuts, SetOutPath determines "Start in" value - Info: https://nsis.sourceforge.io/Reference/CreateShortCut
	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	SetOutPath $INSTDIR
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

	; Add Uninstall to Add/Remove Programs in Windows Control Panel - Info: https://nsis.sourceforge.io/Add_uninstall_information_to_Add/Remove_Programs
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

	; Clean up temp files used
	RMDir /r "$INSTDIR\Workspace"
	RMDir /r "$INSTDIR\Downloads"
	RMDir /r "$INSTDIR\Databases"
	
	; Inform user of installer completion 
	MessageBox MB_ICONINFORMATION "Installation Complete!!$\nNote: Client will download additional data"
	
	; Provide GM Password to user
	MessageBox MB_ICONINFORMATION "GM Password: $2 $\n(Use @login whilst in-game)"
	
SectionEnd

Section "un.Uninstall Section"
    # Remove the shortcuts folder from the start menu
	RMDir /r "$SMPROGRAMS\${APP_NAME}"
	
	# Remove from Add/Remove Programs in Windows Control Panel - Info: Info: https://nsis.sourceforge.io/Add_uninstall_information_to_Add/Remove_Programs
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	# Remove Desktop Shortcuts
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	# Remove Install Directory
	RMDir /r "$INSTDIR"
	
SectionEnd



