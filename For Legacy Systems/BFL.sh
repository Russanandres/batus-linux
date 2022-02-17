#!/bin/bash
VER="1 BFLS"
VERMENU="Octa"
LINDSTR="undetected"
linx=Linux
startuptime=$(date)

# инициализация функций
function pause(){ read -p "Нажмите ENTER для выхода..."
}

### IF/ELSE инициализация
# OS X
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
 linx="MacOS"
 LINSTR="Mac OS X"
fi

UNVER=$(hostnamectl | grep System)
UNKERN=$(hostnamectl | grep Kernel)
UNARCH=$(hostnamectl | grep Architecture)

# Ubnutu дткт
if [ "$GDMSESSION" == "ubuntu" ]; then
 if [ "$DESKTOP_SESSION" == "ubuntu" ]; then
 LINDSTR="ubuntu"
 fi
fi

# детектим TWRP
if [ "$PWD" == "/sdcard" ]; then
 if [ "$EXTERNAL_STORAGE" == "/sdcard" ]; then
  if [ "$ANDROID_DATA" == "/data" ]; then
   if [ "$ANDROID_ROOT" == "/system" ]; then
    if [ "$LD_LIBRARY_PATH" == "/sbin" ]; then
     linx="TWRP"
     LINDSTR="Team Win Recovery"
    fi
   fi
  fi
 fi
fi

# Андрюха в термуксе
if [ "$SHELL" == "/data/data/com.termux/files/usr/bin/bash" ]; then
 LINDSTR="Android"
 linx="Android"
fi

# iPhone дткт
if [ "$HOME" == "/var/mobile" ]; then
 LINDSTR="iPhone"
 linx="iPhone"
fi

# Аргументы запуска
if [ "$1" == "-v" ]; then
 echo $VER
 exit
elif [ "$1" == "-h" ]; then
 echo Batus For Legacy systems.sh
 echo bash скрипт для организации команд
 echo
 echo Поддерживаемые устроиства:
 echo Все которые имеют bash, которые не имеют dialog. В числе них:
 echo iPhone , TWRP , Android shell [не termux] и др.
 echo В приоритете разработки версия на dialog
 echo
 echo для списка доступных команд запустите с аргументом --commands
 exit
elif [ "$1" == "--force-quit" ]; then
 clear
 echo Batus For Legacy systems.sh $VER - 2020-2022. Russanandres
 date
 exit
elif [ "$1" == "--commands" ]; then
 echo [batus] список доступных команд:
 echo [batus] -v - выводит версию микропрограммы
 echo [batus] -h - выводит справку о микропрограмме
 echo [batus] --force-quit - экстренно выходит из микропрограммы
 exit
fi

# заставка
clear
echo .................................................
echo .................................................
echo .................................................
echo ..//////////..........////.............///////...
echo ..///////////.........////............///////....
echo ..///....////.........////............////.......
echo ..////...////.........////............////.......
echo ..////////............////.............////......
echo ..////////////........////..............////.....
echo ..///.....////........////...............////....
echo ..////....////...//...////.......//.......////...
echo ..////////////..////..////////..////....//////...
echo ..//////////....////..////////..////...///////...
echo .................................................
echo ...Batus.Legacy.sh.....................BETA......
echo .................................................
echo Проснитесь и пойте мистер $USER, проснитесь и пойте
echo
sleep 2
# следующая часть
clear
date
echo
while true; do
 clear
 OPTIONS="версия перезагрузка настройки выход"
 clear
 select opt in $OPTIONS; do
           if [ "$opt" = "версия" ]; then
             clear
             echo .................................................
             echo .................................................
             echo .................................................
             echo ..//////////..........////.............///////...
             echo ..///////////.........////............///////....
             echo ..///....////.........////............////.......
             echo ..////...////.........////............////.......
             echo ..////////............////.............////......
             echo ..////////////........////..............////.....
             echo ..///.....////........////...............////....
             echo ..////....////...//...////.......//.......////...
             echo ..////////////..////..////////..////....//////...
             echo ..//////////....////..////////..////...///////...
             echo .................................................
             echo ...Batus.Legacy.sh.....................BETA......
             echo .................................................
             echo
             echo Версия - $VER
             echo Версия меню - $VERMENU
             echo
             uname -a
             echo
             pause
           elif [ "$opt" = "перезагрузка" ]; then
             echo Введита пароль для перезагрузки:
             read -p "Вы уверенны? " -n 1 -r
             if [[ $REPLY =~ ^[YyДд]$ ]]; then
             su
             reboot
             fi
           elif [ "$opt" = "настройки" ]; then
              clear
              OPTIONS="назад debug"
              select opt in $OPTIONS; do
                if [ "$opt" = "назад" ]; then
                break
                elif [ "$opt" = "debug" ]; then
                    clear
                    OPTIONS="выйти_с_ошибкой показать_переменные показать_инфо назад"
                    select opt in $OPTIONS; do
                        if [ "$opt" = "выйти_с_ошибкой" ]; then
                         exit 255
                        elif [ "$opt" = "показать_переменные" ]; then
                         clear & date & env & pause
                        elif [ "$opt" = "показать_инфо" ]; then
                            clear
                            echo ..........................................................
                            echo ..........................................................
                            echo ..........................................................
                            echo ..//////////............//////////.......////.............
                            echo ..///////////...........//////////.......////.............
                            echo ..///....////...........////.............////.............
                            echo ..////...////...........////.............////.............
                            echo ..////////............../////////........////.............
                            echo ..////////////........../////////........////.............
                            echo ..///.....////..........////.............////.............
                            echo ..////....////....//....////.......//....////.........//..
                            echo ..////////////...////...////......////.../////////...////.
                            echo ..//////////.....////...////......////.../////////...////.
                            echo ..........................................................
                            echo ...Batus.For.Debugging.sh.....................DEVELOP.....
                            echo ..........................................................
                            echo
                            echo Версия - $VER
                            echo Версия меню - $VERMENU
                            echo
                            uname -a
                            echo
                            echo Время запуска - $startuptime
                            echo Desktop сессия - $DESKTOP_SESSION
                            echo Терминал [OS X] - $TERM_PROGRAM
                            echo Терминал [Othr] - $SHELL
                            echo Версия терминала - $BASH_VERSION
                            echo Аргументы запуска - $@
                            echo Дистрибутив [вариант 1] - $LINDSTR
                            echo Дистрибутив [вариант 2] - $UNVER
                            echo Определённое семейство - $linx
                            echo Ядро системы - $UNKERN
                            echo Архитектура - $UNARCH
                            echo Имя пользователя - $USER
                            echo Домашняя директория - $HOME
                            pause
                        elif [ "$opt" = "назад" ]; then
                         break
                        fi
                    done
                fi
              done
           elif [ "$opt" = "выход" ]; then
             clear
             echo Batus For Legacy systems.sh $VER - 2020-2022. Russanandres
             date
             exit
            else
             echo это так не работает
           fi
 done
done
