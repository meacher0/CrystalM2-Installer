# CrystalM2-Installer
[Download Pre-Compiled CrystalM2 Installer](https://github.com/meacher0/CrystalM2-Installer/releases) to get started with CrystalM2.\
Tested on Microsoft Windows 11, 64-bit. \
May also work on Windows 10, 64-bit 

# Overview
This N.S.I.S. Script was created in an attempt to ease the initial setup and configuration of the Crystal M2 Server and Client. Once compiled and executed, it should Download, Install and Configure the CrystalM2 files ready for use (with the exception of the Client which, will download additional data when first opened following Installation).

## Features
- Check/Install Pre-Requisite: dotNET 8.0 Runtime
- Check/Install Pre-Requisite: Visual C++ 2013 Runtime
- Check/Install Pre-Requisite: WebView2 Runtime
- Download and Install CrystalM2 Server/Client
- Download and Install CrystalM2 Database Files
- Option to Retry Download on failure to connect
- Resume Download Automatically if part way downloaded
- Create Uninstaller executeable
- Add Uninstall to Add/Remove Programs
- Create Desktop Shortcuts
- Create StartMenu Shortcuts
- Randomly Generate GM Password
- Configure Server to AllowGameStart
- Set Server IP (Default: 0.0.0.0)
- Set Client IP (Default: 127.0.0.1)
- Add Firewall rule for Server
- Chinese Language Support
- Korean Language Support

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

> makensis.exe C:\downloads\CM2I.nsi

## FAQ
Q: This seems complicated and I just want to play the game.\
A: Download the latest release from the [Releases section](https://github.com/meacher0/CrystalM2-Installer/releases), unzip and run the executable, profit.

Q: I get a "SmartScreen has blocked this application" Box pop-up.\
A: This happens if you don't compile the installer yourself, Click "More Info" and then "Run Anyway" to continue.

Q: I get this error when starting server "[DATE TIME]: Could not load Drop: HiGreatGhoul, Line 1/1RedDagger Q".\
A: This is a typo in the HiGreatGhoul Drop file, the error can be ignored or fixed by editing the drop file.

Q: I have forgotten the GM Password or didn't write down what the Installer generated.\
A: The GM Password can be located in "C:\Program Files\CrystalM2\Server\Configs\Setup.ini"

## Notes
Thanks to [Suprcode](https://github.com/Suprcode) and the [other contributors](https://github.com/Suprcode/Crystal/graphs/contributors) to the [Crystal Source Code](https://github.com/Suprcode/Crystal).\
Thanks to [Jev](https://github.com/JevLOMCN) for maintaining the [Crystal Database Files](https://github.com/Suprcode/Crystal.Database).\
[Buy me a coffee](https://www.buymeacoffee.com/danraine)
