!include LogicLib.nsh
!include MUI.nsh

;Installer Config
RequestExecutionLevel Admin
!define VERSION "1.2.0.1"
!define APP_NAME "CrystalM2"
!define MUI_ICON "C:\Path\to\ICON.ICO"
Name "${APP_NAME} v${VERSION}"
Outfile "${APP_NAME}_${VERSION}.exe"
InstallDir "$PROGRAMFILES64\${APP_NAME}"
VIProductVersion "${VERSION}"
ShowInstDetails show

;Pre-Requisite URLs
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define WV2_URL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/959354ef-4cbd-4c8b-92b9-2b67f16f8974/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"

;Crystal files URLs
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/meacher0/Crystal.Database/releases/download/v1.0.0.0/JevCrystalDB.zip"

;Useful URLs
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

;Client/Server Network Config
!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"
!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

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
!define MUI_COMPONENTSPAGE_SMALLDESC
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

;MUI Language Strings
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Korean"

;Components Page English Language Strings
LangString DESC_GPR ${LANG_ENGLISH} "The Runtimes and Redistributables required for the CrystalM2 Server and Client to run successfully."
LangString DESC_DN8 ${LANG_ENGLISH} "Install the dotNet v8.0.6 Desktop Runtime. CrystalM2 uses some dotNET 8 code and libraries to function."
LangString DESC_VC13 ${LANG_ENGLISH} "Install the Visual C++ 2013 Redistributable. CrystalM2 uses some C++ 2013 code and libraries to function."
LangString DESC_WV2 ${LANG_ENGLISH} "Install the Microsoft WebView2 Runtime. The Client uses WebView to display the autopatcher webpage."
LangString DESC_GCF ${LANG_ENGLISH} "The Open-Source CrystalM2 Binaries and libraries required to begin setup of your CrystalM2 Game Server."
LangString DESC_CMF ${LANG_ENGLISH} "Download and Install the CrystalM2 Server and Client Core binaries and files."
LangString DESC_GCC ${LANG_ENGLISH} "The Automatic Configuration of the CrystalM2 Server with various settings."
LangString DESC_JDB ${LANG_ENGLISH} "Download and use JevLOMCN's Pre-configured database and files to aid initial Server setup."
LangString DESC_SCN ${LANG_ENGLISH} "Set the Client to connect to IP ${CLIENT_IP}:${CLIENT_PORT}"
LangString DESC_ECH ${LANG_ENGLISH} "Set the location of the client executable that the server will use for Client version check."
LangString DESC_SLI ${LANG_ENGLISH} "Set the server's IP address to 0.0.0.0 to allow LAN play."
LangString DESC_ACC ${LANG_ENGLISH} "Allow creation of user accounts."
LangString DESC_ASG ${LANG_ENGLISH} "Allow characters to enter the game world after creating an account and character."
LangString DESC_AAA ${LANG_ENGLISH} "Allow the creation of the Archer and Assassin classes."
LangString DESC_MRH ${LANG_ENGLISH} "Increase the maximum allowed game resolution to 1920x1080."
LangString DESC_SZH ${LANG_ENGLISH} "Create a border around in-game Safe Zones to help with visibility. Also Heal players inside a Safe Zone." 
LangString DESC_GMP ${LANG_ENGLISH} "Replace the default CrystalM2 GM Password used to elevate a player character to GameMaster."
LangString DESC_GCS ${LANG_ENGLISH} "Create quick access shortcuts to aid in quickly locating various parts of CrystalM2."
LangString DESC_CDC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable on the desktop."
LangString DESC_CDS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable on the desktop."
LangString DESC_CSMC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable in the Start Menu."
LangString DESC_CSMS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable in the Start Menu."
LangString DESC_CSMV ${LANG_ENGLISH} "Create a shortcut to the Library Viewer Tool executable in the Start Menu."
LangString DESC_CSME ${LANG_ENGLISH} "Create a shortcut to the Library Editor Tool in the Start Menu."
LangString DESC_CSMD ${LANG_ENGLISH} "Create a shortcut to the Server Directory in the Start Menu."
LangString DESC_WFW ${LANG_ENGLISH} "Add a firewall rule for the Server to allow inbound traffic from LAN."
LangString DESC_GUN ${LANG_ENGLISH} "Options for uninstallation and clean-up when you are finished with your CrystalM2 server."
LangString DESC_UNI ${LANG_ENGLISH} "Add infomation about CrystalM2 to Add/Remove Programs of the windows control panel."
LangString DESC_UDS ${LANG_ENGLISH} "Create a Desktop shortcut to easily uninstall CrystalM2."
LangString DESC_USM ${LANG_ENGLISH} "Create a Start Menu shortcut to easily uninstall CrystalM2."

;MessageBox English Language Strings
LangString MSGB_DLF ${LANG_ENGLISH} "Download Failed...$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again."
LangString MSGB_GMP ${LANG_ENGLISH} "A new GM Password has been generated.$\n$\nGM Password: $2 $\n$\nUse the @login game command to elevate charater.$\nThe password can be updated by editing Setup.ini located in:$\n $INSTDIR\Server\Configs"
LangString MSGB_AIN ${LANG_ENGLISH} "A Selected Pre-Requisite is already installed, continuing . . ."

;DetailPrint English Language Strings
LangString DPRNT_DWN ${LANG_ENGLISH} "Downloading Pre-Requisite . . ."
LangString DPRNT_INS ${LANG_ENGLISH} "Installing Pre-Requisite . . ."
LangString DPRNT_DLC ${LANG_ENGLISH} "Downloading CrystalM2 Core Files . . ."
LangString DPRNT_CLN ${LANG_ENGLISH} "Cleaning up . . ."
LangString DPRNT_JDB ${LANG_ENGLISH} "Downloading Jev's DB Files . . ."

;Components Page Chinese Language Strings
LangString DESC_GPR ${LANG_TRADCHINESE} "CrystalM2 伺服器和客戶端運行所需的運行時和發佈包。"
LangString DESC_DN8 ${LANG_TRADCHINESE} "安裝 dotNet v8.0.6 桌面運行時。CrystalM2 使用一些 dotNET 8 代碼和庫來運行。"
LangString DESC_VC13 ${LANG_TRADCHINESE} "安裝 Visual C++ 2013 Redistributable。CrystalM2 使用一些 C++ 2013 代碼和庫來運行。"
LangString DESC_WV2 ${LANG_TRADCHINESE} "安裝 Microsoft WebView2 運行時。客戶端使用 WebView 顯示自動補丁網頁。"
LangString DESC_GCF ${LANG_TRADCHINESE} "開源的 CrystalM2 二進制文件和庫，用於開始設置您的 CrystalM2 遊戲伺服器。"
LangString DESC_CMF ${LANG_TRADCHINESE} "下載並安裝 CrystalM2 伺服器和客戶端核心二進制文件和文件。"
LangString DESC_GCC ${LANG_TRADCHINESE} "CrystalM2 伺服器的自動配置，包括各種設置。"
LangString DESC_JDB ${LANG_TRADCHINESE} "下載並使用 JevLOMCN 的預配置數據庫和文件，以幫助初始伺服器設置。"
LangString DESC_SCN ${LANG_TRADCHINESE} "設置客戶端連接到 IP ${CLIENT_IP}:${CLIENT_PORT}"
LangString DESC_ECH ${LANG_TRADCHINESE} "設置伺服器將用於客戶端版本檢查的客戶端執行文件的位置。"
LangString DESC_SLI ${LANG_TRADCHINESE} "將伺服器的 IP 地址設置為 0.0.0.0，以允許局域網遊戲。"
LangString DESC_ACC ${LANG_TRADCHINESE} "允許創建用戶帳戶。"
LangString DESC_ASG ${LANG_TRADCHINESE} "在創建帳戶和角色後，允許角色進入遊戲世界。"
LangString DESC_AAA ${LANG_TRADCHINESE} "允許創建弓箭手和刺客職業。"
LangString DESC_MRH ${LANG_TRADCHINESE} "將最大允許的遊戲分辨率增加到 1920x1080。"
LangString DESC_SZH ${LANG_TRADCHINESE} "在游戏内的安全区域周围创建边框，以提高可见性。还可以在安全区域内治疗玩家。"
LangString DESC_GMP ${LANG_TRADCHINESE} "替换用于将玩家角色提升为游戏管理员的默认 CrystalM2 GM 密码。"
LangString DESC_GCS ${LANG_TRADCHINESE} "创建快速访问快捷方式，以帮助快速定位 CrystalM2 的各个部分。"
LangString DESC_CDC ${LANG_TRADCHINESE} "在桌面上创建游戏客户端执行文件的快捷方式。"
LangString DESC_CDS ${LANG_TRADCHINESE} "在桌面上创建游戏服务器执行文件的快捷方式。"
LangString DESC_CSMC ${LANG_TRADCHINESE} "在开始菜单中创建游戏客户端执行文件的快捷方式。"
LangString DESC_CSMS ${LANG_TRADCHINESE} "在开始菜单中创建游戏服务器执行文件的快捷方式。"
LangString DESC_CSMV ${LANG_TRADCHINESE} "在开始菜单中创建库查看器工具执行文件的快捷方式。"
LangString DESC_CSME ${LANG_TRADCHINESE} "在开始菜单中创建库编辑器工具的快捷方式。"
LangString DESC_CSMD ${LANG_TRADCHINESE} "在开始菜单中创建服务器目录的快捷方式。"
LangString DESC_WFW ${LANG_TRADCHINESE} "为服务器添加防火墙规则，以允许来自局域网的入站流量。"
LangString DESC_GUN ${LANG_TRADCHINESE} "完成 CrystalM2 服务器后的卸载和清理选项。"
LangString DESC_UNI ${LANG_TRADCHINESE} "将 CrystalM2 的信息添加到 Windows 控制面板的“添加/删除程序”中。"
LangString DESC_UDS ${LANG_TRADCHINESE} "创建桌面快捷方式，以便轻松卸载 CrystalM2。"
LangString DESC_USM ${LANG_TRADCHINESE} "创建开始菜单快捷方式，以便轻松卸载 CrystalM2。"

;MessageBox Chinese Language Strings
LangString MSGB_DLF ${LANG_TRADCHINESE} "下載失敗...$\n請檢查網路連線設定。$\n按“重試”以重新嘗試下載。"
LangString MSGB_GMP ${LANG_TRADCHINESE} "已生成新的 GM 密碼。$\n$\nGM 密碼：$2 $\n$\n使用 @login 遊戲指令提升角色權限。$\n密碼可以通過編輯位於以下位置的 Setup.ini 進行更新：$\n $INSTDIR\\Server\\Configs"
LangString MSGB_AIN ${LANG_TRADCHINESE} "所選的先決條件已經安裝，繼續進行 . . ."

;DetailPrint Chinese Language Strings
LangString DPRNT_DWN ${LANG_TRADCHINESE} "正在下載先決條件 . . ."
LangString DPRNT_INS ${LANG_TRADCHINESE} "正在安裝先決條件 . . ."
LangString DPRNT_DLC ${LANG_TRADCHINESE} "正在下載 CrystalM2 核心文件 . . ."
LangString DPRNT_CLN ${LANG_TRADCHINESE} "正在清理 . . ."
LangString DPRNT_JDB ${LANG_TRADCHINESE} "正在下載 Jev 的數據庫文件 . . ."

;Components Page Korean Language Strings
LangString DESC_GPR ${LANG_KOREAN} "CrystalM2 서버 및 클라이언트가 성공적으로 실행되기 위해 필요한 런타임 및 배포 파일입니다."
LangString DESC_DN8 ${LANG_KOREAN} "dotNet v8.0.6 데스크톱 런타임을 설치하세요. CrystalM2는 일부 dotNET 8 코드와 라이브러리를 사용합니다."
LangString DESC_VC13 ${LANG_KOREAN} "Visual C++ 2013 Redistributable을 설치하세요. CrystalM2는 일부 C++ 2013 코드와 라이브러리를 사용합니다."
LangString DESC_WV2 ${LANG_KOREAN} "Microsoft WebView2 런타임을 설치하세요. 클라이언트는 WebView를 사용하여 자동 패치 웹 페이지를 표시합니다."
LangString DESC_GCF ${LANG_KOREAN} "CrystalM2 게임 서버 설정을 시작하기 위해 필요한 오픈 소스 CrystalM2 바이너리 및 라이브러리입니다."
LangString DESC_CMF ${LANG_KOREAN} "CrystalM2 서버 및 클라이언트 코어 바이너리 및 파일을 다운로드하고 설치하세요."
LangString DESC_GCC ${LANG_KOREAN} "CrystalM2 서버의 자동 구성과 다양한 설정입니다."
LangString DESC_JDB ${LANG_KOREAN} "JevLOMCN의 사전 구성된 데이터베이스와 파일을 다운로드하여 초기 서버 설정을 지원하세요."
LangString DESC_SCN ${LANG_KOREAN} "클라이언트를 IP ${CLIENT_IP}:${CLIENT_PORT}에 연결하도록 설정하세요."
LangString DESC_ECH ${LANG_KOREAN} "서버가 클라이언트 버전 확인에 사용할 클라이언트 실행 파일의 위치를 설정하세요."
LangString DESC_SLI ${LANG_KOREAN} "서버의 IP 주소를 0.0.0.0으로 설정하여 LAN 플레이를 허용하세요."
LangString DESC_ACC ${LANG_KOREAN} "사용자 계정 생성을 허용하세요."
LangString DESC_ASG ${LANG_KOREAN} "계정 및 캐릭터 생성 후 캐릭터가 게임 세계에 진입할 수 있도록 허용하세요."
LangString DESC_AAA ${LANG_KOREAN} "아처 및 어쌔신 클래스 생성을 허용하세요."
LangString DESC_MRH ${LANG_KOREAN} "게임 해상도 최대 허용치를 1920x1080으로 늘리세요."
LangString DESC_SZH ${LANG_KOREAN} "게임 내 안전 지역 주변에 테두리를 생성하여 가시성을 높입니다. 또한 안전 지역 내 플레이어를 치료합니다."
LangString DESC_GMP ${LANG_KOREAN} "플레이어 캐릭터를 게임 마스터로 승급시키는 기본 CrystalM2 GM 암호를 대체합니다."
LangString DESC_GCS ${LANG_KOREAN} "CrystalM2의 다양한 부분을 빠르게 찾기 위해 퀵 액세스 바로 가기를 생성합니다."
LangString DESC_CDC ${LANG_KOREAN} "데스크톱에서 게임 클라이언트 실행 파일로 바로 가기를 생성합니다."
LangString DESC_CDS ${LANG_KOREAN} "데스크톱에서 게임 서버 실행 파일로 바로 가기를 생성합니다."
LangString DESC_CSMC ${LANG_KOREAN} "시작 메뉴에서 게임 클라이언트 실행 파일로 바로 가기를 생성합니다."
LangString DESC_CSMS ${LANG_KOREAN} "시작 메뉴에서 게임 서버 실행 파일로 바로 가기를 생성합니다."
LangString DESC_CSMV ${LANG_KOREAN} "시작 메뉴에서 라이브러리 뷰어 도구 실행 파일로 바로 가기를 생성합니다."
LangString DESC_CSME ${LANG_KOREAN} "시작 메뉴에서 라이브러리 편집기 도구로 바로 가기를 생성합니다."
LangString DESC_CSMD ${LANG_KOREAN} "시작 메뉴에서 서버 디렉토리로 바로 가기를 생성합니다."
LangString DESC_WFW ${LANG_KOREAN} "서버에 방화벽 규칙을 추가하여 LAN에서 들어오는 트래픽을 허용합니다."
LangString DESC_GUN ${LANG_KOREAN} "CrystalM2 서버 사용이 끝난 후 제거 및 정리 옵션입니다."
LangString DESC_UNI ${LANG_KOREAN} "Windows 제어판의 추가/제거 프로그램에 CrystalM2 정보를 추가합니다."
LangString DESC_UDS ${LANG_KOREAN} "CrystalM2를 쉽게 제거하기 위해 데스크톱 바로 가기를 생성합니다."
LangString DESC_USM ${LANG_KOREAN} "CrystalM2를 쉽게 제거하기 위해 시작 메뉴 바로 가기를 생성합니다."

;MessageBox Korean Language Strings
LangString MSGB_DLF ${LANG_KOREAN} "다운로드 실패...$\n인터넷 연결 설정을 확인하세요.$\n다시 다운로드하려면 '재시도'를 클릭하세요."
LangString MSGB_GMP ${LANG_KOREAN} "새 GM 암호가 생성되었습니다.$\n$\nGM 암호: $2 $\n$\n캐릭터를 게임 마스터로 승급시키려면 @login 게임 명령을 사용하세요.$\n암호는 다음 위치의 Setup.ini를 편집하여 업데이트할 수 있습니다.:$\n $INSTDIR\\Server\\Configs"
LangString MSGB_AIN ${LANG_KOREAN} "선택한 사전 요구 사항이 이미 설치되어 있습니다. 계속 진행합니다..."

;DetailPrint Korean Language Strings
LangString DPRNT_DWN ${LANG_KOREAN} "사전 요구 사항 다운로드 중 . . ."
LangString DPRNT_INS ${LANG_KOREAN} "사전 요구 사항 설치 중 . . ."
LangString DPRNT_DLC ${LANG_KOREAN} "CrystalM2 코어 파일 다운로드 중 . . ."
LangString DPRNT_CLN ${LANG_KOREAN} "정리 중 . . ."
LangString DPRNT_JDB ${LANG_KOREAN} "Jev의 DB 파일 다운로드 중 . . ."


SectionGroup "Pre-Requisites" GPR

Section "dotNET 8.0.6 Runtime" DN8

	retry_dn_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${NET8_URL}" "$TEMP\cm2\dotnet8.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\dotnet8.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_dn_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

Section "C++ Redist. 2013 Runtime" VC13

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
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

Section "WebView2 Runtime" WV2

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
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

SectionGroupEnd


SectionGroup "CrystalM2 Files" GCF

Section "CrystalM2 Core" CMF

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_cm_download:
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM2_URL}" "$TEMP\cm2\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm2\build.zip" "$TEMP\cm2\crystal"
			CopyFiles "$TEMP\cm2\crystal\Crystal_14.06.2024_Debug\*" $INSTDIR
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_cm_download
			Abort 
		${EndIf}			 

	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm2"
	
SectionEnd

SectionGroupEnd


SectionGroup "Crystal Configuration" GCC

Section "Use Jev's DB" JDB

	retry_db_download:
		DetailPrint "$(DPRNT_JDB)"
		NScurl::http get "${DB_URL}" "$TEMP\cm2\data.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm2\data.zip" "$TEMP\cm2\extra"
			CopyFiles "$TEMP\cm2\extra\*" "$INSTDIR\Server"
			
			;Copy Maps from Server to Client, Autopatcher overwrites maps when using JevDB and Autopathcer...
			;if used, increase section size to account for maps.
			;CopyFiles "$TEMP\cm2\extra\Maps\*" "$INSTDIR\Client\Map"
			
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_db_download
			Abort 
		${EndIf}
			
	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm2"
	
SectionEnd

Section "Set Client Networking" SCN

	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP}"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT}"	
	
SectionEnd
	
Section "Enforce Client Hash" ECH
	
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\Client\Client.exe"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "CheckVersion" "True"
	
SectionEnd

Section "Set Server IP for LAN play" SLI

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP}"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT}"

SectionEnd
	
Section "Allow Character Creation" ACC

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewAccount" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowChangePassword" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowLogin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewCharacter" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowDeleteCharacter" "True"
	
SectionEnd
	
Section "Allow Starting Game" ASG

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowStartGame" "True"

SectionEnd
	
Section "Allow Archer/Assassin" AAA

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateAssassin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateArcher" "True"

SectionEnd

Section "Max Resolution 1920x1080" MRH

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "MaxResolution" "1920"
	
SectionEnd
	
Section "SafeZone Border/Healing" SZH

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
	
	MessageBox MB_ICONINFORMATION "$(MSGB_GMP)"
	DetailPrint "GM Password: $2"
	
SectionEnd

SectionGroupEnd


SectionGroup "Create Shortcuts" GCS

Section "Desktop: Client" CDC

	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
SectionEnd

Section "Desktop: Server" CDS

	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"

SectionEnd

Section "StartMenu: Client" CSMC

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
SectionEnd

Section "StartMenu: Server" CSMS
	
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"

SectionEnd
	
Section "StartMenu: Lib Viewer" CSMV

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server Tools\LibraryViewer"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Viewer.lnk" "$INSTDIR\Server Tools\LibraryViewer\CMirLibraryViewer.exe"

SectionEnd

Section "StartMenu: Lib Editor" CSME

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server Tools\LibraryEditor"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Editor.lnk" "$INSTDIR\Server Tools\LibraryEditor\LibraryEditor.exe"

SectionEnd

Section "StartMenu: Server Dir" CSMD

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Server Directory.lnk" "$INSTDIR\Server"

SectionEnd

SectionGroupEnd


Section "Add Firewall Rule" WFW

	ExecWait 'netsh advfirewall firewall add rule name="${APP_NAME}" dir=in program="$INSTDIR\Server\Server.exe" remoteip=localsubnet action=allow profile=public,private'

SectionEnd


SectionGroup "Uninstaller" GUN

Section "Add/Remove Programs" UNI

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
				 
SectionEnd

Section "Desktop Shortcut" UDS

	SetOutPath "$INSTDIR"
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "StartMenu Shortcut" USM
	
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

SectionGroupEnd


Section "un.Uninstall Section"

	RMDir /r "$SMPROGRAMS\${APP_NAME}"
	
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	ExecWait 'netsh advfirewall firewall delete rule name="${APP_NAME}"'
	
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	RMDir /r "$INSTDIR"
	
SectionEnd


Function .OnInit

	;Set approx size for RequiredSize calculation
	SectionSetSize ${DN8} 160000
	SectionSetSize ${VC13} 31000
	SectionSetSize ${WV2} 190000
	SectionSetSize ${CMF} 160000
	SectionSetSize ${JDB} 950000
	SectionSetSize ${UNI} 2000
	
	;Set Core Server/Client as required for install
	SectionSetFlags ${CMF} 17
	
	;Show Language choice at start
	!insertmacro MUI_LANGDLL_DISPLAY
	
FunctionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN

	;Add description text on components page using language strings
	!insertmacro MUI_DESCRIPTION_TEXT ${GPR} $(DESC_GPR) ;group - pre-requisites
	!insertmacro MUI_DESCRIPTION_TEXT ${DN8} $(DESC_DN8) ; dotnet 8
	!insertmacro MUI_DESCRIPTION_TEXT ${VC13} $(DESC_VC13) ;vc redist
	!insertmacro MUI_DESCRIPTION_TEXT ${WV2} $(DESC_WV2) ; webview2
	!insertmacro MUI_DESCRIPTION_TEXT ${GCF} $(DESC_GCF) ;group crystal files
	!insertmacro MUI_DESCRIPTION_TEXT ${CMF} $(DESC_CMF) ;crystalM2 core files
	!insertmacro MUI_DESCRIPTION_TEXT ${GCC} $(DESC_GCC) ;group - crystal config
	!insertmacro MUI_DESCRIPTION_TEXT ${JDB} $(DESC_JDB) ; Jev's DB	
	!insertmacro MUI_DESCRIPTION_TEXT ${SCN} $(DESC_SCN) ; set client network
	!insertmacro MUI_DESCRIPTION_TEXT ${ECH} $(DESC_ECH) ; set client hash on serv
	!insertmacro MUI_DESCRIPTION_TEXT ${SLI} $(DESC_SLI) ; set server ip 0.0.0.0
	!insertmacro MUI_DESCRIPTION_TEXT ${ACC} $(DESC_ACC) ; allow create char stuff
	!insertmacro MUI_DESCRIPTION_TEXT ${ASG} $(DESC_ASG) ; allow start game
	!insertmacro MUI_DESCRIPTION_TEXT ${AAA} $(DESC_AAA) ; allow sin/arch
	!insertmacro MUI_DESCRIPTION_TEXT ${MRH} $(DESC_MRH) ; set max res 1920
	!insertmacro MUI_DESCRIPTION_TEXT ${SZH} $(DESC_SZH) ; safezone
	!insertmacro MUI_DESCRIPTION_TEXT ${GMP} $(DESC_GMP) ; generate GM pass
	!insertmacro MUI_DESCRIPTION_TEXT ${GCS} $(DESC_GCS) ; group - create shortcuts
	!insertmacro MUI_DESCRIPTION_TEXT ${CDC} $(DESC_CDC) ; client desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CDS} $(DESC_CDS) ; Server desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMC} $(DESC_CSMC) ; Client Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMS} $(DESC_CSMS) ; Server Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMV} $(DESC_CSMV) ; LibViewer Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSME} $(DESC_CSME) ; LibEditor Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMD} $(DESC_CSMD) ; ServerDir Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${WFW} $(DESC_WFW) ; windows firewall rule
	!insertmacro MUI_DESCRIPTION_TEXT ${GUN} $(DESC_GUN) ; Group - uninstaller
	!insertmacro MUI_DESCRIPTION_TEXT ${UNI} $(DESC_UNI) ; add/rem progs info
	!insertmacro MUI_DESCRIPTION_TEXT ${UDS} $(DESC_UDS) ; uninstaller desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${USM} $(DESC_USM) ; uninstaller startmenu shortcut
	
!insertmacro MUI_FUNCTION_DESCRIPTION_END