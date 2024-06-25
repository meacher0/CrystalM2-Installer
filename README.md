# LOM-Installer
[Download Pre-Compiled LOM Installer](https://github.com/meacher0/CrystalM2-Installer/releases) to get started with CarbonM1, CrystalM2 or ZirconM3.\
Tested on Microsoft Windows 11, 64-bit. \
May also work on Windows 10, 64-bit 

# Overview
These N.S.I.S. Scripts was created in an attempt to ease the initial setup and configuration of the Crystal M2 Server and Client. Once compiled and executed, it should Download, Install and Configure the CrystalM2 files ready for use (with the exception of the Client which, will download additional data when first opened following Installation).

CM2I.nsi - Crystal Only Installer. \
MMI.nsi - Multi-installer for Carbon, Crystal and Zircon in a single installer.

## Features
- Check/Install Pre-Requisite: ASP.NET 7.0 Runtime
- Check/Install Pre-Requisite: dotNET 7.0 Runtime
- Check/Install Pre-Requisite: dotNET 8.0 Runtime
- Check/Install Pre-Requisite: Visual C++ 2013 Runtime
- Check/Install Pre-Requisite: WebView2 Runtime
- Check/Install Pre-Requisite: DirectX SDK
- Download and Install Carbon, Crystal, Zircon Server/Client
- Download and Install Carbon, Crystal, Zircon Database Files
- Option to Retry Download on failure to connect
- Resume Download Automatically if part way downloaded
- Create Uninstaller executeable
- Add Uninstall to Add/Remove Programs
- Create Desktop Shortcuts
- Create StartMenu Shortcuts
- Randomly Generate GM Passwords
- Configure Server to AllowGameStart
- Set Server IP (Default: 0.0.0.0)
- Set Client IP (Default: 127.0.0.1)
- Add Firewall rules for Servers
- Chinese Language Support (CrystalM2 installer ONLY)
- Korean Language Support (CrystalM2 installer ONLY)

## Requirements
This script is compiled using the NullSoft Scriptable Install System software and as such, is required to compile this script yourself. There are also some plugins required to prevent errors when compiling the installer binary, these are listed below.
- The N.S.I.S. software is OpenSource and available to download at [SourceForge](https://nsis.sourceforge.io/Download) 
- You can also download the pre-compiled binary of this installer from the [Releases section](https://github.com/meacher0/CrystalM2-Installer/releases)

### NSIS Plugins
The Following Plugins are used for various operations within the Script. Copy DLL's to the relevant plugin directory inside the NSIS install directory.
- [AccessControl - https://nsis.sourceforge.io/AccessControl_plug-in](https://nsis.sourceforge.io/AccessControl_plug-in) 
- [NScurl - https://nsis.sourceforge.io/NScurl_plug-in](https://nsis.sourceforge.io/NScurl_plug-in) 
- [NSISunz - https://nsis.sourceforge.io/Nsisunz_plug-in](https://nsis.sourceforge.io/Nsisunz_plug-in)

### Command Line Usage
> makensis.exe [Script]

i.e.

> makensis.exe C:\downloads\MMI.nsi

## FAQ
Q: This seems complicated and I just want to play the game.\
A: Download the latest release from the [Releases section](https://github.com/meacher0/CrystalM2-Installer/releases), unzip and run the executable, profit.

Q: I get a "SmartScreen has blocked this application" Box pop-up.\
A: This happens if you don't compile the installer yourself, Click "More Info" and then "Run Anyway" to continue.

Q: I have forgotten the GM Password or didn't write down what the Installer generated.\
A: The GM Password can be located in "C:\Program Files\CrystalM2\Server\Configs\Setup.ini"

Q: I get an Error when opening a second server, something about sockets.
A only 1 server cna be open at a time unless the network config is updated from 0.0.0.0 to the LAN IP of the Host.

## Notes
Thanks to [Suprcode](https://github.com/Suprcode) and the [other contributors](https://github.com/Suprcode/Crystal/graphs/contributors) to the [Crystal Source Code](https://github.com/Suprcode/Crystal).\
Thanks to [Jev](https://github.com/JevLOMCN) for maintaining the [Carbon Repo](https://github.com/JevLOMCN/mir1) and both [Carbon](https://github.com/Suprcode/Carbon.Database) and [Crystal Database Files](https://github.com/Suprcode/Crystal.Database).\
Thanks to [Suprcode](https://github.com/Suprcode) for maintaining the [Zircon Repo](https://github.com/Suprcode/Zircon) \
[Buy me a coffee](https://www.buymeacoffee.com/danraine)
