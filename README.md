# CrystalM2-Installer
[Download Pre-Compiled CrystalM2 Installer](https://github.com/meacher0/CrystalM2-Installer/releases)

# Overview
This N.S.I.S. Script was created in an attempt to ease the initial setup and configuration of the Crystal M2 Server and Client. Once compiled and executed, it should Download, Install and Configure the CrystalM2 files ready for use (with the exception of the Client which will download additional data when first opened following Installation). 

## Requirements
This script is compiled using the NullSoft Scriptable Install System software and as such, is required to compile this script yourself.\
The N.S.I.S. software is OpenSource and available to download at [SourceForge](https://nsis.sourceforge.io/Download) \
You can also download the pre-compiled binary of this installer from the [Releases section](https://github.com/meacher0/CrystalM2-Installer/releases) \
\
**Command Line Usage**
> makensis.exe [Script]

i.e.

> makensis.exe C:\downloads\CM2I.nsi

## Features
-Check/Install Pre-Requisite: dotNET 8.0 Runtime\
-Check/Install Pre-Requisite: Visual C++ 2013 Runtime\
-Download and Install CrystalM2 Server/Client\
-Download and Install CrystalM2 Database Files\
-Add Uninstall to Add/Remove Programs\
-Create desktop shortcuts\
-Randomly Generate GM Password\
-Configure Server to allow start\
-Set Server IP 0.0.0.0

## FAQ
Q: This seems complicated and I just want to play the game.\
A: Download the latest release from the [Releases section](https://github.com/meacher0/CrystalM2-Installer/releases), unzip and run the executable, profit.

Q: I get a "SmartScreen has blocked this application" Box pop-up.\
A: This happens if you don't compile the installer yourself, Click "More Info" and then "Run Anyway" to continue.

Q: I get this error when starting server "[DATE TIME]: Could not load Drop: HiGreatGhoul, Line 1/1RedDagger Q".\
A: This is a typo in the HiGreatGhoul Drop file, the error can be ignored or fixed by editing the drop file.

Q: I have forgotten the GM Password or didn't write down what the Installer generated.\
A: It can be located in "C:\Program Files\CrystalM2\Server\Configs\Setup.ini"

### Notes
Thanks to [Suprcode](https://github.com/Suprcode) and the [other contributors](https://github.com/Suprcode/Crystal/graphs/contributors) to the [Crystal Source Code](https://github.com/Suprcode/Crystal).\
Thanks to [Jev](https://github.com/JevLOMCN) for maintaining the [Crystal Database Files](https://github.com/Suprcode/Crystal.Database).\
