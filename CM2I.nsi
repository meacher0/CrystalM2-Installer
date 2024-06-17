!include LogicLib.nsh

; Vars
!define VERSION "1.0.1.0"
!define APP_NAME "CrystalM2"

; Define Download URLs
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/meacher0/Crystal.Database/releases/download/v1.0.0.0/JevCrystalDB.zip"
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"

!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

Name "${APP_NAME} Setup v${VERSION}"

ShowInstDetails show

!define LANG_ENGLISH "1033"
VIProductVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME} Setup"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${APP_NAME} Setup Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "2024"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME} Installer Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

Outfile "${APP_NAME}_${VERSION}.exe"

RequestExecutionLevel Admin

InstallDir "$PROGRAMFILES64\${APP_NAME}"

Section "Install Section"
	MessageBox MB_ICONINFORMATION "CrystalM2 will now be installed to $INSTDIR"
    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_dn_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			DetailPrint "Downloading dotNET 8.0 Runtime..."
			NScurl::http get "${NET8_URL}" "$INSTDIR\Downloads\dotnet-runtime-8.0.6-win-x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "Installing dotNET 8.0 Runtime..."
				ExecWait '"$INSTDIR\Downloads\windowsdesktop-runtime-8.0.6-win-x64.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download dotNET 8.0.6.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_dn_download
				Abort 
			${EndIf}
		${EndIf}
	
	retry_vc_download:
		ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
		${If} $0 != "12.0.30501.0"
			DetailPrint "Downloading Visual C++ 2013 Redistributable..."
			NScurl::http get "${VCR13_URL}" "$INSTDIR\Downloads\vcredist_x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "Installing Visual C++ 2013 Redist..."
				ExecWait '"$INSTDIR\Downloads\vcredist_x64.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download Visual C++ 2013 Redist.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_vc_download
				Abort 
			${EndIf}
		${EndIf}
	
	retry_cm_download:
		DetailPrint "Downloading CrystalM2 [10MB]..."
		NScurl::http get "${SCCM2_URL}" "$INSTDIR\Downloads\CrystalM2Stable.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			DetailPrint "Installing CrystalM2 Release..."
			nsisunz::UnzipToLog "$INSTDIR\Downloads\CrystalM2Stable.zip" "$INSTDIR\Workspace"
			CopyFiles "$INSTDIR\Workspace\Crystal_14.06.2024_Debug\*" $INSTDIR
			DetailPrint "Downloading CrystalM2 Files [98MB]..."
			retry_db_download:
				NScurl::http get "${DB_URL}" "$INSTDIR\Downloads\Jev.zip" /CANCEL /RESUME /END
				Pop $R0
				${If} $R0 == "OK"
					DetailPrint "Extracting CrystalM2 Database..."
					nsisunz::UnzipToLog "$INSTDIR\Downloads\Jev.zip" "$INSTDIR\Jev"
					DetailPrint "Copying Jev's Files..."
					CopyFiles "$INSTDIR\Jev\*" "$INSTDIR\Server"
				${Else}
					MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_db_download
					Abort 
				${EndIf}
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download CrystalM2.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_cm_download
			Abort 
		${EndIf}

	StrCpy $2 ""
	badrange:
		System::Call 'advapi32::SystemFunction036(*i0r0,i1)'
		IntCmpU $0 127 "" ""  badrange 
		System::Call 'user32::IsCharAlphaNumericA(ir0)i.r1'
		StrCmp $1 0 badrange
		IntFmt $0 "%c" $0
		StrCpy $2 "$2$0"
		StrLen $0 $2
		IntCmpU $0 10 "" badrange
	DetailPrint $2

	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP}"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT}"	
	
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
	
    WriteUninstaller "$INSTDIR\uninstall.exe"
	
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	
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
	
	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	SetOutPath $INSTDIR
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayName" "${APP_NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""

	RMDir /r "$INSTDIR\Workspace"
	RMDir /r "$INSTDIR\Downloads"
	RMDir /r "$INSTDIR\Databases"
	
	MessageBox MB_ICONINFORMATION "Installation Complete!!$\nNote: Client will download additional data"
	
	MessageBox MB_ICONINFORMATION "GM Password: $2 $\n(Use @login whilst in-game)"
	
SectionEnd

Section "un.Uninstall Section"
	RMDir /r "$SMPROGRAMS\${APP_NAME}"
	
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	RMDir /r "$INSTDIR"
	
SectionEnd



