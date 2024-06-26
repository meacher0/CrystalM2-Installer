!include LogicLib.nsh
!include MUI.nsh

;Installer Config
RequestExecutionLevel Admin
!define VERSION "2.1.0.0"
!define APP_NAME "LOMCN"
!define APP_NAME1 "Carbon"
!define APP_NAME2 "Crystal"
!define APP_NAME3 "Zircon"
Name "${APP_NAME} v${VERSION}"
BrandingText "LOMCN Open-Source Software Installer"
Outfile "${APP_NAME}_${VERSION}.exe"
InstallDir "$PROGRAMFILES64\${APP_NAME}"
VIProductVersion "${VERSION}"
ShowInstDetails show
!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_ICON "C:\path\to\icon.ICO"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "C:\path\to\banner.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\path\to\welcome.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "C:\path\to\welcome.bmp"
!define MUI_BGCOLOR "0d0550"
!define MUI_TEXTCOLOR "f0f6f8"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

;Pre-Requisite URLs
;Crystal and Carbon
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define WV2_URL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/959354ef-4cbd-4c8b-92b9-2b67f16f8974/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"
!define APN_URL "https://download.visualstudio.microsoft.com/download/pr/10651a65-8afc-46e3-9287-fecb0e68504e/4c2bf0cdb44612f29d9b3f901098e13e/aspnetcore-runtime-7.0.20-win-x64.exe"
!define NET7_URL "https://download.visualstudio.microsoft.com/download/pr/08bbfe8f-812d-479f-803b-23ea0bffce47/c320e4b037f3e92ab7ea92c3d7ea3ca1/windowsdesktop-runtime-7.0.20-win-x64.exe"
!define ASP7_URL "https://download.visualstudio.microsoft.com/download/pr/10651a65-8afc-46e3-9287-fecb0e68504e/4c2bf0cdb44612f29d9b3f901098e13e/aspnetcore-runtime-7.0.20-win-x64.exe"

;Carbon URLs
!define SCCM1_URL1 "https://github.com/meacher0/Carbon/releases/download/v0.0.0.1/Carbon_DebugBuild.zip"
!define SCCM1_URL2 "https://drive.usercontent.google.com/download?id=18m-KlWlNZvrV08OWYTs2IkM8LVvOr20X&export=download&authuser=0&confirm=t&uuid=a3f4200a-ce26-43fa-94f8-5b94bb9359d1&at=APZUnTV3S1AOTUWfE3xp-SD87r0g%3A1719250410535"
!define M1DB_URL "https://github.com/meacher0/Carbon.Database/releases/download/v0.0.0.1/Carbon.PTS.23.06.24.zip"
!define M1HELP_URL "https://www.lomcn.net/wiki/index.php/Carbon"

;Crystal URLs
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define M2DB_URL "https://github.com/meacher0/Crystal.Database/releases/download/v1.0.0.0/JevCrystalDB.zip"
!define M2HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"

;Zircon URLs
!define SCCM3_URL "https://github.com/meacher0/Zircon/releases/download/v0.0.0.1/Zircon_23.06.24_Debug.zip"
!define SCZM3_URL1 "https://drive.usercontent.google.com/download?id=1gyWmYHpqJ93gB-pCj-JUgMZDak-6t7pE&export=download&authuser=0&confirm=t&uuid=d0e6b49a-abad-4ab1-b244-97ec2359036a&at=APZUnTVIwV7yWd-RTWabh_SzlwiZ%3A1719242705635"
!define SCZM3_URL2 "https://drive.usercontent.google.com/download?id=1QTYVqW-LgLckCaCb3aVbB97ysXd9Yp-k&export=download&authuser=0&confirm=t&uuid=1c1c3557-8da3-4d06-a403-a0b40949a417&at=APZUnTU02f4o4qFvjDiqqdbyqnmM%3A1719242521362"
!define M3DB_URL "https://github.com/meacher0/Zircon/releases/download/v0.0.0.1/ZirconDB.zip"
!define M3HELP_URL "https://www.lomcn.net/wiki/index.php/Zircon"

;GitHub URL
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

;Carbon Client/Server Network Config
!define CLIENT_IP1 "127.0.0.1"
!define CLIENT_PORT1 "7000"
!define SERVER_IP1 "0.0.0.0" ; cant use 0.0.0.0 with multiple server types! update to 192.168.n.n
!define SERVER_PORT1 "7000"

;Crystal Client/Server Network Config
!define CLIENT_IP2 "127.0.0.1"
!define CLIENT_PORT2 "7100"
!define SERVER_IP2 "0.0.0.0" ; cant use 0.0.0.0 with multiple server types! update to 192.168.n.n
!define SERVER_PORT2 "7100"

;Client/Server Network Config
!define CLIENT_IP3 "127.0.0.1"
!define CLIENT_PORT3 "7200"
!define SERVER_IP3 "0.0.0.0" ; cant use 0.0.0.0 with multiple server types! update to 192.168.n.n
!define SERVER_PORT3 "7200"

;Language Codes
!define LANG_ENGLISH "1033"
!define LANG_CHINESE "1028"
!define LANG_KOREAN "1042"

;English Installer Information
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME} Setup"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${APP_NAME} Setup Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${APP_NAME}® is a trademark of ${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME} Installer Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

;Chinese Installer Information
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductName" "${APP_NAME} 安裝"
VIAddVersionKey /LANG=${LANG_CHINESE} "Comments" "${APP_NAME} 安裝應用程式"
VIAddVersionKey /LANG=${LANG_CHINESE} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_CHINESE} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_CHINESE} "LegalTrademarks" "${APP_NAME}® 是 ${APP_NAME} 的商標"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileDescription" "${APP_NAME} 安裝程式"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductVersion" "${VERSION}"

;Korean Installer Information
VIAddVersionKey /LANG=${LANG_KOREAN} "ProductName" "${APP_NAME} 설치"
VIAddVersionKey /LANG=${LANG_KOREAN} "Comments" "${APP_NAME} 설치 응용 프로그램"
VIAddVersionKey /LANG=${LANG_KOREAN} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_KOREAN} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_KOREAN} "LegalTrademarks" "${APP_NAME}®은(는) ${APP_NAME}의 상표입니다."
VIAddVersionKey /LANG=${LANG_KOREAN} "FileDescription" "${APP_NAME} 설치 프로그램"
VIAddVersionKey /LANG=${LANG_KOREAN} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_KOREAN} "ProductVersion" "${VERSION}"

;Add Modern User Interface (MUI)
!insertmacro MUI_PAGE_WELCOME

!insertmacro MUI_PAGE_LICENSE "D:\AI\mir\MMILic.txt"
!insertmacro MUI_PAGE_LICENSE "D:\AI\mir\carbonLic.txt"

!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;installtypes defines
!macro AddInstType name text
!define /IfNDef AddInstType_COUNTER 0
InstType "${text}"
!define INSTTYPE_${name}_IDX ${AddInstType_COUNTER} ; For SetCurInstType etc.
!define /ReDef /Math AddInstType_COUNTER ${AddInstType_COUNTER} + 1
!define INSTTYPE_${name}_SIN ${AddInstType_COUNTER} ; For SectionIn
!macroend

!insertmacro AddInstType M0 "Select Install Type"
!insertmacro AddInstType M1 "Install Carbon"
!insertmacro AddInstType M2 "Install Crystal"
!insertmacro AddInstType M3 "Install Zircon"
!insertmacro AddInstType X1 "Install ALL"

;MUI Language Strings
!insertmacro MUI_LANGUAGE "English"
;!insertmacro MUI_LANGUAGE "TradChinese"
;!insertmacro MUI_LANGUAGE "Korean"

;Components Page English Language Description Strings
;Group Strings
LangString DESC_GPR ${LANG_ENGLISH} "The Runtimes and Redistributables required for the Servers and Clients to run successfully."
LangString DESC_GHC ${LANG_ENGLISH} "Configure settings on the this computer for smooth operation of selected install."
LangString DESC_GCF ${LANG_ENGLISH} "The Open-Source Binaries and libraries required to begin setup of your Game Server."
LangString DESC_GCC ${LANG_ENGLISH} "The Automatic Configuration of the Servers with various settings."
LangString DESC_GCS ${LANG_ENGLISH} "Create quick access shortcuts to aid in quickly accessing various locations."
LangString DESC_GUN ${LANG_ENGLISH} "Options for uninstallation and clean-up when you are finished with your server."

;Pre-Req Strings
LangString DESC_AN7 ${LANG_ENGLISH} "Install the ASP.NET Runtime. ${APP_NAME3} uses some ASP.NET code and libraries to function"
LangString DESC_DN7 ${LANG_ENGLISH} "Install the dotNet v7 Desktop Runtime. ${APP_NAME3} uses some dotNET 7 code and libraries to function."
LangString DESC_DN8 ${LANG_ENGLISH} "Install the dotNet v8 Desktop Runtime. ${APP_NAME2} uses some dotNET 8 code and libraries to function."
LangString DESC_VC13 ${LANG_ENGLISH} "Install the Visual C++ 2013 Redistributable. ${APP_NAME2} uses some C++ 2013 code and libraries to function."
LangString DESC_WV2 ${LANG_ENGLISH} "Install the Microsoft WebView2 Runtime. ${APP_NAME2} uses WebView to display the autopatcher webpage."

;Core Files Strings
LangString DESC_CMF ${LANG_ENGLISH} "Download and Install the ${APP_NAME2} Server and Client Core binaries and files."
LangString DESC_JDB ${LANG_ENGLISH} "Download and use JevLOMCN's Pre-configured database and files to aid initial Server setup."
LangString DESC_SCN ${LANG_ENGLISH} "Set the Client to connect to IP ${CLIENT_IP1}:${CLIENT_PORT1}"
LangString DESC_ECH ${LANG_ENGLISH} "Set the location of the client executable that the server will use for Client version check."
LangString DESC_SLI ${LANG_ENGLISH} "Set the server's IP address to 0.0.0.0 to allow LAN play."
LangString DESC_ACC ${LANG_ENGLISH} "Allow creation of user accounts."
LangString DESC_ASG ${LANG_ENGLISH} "Allow characters to enter the game world after creating an account and character."
LangString DESC_AAA ${LANG_ENGLISH} "Allow the creation of the Archer and Assassin classes."
LangString DESC_MRH ${LANG_ENGLISH} "Increase the maximum allowed game resolution to 1920x1080."
LangString DESC_SZH ${LANG_ENGLISH} "Create a border around in-game Safe Zones to help with visibility. Also Heal players inside a Safe Zone." 

LangString DESC_GMP1 ${LANG_ENGLISH} "Replace the default GM Password used to elevate a player character to GameMaster."
LangString DESC_GMP2 ${LANG_ENGLISH} "Replace the default GM Password used to elevate a player character to GameMaster."
LangString DESC_GMP3 ${LANG_ENGLISH} "Replace the default Master Password used to login to any account."

LangString DESC_CDC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable on the desktop."
LangString DESC_CDS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable on the desktop."
LangString DESC_CSMC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable in the Start Menu."
LangString DESC_CSMS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable in the Start Menu."
LangString DESC_CSMV ${LANG_ENGLISH} "Create a shortcut to the Library Viewer Tool executable in the Start Menu."
LangString DESC_CSME ${LANG_ENGLISH} "Create a shortcut to the Library Editor Tool in the Start Menu."
LangString DESC_CSMD ${LANG_ENGLISH} "Create a shortcut to the Server Directory in the Start Menu."

;Host Config Strings
LangString DESC_CFW ${LANG_ENGLISH} "Add a firewall rule for the ${APP_NAME1} Server to allow inbound traffic from LAN."
LangString DESC_WFW ${LANG_ENGLISH} "Add a firewall rule for the ${APP_NAME2} Server to allow inbound traffic from LAN."
LangString DESC_ZFW ${LANG_ENGLISH} "Add a firewall rule for the ${APP_NAME3} Server to allow inbound traffic from LAN."

;uninstaller Strings
LangString DESC_UNI ${LANG_ENGLISH} "Add infomation about ${APP_NAME2} to Add/Remove Programs of the windows control panel."
LangString DESC_UDS ${LANG_ENGLISH} "Create a Desktop shortcut to easily uninstall ${APP_NAME2}."
LangString DESC_USM ${LANG_ENGLISH} "Create a Start Menu shortcut to easily uninstall ${APP_NAME2}."

LangString DESC_UM1 ${LANG_ENGLISH} "Remove ${APP_NAME1} from $INSTDIR\${APP_NAME1}."
LangString DESC_UM2 ${LANG_ENGLISH} "Remove ${APP_NAME2} from $INSTDIR\${APP_NAME2}."
LangString DESC_UM3 ${LANG_ENGLISH} "Remove ${APP_NAME3} from $INSTDIR\${APP_NAME3}."
LangString DESC_UIU ${LANG_ENGLISH} "Remove ${APP_NAME}. Warning: Will remove all installations."

;MessageBox English Language Strings
LangString MSGB_DLF ${LANG_ENGLISH} "Download Failed...$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again."

LangString MSGB_GMP1 ${LANG_ENGLISH} "A new GM Password has been generated for ${App_NAME1}.$\n$\nNew GM Password: $2 $\n$\nUse the @login game command to elevate charater."
LangString MSGB_GMP2 ${LANG_ENGLISH} "A new GM Password has been generated for ${App_NAME2}.$\n$\nNew GM Password: $2 $\n$\nUse the @login game command to elevate charater."
LangString MSGB_GMP3 ${LANG_ENGLISH} "A new Master Password has been generated for ${App_NAME3}.$\n$\nMaster Password: $2 $\n$\nUse any Character name and the Master Password to login."

;DetailPrint English Language Strings
LangString DPRNT_DWN ${LANG_ENGLISH} "Downloading Pre-Requisite . . ."
LangString DPRNT_INS ${LANG_ENGLISH} "Installing Pre-Requisite . . ."
LangString DRPNT_AIN ${LANG_ENGLISH} "A Selected Pre-Requisite is already installed, continuing . . ."
LangString DPRNT_DLC ${LANG_ENGLISH} "Downloading Core Files . . ."
LangString DPRNT_CLN ${LANG_ENGLISH} "Cleaning up . . ."
LangString DPRNT_JDB ${LANG_ENGLISH} "Downloading DB Files . . ."


SectionGroup "Pre-Requisites" GPR

Section "(Zircon) ASP.NET 7.0 Runtime" AN7
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}
	retry_an7_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{6c2f4b5b-86d2-4aff-bf79-d1e73cc20ab3}" "Version"
		${If} $0 != "7.0.20.24269"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${ASP7_URL}" "$TEMP\cm2\aspnet7.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\aspnet7.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_an7_download
				Abort 
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}
		
SectionEnd

Section "(Zircon) .NET 7.0 Runtime" DN7
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}
	retry_dn7_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{362ea044-f96f-45c7-b59f-0dbe5ca98ff4}" "Version"
		${If} $0 != "7.0.20.33720"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${NET7_URL}" "$TEMP\cm2\dotnet7.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\dotnet7.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_dn7_download
				Abort 
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}
		
SectionEnd

Section "(Carbon/Crystal) .NET 8.0 Runtime" DN8
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	retry_dn8_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${NET8_URL}" "$TEMP\cm2\dotnet8.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\dotnet8.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_dn8_download
				Abort 
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}
		
SectionEnd

Section "(Carbon/Crystal/Zircon) C++ 2013 Redist." VC13
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_M2_SIN} ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}
	retry_vc_download:
		ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
		${If} $0 != "12.0.30501.0"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${VCR13_URL}" "$TEMP\cm2\vcredist_x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\vcredist_x64.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_vc_download
				Abort 
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}
		
SectionEnd

Section "(Zircon) DirectX SDK" ZDX
  SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}
  
  ;TODO - S1023 error check here! - https://stackoverflow.com/questions/4102259/directx-sdk-june-2010-installation-problems-error-code-s1023
  
	retry_dx_download:
		ReadRegStr $0 HKLM "SOFTWARE\Microsoft\DirectX" "SDKVersion"
		${If} $0 != "9.29.1962.0"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${DXSDK_URL}" "$TEMP\cm2\directxsdk.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\directxsdk.exe" /silent'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_dx_download
				Abort
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}


SectionEnd

Section "(Crystal) WebView2 Runtime" WV2
  SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	retry_wv_download:
		ReadRegStr $0 HKLM "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" "pv"
		${If} $0 == "0"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${WV2_URL}" "$TEMP\cm2\webview2.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\webview2.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_wv_download
				Abort 
			${EndIf}
		${Else}
		DetailPrint "$(DRPNT_AIN)"
		${EndIf}
		
SectionEnd

SectionGroupEnd



SectionGroup "Core Files" GCF

Section "(Carbon) CarbonM1 Core" CCF
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	CreateDirectory $INSTDIR\${APP_NAME1}
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_ca_download:
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM1_URL1}" "$TEMP\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\build.zip" "$TEMP\${APP_NAME1}"
			CopyFiles "$TEMP\${APP_NAME1}\*" "$INSTDIR\${APP_NAME1}\"
			Delete $TEMP\build.zip
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_ca_download
			Abort 
		${EndIf}			 
		

	retry_ccd_download:
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM1_URL2}" "$TEMP\cdata.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cdata.zip" "$TEMP\${APP_NAME1}\cdata"
			CopyFiles "$TEMP\${APP_NAME1}\cdata\*" "$INSTDIR\${APP_NAME1}\Client\Debug\"
			Delete $TEMP\cdata.zip
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_ccd_download
			Abort 
		${EndIf}			 




	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\${APP_NAME1}"
	
SectionEnd

Section "(Crystal) CrystalM2 Core" CMF
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	CreateDirectory $INSTDIR\${APP_NAME2}
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_cm_download:
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM2_URL}" "$TEMP\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\build.zip" "$TEMP\${APP_NAME2}"
			CopyFiles "$TEMP\${APP_NAME2}\Crystal_14.06.2024_Debug\*" "$INSTDIR\${APP_NAME2}\"
			Delete $TEMP\build.zip
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_cm_download
			Abort 
		${EndIf}			 


	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\${APP_NAME2}"
	
SectionEnd

Section "(Zircon) ZirconM3 Core" ZMF
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	CreateDirectory $INSTDIR\${APP_NAME3}
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_zm_download: 
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM3_URL}" "$TEMP\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\build.zip" "$INSTDIR\${APP_NAME3}"
			;CopyFiles "$TEMP\${APP_NAME3}\*" "$INSTDIR\${APP_NAME3}\"
			Delete $TEMP\build.zip
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_zm_download
			Abort 
		${EndIf}			 

	retry_zc_download: 
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCZM3_URL1}" "$TEMP\cdata1.zip" /CANCEL /RESUME /END
		NScurl::http get "${SCZM3_URL2}" "$TEMP\cdata2.zip" /CANCEL /RESUME /END		
		Pop $R0
		${If} $R0 == "OK"
			
			nsisunz::UnzipToLog "$TEMP\cdata1.zip" "$TEMP\${APP_NAME3}"
			Delete "$TEMP\${APP_NAME3}\SlimDX.dll"
			nsisunz::UnzipToLog "$TEMP\cdata2.zip" "$TEMP\${APP_NAME3}"
			CopyFiles "$TEMP\${APP_NAME3}\*" "$INSTDIR\${APP_NAME3}\Client\"
			Delete $TEMP\cdata1.zip
			Delete $TEMP\cdata2.zip
			RMDir /r "$TEMP\${APP_NAME3}"
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_zc_download
			Abort 
		${EndIf}	


	DetailPrint "$(DPRNT_CLN)"

	
SectionEnd

SectionGroupEnd



SectionGroup "Core Configuration" GCC

Section "(Carbon) Use PTS DB" CDB
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	retry_cdb_download:
		DetailPrint "$(DPRNT_JDB)"
		NScurl::http get "${M1DB_URL}" "$TEMP\cm1\data.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm1\data.zip" "$TEMP\cm1\extra"
			CopyFiles "$TEMP\cm1\extra\Carbon.PTS\*" "$INSTDIR\${APP_NAME1}\Server\Debug"
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_cdb_download
			Abort 
		${EndIf}
			
	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm1"
	
SectionEnd

Section "(Carbon) Set Client Networking" SCN1
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME1}\Client\Debug\Mir1Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\${APP_NAME1}\Client\Debug\Mir1Test.ini" "Network" "IPAddress" "${CLIENT_IP1}"
	WriteINIStr "$INSTDIR\${APP_NAME1}\Client\Debug\Mir1Test.ini" "Network" "Port" "${CLIENT_PORT1}"	
	
SectionEnd

Section "(Carbon) Set Server IP for LAN play" SLI1
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME1}\Server\Debug\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP1}"
	WriteINIStr "$INSTDIR\${APP_NAME1}\Server\Debug\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT1}"

SectionEnd

Section "(Carbon) Enforce Client Hash" ECH1
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME1}\Server\Debug\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\${APP_NAME1}\Client\Debug\Client.exe"
	WriteINIStr "$INSTDIR\${APP_NAME1}\Server\Debug\Configs\Setup.ini" "General" "CheckVersion" "True"
	
SectionEnd

Section "(Crystal) Use Jev's DB" JDB
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	retry_jdb_download:
		DetailPrint "$(DPRNT_JDB)"
		NScurl::http get "${M2DB_URL}" "$TEMP\cm2\data.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm2\data.zip" "$TEMP\cm2\extra"
			CopyFiles "$TEMP\cm2\extra\*" "$INSTDIR\${APP_NAME2}\Server"
			
			;Copy Maps from Server to Client, Autopatcher overwrites maps when using JevDB and Autopathcer...
			;if used, increase section size to account for maps.
			;CopyFiles "$TEMP\cm2\extra\Maps\*" "$INSTDIR\Client\Map"
			
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_jdb_download
			Abort 
		${EndIf}
			
	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm2"
	
SectionEnd

Section "(Crystal) Set Client Networking" SCN
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP2}"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT2}"	
	
SectionEnd
	
Section "(Crystal) Enforce Client Hash" ECH
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\${APP_NAME2}\Client\Client.exe"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "General" "CheckVersion" "True"
	
SectionEnd

Section "(Crystal) Set Server IP for LAN play" SLI
  SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP2}"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT2}"

SectionEnd
	
Section "(Crystal) Allow Character Creation" ACC
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowNewAccount" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowChangePassword" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowLogin" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowNewCharacter" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowDeleteCharacter" "True"
	
SectionEnd
	
Section "(Crystal) Allow Starting Game" ASG
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowStartGame" "True"

SectionEnd
	
Section "(Crystal) Allow Archer/Assassin" AAA
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowCreateAssassin" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "AllowCreateArcher" "True"

SectionEnd

Section "(Crystal) Max Resolution 1920x1080" MRH
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Permission" "MaxResolution" "1920"
	
SectionEnd
	
Section "(Crystal) SafeZone Border/Healing" SZH
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Optional" "SafeZoneBorder" "True"
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "Optional" "SafeZoneHealing" "True"
	
SectionEnd

Section "(Crystal) Generate GM Password" GMP2
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
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
	
	WriteINIStr "$INSTDIR\${APP_NAME2}\Server\Configs\Setup.ini" "General" "GMPassword" "$2"
	
	MessageBox MB_ICONINFORMATION "$(MSGB_GMP2)"
	DetailPrint "GM Password: $2"
	
SectionEnd

Section "(Zircon) Use Jamie's DB" ZDB
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	retry_zdb_download:
		DetailPrint "$(DPRNT_JDB)"
		NScurl::http get "${M3DB_URL}" "$TEMP\cm3\data3.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			CreateDirectory "$INSTDIR\Zircon\Server\Database"
			;CreateDirectory "$INSTDIR\Zircon\Client\Data"
			nsisunz::UnzipToLog "$TEMP\cm3\data3.zip" "$INSTDIR\${APP_NAME3}\Server\Database"
			nsisunz::UnzipToLog "$TEMP\cm3\data3.zip" "$INSTDIR\${APP_NAME3}\Client\Data"
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_zdb_download
			Abort 
		${EndIf}
			
	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm3"
	
SectionEnd

Section "(Zircon) Set Client Networking" ZCN
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\Zircon\Client\Mir3Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Zircon\Client\Mir3Test.ini" "Network" "IPAddress" "${CLIENT_IP3}"
	WriteINIStr "$INSTDIR\Zircon\Client\Mir3Test.ini" "Network" "Port" "${CLIENT_PORT3}"	
	
SectionEnd

Section "(Zircon) Set Server IP for LAN play" ZLI
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}
	WriteINIStr "$INSTDIR\Zircon\Server\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP3}"
	WriteINIStr "$INSTDIR\Zircon\Server\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT3}"

SectionEnd

Section "(Zircon) Set Version Path" ZVP
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "System" "VersionPath" "$INSTDIR\${APP_NAME3}\Client\Zircon.exe"
	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "System" "CheckVersion" "True"

SectionEnd

Section "(Zircon) Set Client Data Path" ZDP
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "System" "ClientPath" "$INSTDIR\${APP_NAME3}\Client\Data\"

SectionEnd

Section "(Zircon) Set Client Map Path" ZMP
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "System" "MapPath" "$INSTDIR\${APP_NAME3}\Client\Map\"

SectionEnd

Section "(Zircon) Allow Start Game" ZSG
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "Control" "AllowStartGame" "True"

SectionEnd

Section "(Zircon) Disbale Activation Req." ZDA
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	; mentioned in setup but i cant find it

SectionEnd

Section "(Zircon) Set Mystery Ship" ZMS
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "Monsters" "MysteryShipRegionIndex" "711"

SectionEnd

Section "(Zircon) Set Lair Region" ZLR
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "Monsters" "LairRegionIndex" "1570"

SectionEnd

Section "(Zircon) Generate Master Password" GMP3
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

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
	
	WriteINIStr "$INSTDIR\${APP_NAME3}\Server\Server.ini" "System" "MasterPassword" "$2"
	
	MessageBox MB_ICONINFORMATION "$(MSGB_GMP3)"
	DetailPrint "GM Password: $2"
	
SectionEnd

SectionGroupEnd



SectionGroup "Create Shortcuts" GCS

Section "(Carbon) Desktop: Client" C1DC
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME1}\Client\Debug" 
    CreateShortcut "$DESKTOP\${APP_NAME1} Client.lnk" "$INSTDIR\${APP_NAME1}\Client\Debug\Client.exe"
	
SectionEnd

Section "(Carbon) Desktop: Server" C1DS
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME1}\Server\Debug"
    CreateShortcut "$DESKTOP\${APP_NAME1} Server.lnk" "$INSTDIR\${APP_NAME1}\Server\Debug\Server.exe"

SectionEnd

Section "(Carbon) StartMenu: Client" C1SMC
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}"
	SetOutPath "$INSTDIR\${APP_NAME1}\Client\Debug"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}\${APP_NAME1} Client.lnk" "$INSTDIR\${APP_NAME1}\Client\Debug\Client.exe"
	
SectionEnd

Section "(Carbon) StartMenu: Server" C1SMS
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}"
	SetOutPath "$INSTDIR\${APP_NAME1}\Server\Debug"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}\${APP_NAME1} Server.lnk" "$INSTDIR\${APP_NAME1}\Server\Debug\Server.exe"

SectionEnd

Section "(Carbon) StartMenu: Library Editor" C1SML
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}"
	SetOutPath "$INSTDIR\${APP_NAME1}\Server Tools\LibraryEditor\Debug"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}\${APP_NAME1} LibraryEditor.lnk" "$INSTDIR\${APP_NAME1}\Server Tools\LibraryEditor\Debug\LibraryEditor.exe"

SectionEnd

Section "(Carbon) StartMenu: Server Dir" C1SMD
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}"
	SetOutPath "$INSTDIR\${APP_NAME1}\Server\Debug"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}\Server Directory.lnk" "$INSTDIR\${APP_NAME1}\Server\Debug"

SectionEnd

Section "(Crystal) Desktop: Client" CDC
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME2}\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME2} Client.lnk" "$INSTDIR\${APP_NAME2}\Client\Client.exe"
	
SectionEnd

Section "(Crystal) Desktop: Server" CDS
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME2}\Server"
    CreateShortcut "$DESKTOP\${APP_NAME2} Server.lnk" "$INSTDIR\${APP_NAME2}\Server\Server.exe"

SectionEnd

Section "(Crystal) StartMenu: Client" CSMC
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	SetOutPath "$INSTDIR\${APP_NAME2}\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}\${APP_NAME2} Client.lnk" "$INSTDIR\${APP_NAME2}\Client\Client.exe"
	
SectionEnd

Section "(Crystal) StartMenu: Server" CSMS
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	SetOutPath "$INSTDIR\${APP_NAME2}\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}\${APP_NAME2} Server.lnk" "$INSTDIR\${APP_NAME2}\Server\Server.exe"

SectionEnd
	
Section "(Crystal) StartMenu: Lib Viewer" CSMV
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	SetOutPath "$INSTDIR\${APP_NAME2}\Server Tools\LibraryViewer"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}\Library Viewer.lnk" "$INSTDIR\${APP_NAME2}\Server Tools\LibraryViewer\CMirLibraryViewer.exe"

SectionEnd

Section "(Crystal) StartMenu: Lib Editor" CSME
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	SetOutPath "$INSTDIR\${APP_NAME2}\Server Tools\LibraryEditor"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}\Library Editor.lnk" "$INSTDIR\${APP_NAME2}\Server Tools\LibraryEditor\LibraryEditor.exe"

SectionEnd

Section "(Crystal) StartMenu: Server Dir" CSMD
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	SetOutPath "$INSTDIR\${APP_NAME2}\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}\Server Directory.lnk" "$INSTDIR\${APP_NAME2}\Server"

SectionEnd

Section "(Zircon) Desktop: Client" ZDC
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME3}\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME3} Client.lnk" "$INSTDIR\${APP_NAME3}\Client\Launcher.exe"
	
SectionEnd

Section "(Zircon) Desktop: Server" ZDS
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR\${APP_NAME3}\Server"
    CreateShortcut "$DESKTOP\${APP_NAME3} Server.lnk" "$INSTDIR\${APP_NAME3}\Server\Server.exe"

SectionEnd

Section "(Zircon) StartMenu: Client" ZSMC
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	SetOutPath "$INSTDIR\${APP_NAME3}\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}\${APP_NAME3} Client.lnk" "$INSTDIR\${APP_NAME3}\Client\Client.exe"
	
SectionEnd

Section "(Zircon) StartMenu: Server" ZSMS
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	SetOutPath "$INSTDIR\${APP_NAME3}\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}\${APP_NAME3} Server.lnk" "$INSTDIR\${APP_NAME3}\Server\Server.exe"

SectionEnd
	
Section "(Zircon) StartMenu: Patch Manager" ZSMV
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	SetOutPath "$INSTDIR\${APP_NAME3}\PatchManager"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}\Patch Manager.lnk" "$INSTDIR\${APP_NAME3}\PatchManager\PatchManager.exe"

SectionEnd

Section "(Zircon) StartMenu: Image Manager" ZSME
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	SetOutPath "$INSTDIR\${APP_NAME3}\ImageManager"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}\Image Manager.lnk" "$INSTDIR\${APP_NAME3}\ImageManager\ImageManager.exe"

SectionEnd

Section "(Zircon) StartMenu: Server Dir" ZSMD
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	SetOutPath "$INSTDIR\${APP_NAME3}"
	CreateShortcut "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}\${APP_NAME3} Directory.lnk" "$INSTDIR\${APP_NAME3}"

SectionEnd

SectionGroupEnd



SectionGroup "Host Configuration" GHC

Section "(Carbon) Add Firewall Rule" CFW
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}
	
	ExecWait 'netsh advfirewall firewall add rule name="${APP_NAME1}" dir=in program="$INSTDIR\${APP_NAME1}\Server\Debug\Server.exe" remoteip=localsubnet action=allow profile=public,private'

SectionEnd

Section "(Crystal) Add Firewall Rule" WFW
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}
	
	ExecWait 'netsh advfirewall firewall add rule name="${APP_NAME2}" dir=in program="$INSTDIR\${APP_NAME2}\Server\Server.exe" remoteip=localsubnet action=allow profile=public,private'

SectionEnd

Section "(Zircon) Add Firewall Rule" ZFW
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	ExecWait 'netsh advfirewall firewall add rule name="${APP_NAME3}" dir=in program="$INSTDIR\${APP_NAME3}\Server\Server.exe" remoteip=localsubnet action=allow profile=public,private'

SectionEnd

SectionGroupEnd



SectionGroup "Uninstaller" GUN

Section "Write Uninstaller"
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_M2_SIN} ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteUninstaller "$INSTDIR\uninstall.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
             "DisplayName" "${APP_NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
             "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	
SectionEnd

Section "(Carbon) Add/Remove Programs" CNI
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" \
                 "DisplayName" "${APP_NAME1}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" \
                 "HelpLink" "${M1HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" \
                 "URLInfoAbout" "${ABOUT_URL}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" \
                 "DisplayVersion" "${VERSION}"	
				 
SectionEnd

Section "(Crystal) Add/Remove Programs" UNI
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" \
                 "DisplayName" "${APP_NAME2}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" \
                 "HelpLink" "${M2HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" \
                 "URLInfoAbout" "${ABOUT_URL}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" \
                 "DisplayVersion" "${VERSION}"	
				 
SectionEnd

Section "(Zircon) Add/Remove Programs" ZNI
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" \
                 "DisplayName" "${APP_NAME3}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" \
                 "HelpLink" "${M3HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" \
                 "URLInfoAbout" "${ABOUT_URL}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" \
                 "DisplayVersion" "${VERSION}"	
				 
SectionEnd

Section "Desktop Shortcut" UDS
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_M2_SIN} ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	SetOutPath "$INSTDIR"
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "StartMenu Shortcut" USM
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_M2_SIN} ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

SectionGroupEnd




Section "un.Uninstall Carbon" UM1
 SectionIn ${INSTTYPE_M1_SIN} ${INSTTYPE_X1_SIN}

	Delete "$DESKTOP\${APP_NAME1} Client.lnk"
    Delete "$DESKTOP\${APP_NAME1} Server.lnk"
	ExecWait 'netsh advfirewall firewall delete rule name="${APP_NAME1}"'
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}"
	RMDir /r "$SMPROGRAMS\${APP_NAME} - ${APP_NAME1}"
	RMDir /r "$INSTDIR\${APP_NAME1}"
SectionEnd

Section "un.Uninstall Crystal" UM2
 SectionIn ${INSTTYPE_M2_SIN} ${INSTTYPE_X1_SIN}

	Delete "$DESKTOP\${APP_NAME2} Client.lnk"
    Delete "$DESKTOP\${APP_NAME2} Server.lnk"
	ExecWait 'netsh advfirewall firewall delete rule name="${APP_NAME2}"'
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}"
	RMDir /r "$SMPROGRAMS\${APP_NAME} - ${APP_NAME2}"
	RMDir /r "$INSTDIR\${APP_NAME2}"
SectionEnd

Section "Un.Uninstall Zircon" UM3
 SectionIn ${INSTTYPE_M3_SIN} ${INSTTYPE_X1_SIN}

	Delete "$DESKTOP\${APP_NAME3} Client.lnk"
    Delete "$DESKTOP\${APP_NAME3} Server.lnk"
	ExecWait 'netsh advfirewall firewall delete rule name="${APP_NAME3}"'
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}"
	RMDir /r "$SMPROGRAMS\${APP_NAME} - ${APP_NAME3}"
	RMDir /r "$INSTDIR\${APP_NAME3}"
SectionEnd

Section "un.Remove Uninstaller" UIU
 SectionIn ${INSTTYPE_X1_SIN}

	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	RMDir "$SMPROGRAMS\${APP_NAME}"
	RMDir /r "$INSTDIR"
	
SectionEnd



Function .OnInit

	;Set approx size for RequiredSize calculation
	;pre-reqs
	SectionSetSize ${AN7} 50000
	SectionSetSize ${DN7} 120000
	SectionSetSize ${DN8} 160000
	SectionSetSize ${VC13} 31000
	SectionSetSize ${ZDX} 1200000
	SectionSetSize ${WV2} 190000

	;core files
	SectionSetSize ${CCF} 150000
	SectionSetSize ${CMF} 200000
	SectionSetSize ${ZMF} 8550000

	;data
	SectionSetSize ${CDB} 550000
	SectionSetSize ${JDB} 1300000
	SectionSetSize ${ZDB} 20000
	
	;Set Core Server/Client as required for install
	;SectionSetFlags ${CMF} 17
	
	;Show Language choice at start
	;!insertmacro MUI_LANGDLL_DISPLAY

	; Check to see if carbon is already installed
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME1}" "UninstallString"
	${If} $0 != ""
		MessageBox MB_YESNO "${APP_NAME1} is already installed.$\nTo repair an installation, please uninstall first.$\nWould you like to Uninstall the existing version?" IDYES uninst IDNO CheckCrystal
	${Else}
	Goto CheckCrystal
	${EndIf}

	; Check to see if crystal is already installed
	CheckCrystal:
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME2}" "UninstallString"
	${If} $0 != ""
		MessageBox MB_YESNO "${APP_NAME2} is already installed.$\nTo repair an installation, please uninstall first.$\nWould you like to Uninstall the existing version?" IDYES uninst IDNO CheckZircon
	${Else}
	Goto CheckZircon
	${EndIf}

	; Check to see if zircon is already installed
	CheckZircon:
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME3}" "UninstallString"
	${If} $0 != ""
		MessageBox MB_YESNO "${APP_NAME3} is already installed.$\nTo repair an installation, please uninstall first.$\nWould you like to Uninstall the existing version?" IDYES uninst IDNO NotInstalled
	${Else}
	Goto NotInstalled
	${EndIf}

	uninst:
		ExecWait '"$INSTDIR\uninstall.exe" _?=$INSTDIR'

 	NotInstalled:

FunctionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN

	;Add description text on components page using language strings
	!insertmacro MUI_DESCRIPTION_TEXT ${GPR} $(DESC_GPR) ;group - pre-requisites
	!insertmacro MUI_DESCRIPTION_TEXT ${GCF} $(DESC_GCF) ;group - core files
	!insertmacro MUI_DESCRIPTION_TEXT ${GCC} $(DESC_GCC) ;group - core config
	!insertmacro MUI_DESCRIPTION_TEXT ${GCS} $(DESC_GCS) ;group - create shortcuts
	!insertmacro MUI_DESCRIPTION_TEXT ${GHC} $(DESC_GHC) ;group - Host config	
	!insertmacro MUI_DESCRIPTION_TEXT ${GUN} $(DESC_GUN) ;group - uninstaller

	!insertmacro MUI_DESCRIPTION_TEXT ${AN7} $(DESC_AN7) ; asp.net 7
	!insertmacro MUI_DESCRIPTION_TEXT ${DN7} $(DESC_DN7) ; dotnet 7
	!insertmacro MUI_DESCRIPTION_TEXT ${DN8} $(DESC_DN8) ; dotnet 8
	!insertmacro MUI_DESCRIPTION_TEXT ${VC13} $(DESC_VC13) ;vc redist
	!insertmacro MUI_DESCRIPTION_TEXT ${WV2} $(DESC_WV2) ; webview2

	!insertmacro MUI_DESCRIPTION_TEXT ${CMF} $(DESC_CMF) ;crystalM2 core files

	!insertmacro MUI_DESCRIPTION_TEXT ${JDB} $(DESC_JDB) ; Jev's DB	
	!insertmacro MUI_DESCRIPTION_TEXT ${SCN} $(DESC_SCN) ; set client network
	!insertmacro MUI_DESCRIPTION_TEXT ${ECH} $(DESC_ECH) ; set client hash on serv
	!insertmacro MUI_DESCRIPTION_TEXT ${SLI} $(DESC_SLI) ; set server ip 0.0.0.0
	!insertmacro MUI_DESCRIPTION_TEXT ${ACC} $(DESC_ACC) ; allow create char stuff
	!insertmacro MUI_DESCRIPTION_TEXT ${ASG} $(DESC_ASG) ; allow start game
	!insertmacro MUI_DESCRIPTION_TEXT ${AAA} $(DESC_AAA) ; allow sin/arch
	!insertmacro MUI_DESCRIPTION_TEXT ${MRH} $(DESC_MRH) ; set max res 1920
	!insertmacro MUI_DESCRIPTION_TEXT ${SZH} $(DESC_SZH) ; safezone

	;!insertmacro MUI_DESCRIPTION_TEXT ${GMP1} $(DESC_GMP1) ; generate carbon GM pass
	!insertmacro MUI_DESCRIPTION_TEXT ${GMP2} $(DESC_GMP2) ; generate crystal GM pass
	!insertmacro MUI_DESCRIPTION_TEXT ${GMP3} $(DESC_GMP3) ; generate zircon master pass

	!insertmacro MUI_DESCRIPTION_TEXT ${CDC} $(DESC_CDC) ; client desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CDS} $(DESC_CDS) ; Server desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMC} $(DESC_CSMC) ; Client Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMS} $(DESC_CSMS) ; Server Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMV} $(DESC_CSMV) ; LibViewer Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSME} $(DESC_CSME) ; LibEditor Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMD} $(DESC_CSMD) ; ServerDir Startmenu shortcut

	!insertmacro MUI_DESCRIPTION_TEXT ${CFW} $(DESC_CFW) ; carbon windows firewall rule
	!insertmacro MUI_DESCRIPTION_TEXT ${WFW} $(DESC_WFW) ; crystal windows firewall rule
	!insertmacro MUI_DESCRIPTION_TEXT ${ZFW} $(DESC_ZFW) ; zircon windows firewall rule	

	!insertmacro MUI_DESCRIPTION_TEXT ${UNI} $(DESC_UNI) ; add/rem progs info
	!insertmacro MUI_DESCRIPTION_TEXT ${UDS} $(DESC_UDS) ; uninstaller desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${USM} $(DESC_USM) ; uninstaller startmenu shortcut
	
!insertmacro MUI_FUNCTION_DESCRIPTION_END



!insertmacro MUI_UNFUNCTION_DESCRIPTION_BEGIN

	!insertmacro MUI_DESCRIPTION_TEXT ${UM1} $(DESC_UM1) ; uninstall - Remove carbon
	!insertmacro MUI_DESCRIPTION_TEXT ${UM2} $(DESC_UM2) ; uninstall - Remove crystal
	!insertmacro MUI_DESCRIPTION_TEXT ${UM3} $(DESC_UM3) ; uninstall - Remove zircon
	!insertmacro MUI_DESCRIPTION_TEXT ${UIU} $(DESC_UIU) ; uninstall - Remove uninstaller and dir

!insertmacro MUI_UNFUNCTION_DESCRIPTION_END