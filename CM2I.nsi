!include LogicLib.nsh
!include MUI.nsh

!define VERSION "1.1.0.0"
!define APP_NAME "CrystalM2"

!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define WV2_URL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/959354ef-4cbd-4c8b-92b9-2b67f16f8974/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"

!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/meacher0/Crystal.Database/releases/download/v1.0.0.0/JevCrystalDB.zip"
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"

!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

Name "${APP_NAME} v${VERSION}"

ShowInstDetails show

!define LANG_ENGLISH "1033"
VIProductVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME} Setup"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${APP_NAME} Setup Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${APP_NAME}® is a trademark of ${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME} Installer Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

Outfile "${APP_NAME}_${VERSION}.exe"

RequestExecutionLevel Admin

InstallDir "$PROGRAMFILES64\${APP_NAME}"

;!define MUI_ICON "path\to\icon.ico"
;!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_BITMAP "path\to\InstallerLogo.bmp"
;!define MUI_HEADERIMAGE_RIGHT

!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE English

LangString DESC_GPR ${LANG_ENGLISH} "The Runtimes and Redistributables required for the CrystalM2 Server and Client to run successfully."
LangString DESC_GCF ${LANG_ENGLISH} "The Open-Source CrystalM2 Binaries and libraries required to begin setup your CrystalM2 Game Server."
LangString DESC_GCC ${LANG_ENGLISH} "The Automatic Configuration of the CrystalM2 Server with various settings"
LangString DESC_GCS ${LANG_ENGLISH} "The creation of shortcuts in various locations to assist with quick and easy access."
LangString DESC_DN8 ${LANG_ENGLISH} "Install the dotNet v8.0.6 Desktop Runtime. CrystalM2 uses some dotNET 8 code and libraries to function."
LangString DESC_VC13 ${LANG_ENGLISH} "Install the Visual C++ 2013 Redistributable. CrystalM2 uses some C++ 2013 code and libraries to function."
LangString DESC_WV2 ${LANG_ENGLISH} "Install the Microsoft WebView2 Runtime. The CrystalM2 Client uses WebView to display the autopatchers webpage. NOTE: Not required on Windows 11."
LangString DESC_CMF ${LANG_ENGLISH} "This will Download and Install the CrystalM2 Server and Client Core binaries and files. These are the base files required to begin configuring a CrystalM2 Server."
LangString DESC_CCD ${LANG_ENGLISH} "This will download the additional CrystalM2 Client Data files using this installer. The CrystalM2 Client normally uses an Auto-Patching Launcher to download its data."
LangString DESC_JDB ${LANG_ENGLISH} "The CrystalM2 Server needs to be configured before the game can be played. This will download and use JevLOMCN's Pre-configured database and files to finish initial Server setup."
LangString DESC_UBC ${LANG_ENGLISH} "Configure basic Server settings to allow playing game. This updates the Server configuration with basic settings allowing it to be played immediately."
LangString DESC_CDS ${LANG_ENGLISH} "Creates CrystalM2 Client, Server and Uninstaller Shortcuts on the Desktop."
LangString DESC_CSMS ${LANG_ENGLISH} "Create CrystalM2 Client, Server, Server Tools and Uninstaller Shortcuts in Start Menu Applications."
LangString DESC_GMP ${LANG_ENGLISH} "Replace the default CrystalM2 GM Password used to elevate permissions of a player character to GameMaster. A popup will appear during installation with the new password."
LangString DESC_UNI ${LANG_ENGLISH} "Add Uninstaller and Add/Remove Program Information to assist with removal of CrystalM2 files downloaded and installed with this installer."


SectionGroup "Pre-Requisites" GPR

Section "dotNET 8.0.6 Runtime" DN8

	retry_dn_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			DetailPrint "Downloading dotNET 8.0 Runtime..."
			NScurl::http get "${NET8_URL}" "$TEMP\cm2\dotnet8.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "Installing dotNET 8.0 Runtime..."
				ExecWait '"$TEMP\cm2\dotnet8.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download dotNET 8.0.6.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_dn_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "dotNET 8.0.6 is Already Installed..."
		${EndIf}
		
SectionEnd

Section "C++ Redist. 2013 Runtime" VC13

	retry_vc_download:
		ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
		${If} $0 != "12.0.30501.0"
			DetailPrint "Downloading Visual C++ 2013 Redistributable..."
			NScurl::http get "${VCR13_URL}" "$TEMP\cm2\vcredist_x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "Installing Visual C++ 2013 Redist..."
				ExecWait '"$TEMP\cm2\vcredist_x64.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download Visual C++ 2013 Redist.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_vc_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "C++ 2013 Redist is Already Installed..."
		${EndIf}
		
SectionEnd

Section "WebView2 Runtime" WV2

	retry_vc_download:
		ReadRegStr $0 HKLM "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" "pv"
		${If} $0 == "0"
			DetailPrint "Downloading WebView2 Runtime..."
			NScurl::http get "${WV2_URL}" "$TEMP\cm2\webview2.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "Installing WebView2 Runtime..."
				ExecWait '"$TEMP\cm2\webview2.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download WebView2 Runtime.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_vc_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "WebView2 Runtime is Already Installed..."
		${EndIf}
		
SectionEnd

SectionGroupEnd

SectionGroup "CrystalM2 Files" GCF

Section "CrystalM2 Core" CMF

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_cm_download:
		DetailPrint "Downloading Crystal..."
		NScurl::http get "${SCCM2_URL}" "$TEMP\cm2\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			DetailPrint "Installing Crystal..."
			nsisunz::UnzipToLog "$TEMP\cm2\build.zip" "$TEMP\cm2\crystal"
			CopyFiles "$TEMP\cm2\crystal\Crystal_14.06.2024_Debug\*" $INSTDIR
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download CrystalM2.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_cm_download
			Abort 
		${EndIf}			 

	DetailPrint "Cleaning up..."
	RMDir /r "$TEMP\cm2"
	
SectionEnd

Section /o "Additional Client Data" CCD
;TODO
SectionEnd

SectionGroupEnd

SectionGroup "Crystal Configuration" GCC

Section "Use Jev's DB" JDB

	retry_db_download:
		DetailPrint "Downloading Jev's Files..."
		NScurl::http get "${DB_URL}" "$TEMP\cm2\data.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			DetailPrint "Installing Additional Files..."
			nsisunz::UnzipToLog "$TEMP\cm2\data.zip" "$TEMP\cm2\extra"
			CopyFiles "$TEMP\cm2\extra\*" "$INSTDIR\Server"
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "Failed to download.$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again." IDRETRY retry_db_download
			Abort 
		${EndIf}
			
	DetailPrint "Cleaning up..."
	RMDir /r "$TEMP\cm2"
	
SectionEnd

Section "Use Basic Config" UBC

	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP}"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT}"	
	
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\Client\Client.exe"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "CheckVersion" "True"
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
	
SectionEnd

Section "Generate GM Password" GMP

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
	
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "GMPassword" "$2"
	
	MessageBox MB_ICONINFORMATION "A new GM Password has been generated.$\n$\nGM Password: $2 $\n$\nUse the @login game command to elevate charater.$\nThe password can be updated by editing Setup.ini located in:$\n $INSTDIR\Server\Configs"
	DetailPrint "GM Password: $2"
	
SectionEnd

SectionGroupEnd

SectionGroup "Create Shortcuts" GCS

Section "Desktop Shortcuts" CDS

	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	
SectionEnd

Section "StartMenu Shortcuts" CSMS

	
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	
	SetOutPath "$INSTDIR\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"
	
	SetOutPath "$INSTDIR\Server Tools\LibraryViewer"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Viewer.lnk" "$INSTDIR\Server Tools\LibraryViewer\CMirLibraryViewer.exe"
	
	SetOutPath "$INSTDIR\Server Tools\LibraryEditor"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Editor.lnk" "$INSTDIR\Server Tools\LibraryEditor\LibraryEditor.exe"

SectionEnd

SectionGroupEnd

Section "-Create Uninstall Info" UNI

	WriteUninstaller "$INSTDIR\uninstall.exe"

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayName" "${APP_NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "HelpLink" "${HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "URLInfoAbout" "${ABOUT_URL}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayVersion" "${VERSION}"	
				 
	SetOutPath $INSTDIR
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "un.Uninstall Section"

	RMDir /r "$SMPROGRAMS\${APP_NAME}"
	
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	RMDir /r "$INSTDIR"
	
SectionEnd

Function .OnInit

	SectionSetSize ${DN8} 160000
	SectionSetSize ${VC13} 31000
	SectionSetSize ${WV2} 190000
	SectionSetSize ${CMF} 160000
	SectionSetSize ${CCD} 7200000
	SectionSetSize ${JDB} 950000
	SectionSetSize ${UBC} 100
	SectionSetSize ${CDS} 9
	SectionSetSize ${CSMS} 21
	SectionSetSize ${GMP} 16
	SectionSetSize ${UNI} 2000
	
	SectionSetFlags ${CMF} 17
	
FunctionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${GPR} $(DESC_GPR)
	!insertmacro MUI_DESCRIPTION_TEXT ${GCF} $(DESC_GCF)
	!insertmacro MUI_DESCRIPTION_TEXT ${GCC} $(DESC_GCC)
	!insertmacro MUI_DESCRIPTION_TEXT ${GCS} $(DESC_GCS)
	!insertmacro MUI_DESCRIPTION_TEXT ${DN8} $(DESC_DN8)
	!insertmacro MUI_DESCRIPTION_TEXT ${VC13} $(DESC_VC13)
	!insertmacro MUI_DESCRIPTION_TEXT ${WV2} $(DESC_WV2)
	!insertmacro MUI_DESCRIPTION_TEXT ${CMF} $(DESC_CMF)
	!insertmacro MUI_DESCRIPTION_TEXT ${CCD} $(DESC_CCD)
	!insertmacro MUI_DESCRIPTION_TEXT ${JDB} $(DESC_JDB)
	!insertmacro MUI_DESCRIPTION_TEXT ${UBC} $(DESC_UBC)
	!insertmacro MUI_DESCRIPTION_TEXT ${CDS} $(DESC_CDS)
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMS} $(DESC_CSMS)
	!insertmacro MUI_DESCRIPTION_TEXT ${GMP} $(DESC_GMP)
	!insertmacro MUI_DESCRIPTION_TEXT ${UNI} $(DESC_UNI)
!insertmacro MUI_FUNCTION_DESCRIPTION_END