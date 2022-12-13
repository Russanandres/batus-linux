# BatusLin.sh
this is the sh where the standard bash commands for *nix are collected in one place, something like a toolbox.

Russian only version now!

Описание на русском языке здесь: https://russanandres.github.io/batus-linux/

### Since version 1.1 batus for Android (Termux), Linux and Mac OS X have been merged into one file BatusLin.sh!

## How to choose the correct version?
Here is a small table:

![Here:](https://github.com/Russanandres/batus-linux/blob/gh-pages/MSpaint.png)

## Installing and running
[Download latest version](https://github.com/Russanandres/batus-linux/tree/main/all%20versions/lastversion) | [From GitHub releases](https://github.com/Russanandres/batus-linux/releases) | [If you havent dialog](https://github.com/Russanandres/batus-linux/tree/main/For%20Legacy%20Systems) | [Download LiveCD](https://github.com/Russanandres/batus-linux/tree/main/BatusLiveCD)

Before run check executing permissions.
Type in terminal:

$: ```sudo chmod +x BatusLin.sh```

$: ```./BatusLin.sh```

## WARNING MACOS X!!
Before running the script on macOS, write these 2 commands:

$: ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

$: ```brew install dialog```

They needs root permissions

All versions BatusMac.sh tested on Catalina on vmware! There may be bugs and glitches!

## Batus Live CD
This is the first version of the Live system, there will be many glitches and system instability. Due to incorrect settings, the first release version (1 Air) is without DE. But you can put it there if your Linux knowledge is high and you can decompile .squashfs. BLS (BatusLiveCD, not to be confused with BFLS) has built-in additional applications such as adb, fastboot, etc., as well as all the necessary files for BFL to work. To update BFL, use the built-in tools in the script (Make sure you have a stable connection!). The BLS update will be added by script in the next versions. BLS will be supported on amd64 and i686. UEFI operation has not been tested! About ARM is not known. Many thanks to [Oros42 for the CustomDebian script](https://github.com/Oros42/CustomDebian).

## Editing
i wrote all the code in kate.

The source code is clearly open source

## Other OS than linux
Android - batus in Android works with Termux. Use Linux versions. Install dialog before starting!

Android recovery - Works good. Use BFR.zip in all verisons.

WearOS - Works good in Termux. Use Linux versions. Install dialog before starting!

Mac OS X - Works good. Tested on OS X Catalina. Read warning! Use Linux versions.

BSD - Works perfect. Use Linux versions.

PocketBook - Works good, but need special release. Use bfpb

WM5/6 - I just can't transfer batus to my Eten lol. Most likely the [version under windows](https://github.com/Russanandres/batus) will earn.

PSVita/XMB - I couldn't find a terminal. BFLS will be supported if there is a bash port.

PS2/PS3 - Yes in OtherOS. Use any port.

WSL2 - Works good. Use Linux versions. Install dialog before starting!

SailfishOS - Works good. Use BFLS versions.

Maemo 5 - Works good. Use BFLS versions.

Ubuntu touch - Works good. Use BFLS versions.

ChromeOS/ChromiumOS - I have no way to check the work, but I think it will start.

ios/ipadOS and etc - NEEDS JAILBREAK!!! There is no support due to the lack of dialog. Tested on iPhone 4s ios 6.1.3. Older versions without dialog work well with jailbreak. Perhaps versions with dialog work, but I don't know how to put it in the system. Use special releases in the "For Legacy Systems" directory.

OS/2 - You can run in theory, but this has not been tested.

Symbian S60 9.3 - It is possible to launch only if the phone has a touch screen. I have nokia without it(

*-DOS and etc legacy systems older than 2005 idk - there is no way to run.

### Other systems will be tested.

## RoadMap
- [x] Update linux version.
- [x] Make kdialog linux version
- [ ] Make touch version
- [x] Batus works on Android in Termux
- [ ] Make Android native version
- [ ] Port dialog to BFR.zip
- [x] Make Debian LiveCD with batusLin.sh and android-platform-tools
- [ ] Make Batus Recovery Project 
- [x] Make MacOS x86 verison (or port linux ver)
- [ ] All tasks completed :tada:

## Windows verisons
[All windows versions here](https://github.com/Russanandres/batus)
