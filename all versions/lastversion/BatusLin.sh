#!/bin/bash
VER="1.3 Dddk"
VERu="13" #так же как и Ver но без .
gitVER=batus13 # последняя гит версия
VERMENU="2"
BACKTITLE="Batus For Linux.sh"
LINDSTR="undetected"
install="dialog adb android-libadb"
linx=Linux
int="/usr/bin/batus"
startuptime=$(date)

### инициализация функций
function pause(){ read -p "Нажмите ENTER для продолжения..."
}
function exitscr(){ clear ; echo "Batus For Linux.sh $VER - 2020-2023. Russanandres" ; date ; exit 0
}

rm -f /tmp/BFLupdatertmp.sh
if [ -f "$int" ]; then exist="установлен"
else exist="не установлен"
fi
if [ "$1" == "-v" ]; then
 echo $VER
 exit
elif [ "$1" == "--force-quit" ] || [ "$1" == "-fq" ]; then exitscr
elif [ "$1" == "--commands" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
 echo "[batus] список доступных команд:"
 echo "[batus] -v - выводит версию микропрограммы"
 echo "[batus] --force-quit - экстренно выходит из микропрограммы"
 echo "[batus] --install-needs - установка зависимостей через APT"
 exit
elif [ "$1" == "--install-needs" ] || [ "$1" == "-ia" ]; then
 echo "Установка зависимостей"
 echo "Выберите ваш менаджер пакетов:"
 echo "Внимание! Если скрипт всё-же не заработал, проверьте подключение к интернету или работу вашего п.м."
  OPTIONS="apt pacman idk пропустить выход"
  select opt in $OPTIONS; do
   if [ "$opt" == "apt" ]; then
    read -p "Вы уверенны?[YyДд] " -n 1 -r
   if [[ $REPLY =~ ^[YyДд]$ ]]; then
    sudo apt install $install -y
    apt install sudo $install -y
   fi
    break
   elif [ "$opt" == "pacman" ]; then
    if [[ $REPLY =~ ^[YyДд]$ ]]; then
     sudo pacman -Sy $install -y
     pacman -Sy sudo $install -y
    fi
     break
  elif [ "$opt" == "idk" ]; then
    sudo apt install $install -y
    apt install sudo $install -y
    sudo pacman -Sy $install -y
    pacman -Sy sudo $install -y
    break
  elif [ "$opt" == "пропустить" ]; then
   break
  elif [ "$opt" == "выход" ]; then
   clear & exit
  else echo "Такого пункта не существует!"
  fi
  done
elif [ "$@" != "--run" ]; then
 echo "Такого аргумента не существует! Используйте --commands для просмотра доступных аргументов."
 echo "Batus $VER"
 exit
fi

clear
echo "
..........................................................
..........................................................
..................................................^_^.....
..//////////............//////////.......////.............
..///////////...........//////////.......////.............
..///....////...........////.............////.............
..////...////...........////.............////.............
..////////............../////////........////.............
..////////////........../////////........////.............
..///.....////..........////.............////.............
..////....////....//....////.......//....////.........//..
..////////////...////...////......////.../////////...////.
..//////////.....////...////......////.../////////...////.
..........................................................
...Batus.For.$linx.sh.....................................
.........................................................."
echo "Проснитесь и пойте мистер $USER, проснитесь и пойте"
echo
sleep 2
while true; do
clear
cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Глобальное меню" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
options=(1 "Версия скрипта"
         2 "Отчистка"
         3 "Запуск"
         4 "Интернет"
         5 "Перезагрузка"
         6 "Обновление"
         7 "Настройки"
         8 "Выход")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)   clear
             echo "
..........................................................
..........................................................
..........................................................
..//////////............//////////.......////.............
..///////////...........//////////.......////.............
..///....////...........////.............////.............
..////...////...........////.............////.............
..////////............../////////........////.............
..////////////........../////////........////.............
..///.....////..........////.............////.............
..////....////....//....////.......//....////.........//..
..////////////...////...////......////.../////////...////.
..//////////.....////...////......////.../////////...////.
..........................................................
...Batus.For.$linx.sh.....................................
.........................................................."
             echo
             echo "Версия - $VER"
             echo "Версия меню - $VERMENU"
             echo
             echo "Запущено с аргументом - $@"
             echo
             uname -a
             echo
             pause
             break;;
        2)  echo "Отчистка /tmp с root правами."
            read -p "Вы уверенны?[YyДд] " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo "Введите пароль для полной отчистки:"
             sudo rm -rf /tmp
             echo "Отчищено"
             clear
            fi
            break;;
        3)            cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Запуск программ" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Discord"
                               2 "Firefox"
                               3 "Steam"
                               4 "Nautilus"
                               5 "Назад")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)discord;;
                                    2)firefox;;
                                    3)steam;;
                                    4)nautilus;;
                                    6)break;;
                      esac
                      done;;
        4)  clear
            echo "Проверяем ваш интернет..."
            ping 8.8.8.8
            pause
            break;;
        5)  echo "Перезагрузка компьютера"
            if [ "$LINDSTR" == "Android" ]; then
             echo "Подтвердите права суперпользователя если вы этого не делали раньше"
             sleep 3
             su
             reboot
            fi
            read -p "Вы уверенны?[YyДд] " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo "Введита пароль для перезагрузки:"
             sudo reboot
            fi;;
        6)            cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Обновление системы apt" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Обновление скрипта"
                               2 "Установка доп DE"
                               2 "update"
                               3 "upgrate"
                               4 "оба"
                               5 "выйти")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)clear
                                      OPTIONS="Проверить_обновления обновить_принудительно удалить_обновления назад"
                                      select opt in $OPTIONS; do
                                      if [ "$opt" = "Проверить_обновления" ]; then
                                       wget --no-verbose https://raw.githubusercontent.com/Russanandres/batus-linux/main/lastversion >> /dev/null
                                       lastversion=$(cat lastversion)
                                       rm -f lastversion
                                        if [ "$VERu" == "$lastversion" ]; then
                                         echo "Ваш скрипт последней версии. Обновление не требуется."
                                        elif [ "$lastversion" -gt "$VERu" ]; then
                                         echo "Ваша версия устарела! Обновитесь через кнопку принудительного обновления"
                                         pause
                                         break
                                        elif [ "$lastversion" -lt "$VERu" ]; then
                                         echo "Ваша версия была отозванна или было вмешательство в код. Пожалуйста создайте проблему на github."
                                         pause
                                         break
                                        fi
                                       elif [ "$opt" = "обновить_принудительно" ]; then
                                        rm -fv Batus.sh
                                        wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/Batus.sh #получаем новую версию
                                        pwd=$(pwd) #сохраняем путь
                                        sudo echo "cd $pwd & sudo chmod +x $pwd/Batus.sh & bash $pwd/Batus.sh" > /tmp/BFLupdatertmp.sh
                                        sudo chmod +x /tmp/BFLupdatertmp.sh #даём права на запуск
                                        cd /tmp/
                                        sudo sh /tmp/BFLupdatertmp.sh
                                        exit
                                       elif [ "$opt" = "удалить_обновления" ]; then
                                        rm -fv /tmp/BFLupdatertmp.sh Batus.sh
                                       elif [ "$opt" = "назад" ]; then
                                        break
                                       fi
                                       done;;
                                    2)cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Установка DE" --menu "Установка окружений рабочего стола" 15 40 4)
                                                    options=(   1 "Gnome"
                                                                2 "KDE Plasma"
                                                                3 "MATE"
                                                                4 "XFCE"
                                                                5 "LXQT"
                                                                6 "LXDE"
                                                                7 "Cinnamon"
                                                                8 "Deepin"
                                                                9 "Trinity"
                                                                10 "Phosh"
                                                                11 "Разлогин"
                                                                12 "Назад")
                                                    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                                    for choice in $choices
                                                    do
                                                    case $choice in
                                                        1) sudo apt install ubuntu-desktop;;
                                                        2) sudo apt install kubuntu-desktop;;
                                                        3) sudo apt install ubuntu-mate-desktop;;
                                                        4) sudo apt install xubuntu-desktop;;
                                                        5) sudo apt install lxqt;;
                                                        6) sudo apt install lxde;;
                                                        7) sudo apt install cinnamon-desktop-environment;;
                                                        8) sudo add-apt-repository ppa:openarun/dde-dev. & sudo apt install ubuntudde-*;;
                                                        9)  echo "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trinity.list
                                                            echo "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trinity-builddeps.list
                                                            sudo apt-key adv --keyserver keyserver.quickbuild.pearsoncomputing.net --recv-keys F5CFC95C
                                                            sudo apt-get update
                                                            sudo apt-get install kubuntu-default-settings-trinity kubuntu-desktop-trinity;;
                                                        10) sudo apt install phosh;;
                                                        11) sudo /usr/bin/gnome-session-save --logout;;
                                                        12)break;;
                                                    esac
                                                    done;;
                                    3)sudo apt update;;
                                    4)sudo apt upgrade -y;;
                                    5)sudo apt update && sudo apt upgrade -y;;
                                    6)break;;
                      esac
                      done;;
        7)          cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Настройки" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Выход"
                               2 "Не выход"
                               3 "Интеграция в систему"
                               4 "Функции откладки")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)exitscr;;
                                    2)break;;
                                    3)cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Интеграция в систему" --menu "Состояние: $exist" 15 40 4)
                                              options=( 1 "Установить"
                                                        2 "Удалить"
                                                        3 "Переустановить"
                                                        4 "Назад")
                                              choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                              for choice in $choices
                                              do
                                              case $choice in
                                                1)#cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Интеграция в систему" --yesno "продолжить?" 40 40)
                                                    pause
                                                    echo "Введите пароль для продолжения:"
                                                    sudo cp ./$0 /bin/batus
                                                    echo "Готово!"
                                                    echo "Используйте команду batus для запуска!"
                                                    pause
                                                    clear
                                                    ;;
                                                2)echo "Вы действительно хотите удалить Batus из системы?"
                                                  read -p "Вы уверенны?[YyДд] " -n 1 -r
                                                  if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                                  echo "Введите пароль для удаления:"
                                                  sudo rm -fv /bin/batus /bin/BatusLin.sh
                                                  fi;;
                                                3)echo "Интеграция BatusLin в систему"
                                                    read -p "Вы уверенны?[YyДд] " -n 1 -r
                                                    if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                                    echo "Введите пароль для копирования:"
                                                    sudo rm -fv /bin/batus /bin/BatusLin.sh
                                                    sudo cp ./$0 /bin/batus
                                                    echo "готово!"
                                                    echo "Используйте команду batus для запуска!"
                                                    pause
                                                    clear
                                                    fi;;
                                                4)break;;
                                                esac
                                                done;;
                                    4)  cmd=(dialog --clear --nocancel --backtitle "Debug" --title "Debug" --menu "Debug" 15 40 4)
                                        options=(1 "выйти с ошибкой"
                                                 2 "Показать инфо"
                                                 3 "Показать переменные"
                                                 4 "назад")
                                        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                        for choice in $choices
                                        do
                                        case $choice in
                                            1)exit 255;;
                                            2)clear
                                              echo "
..................................................
..................................................
..................................................
..//////////.......//////////....////......////...
..///////////......//////////....////......////...
..///....////......////..........////......////...
..////...////......////..........////......////...
../////////......../////////.....////......////...
..////////////...../////////.....////......////...
..///.....////.....////..........////......////...
..////....////.....////..........////......////...
..////////////.....////..........//////////////...
..//////////.......////...........////////////....
..................................................
...Batus.sh.......................................
.................................................."
                                              echo
                                              echo "Версия - $VER"
                                              echo "Версия меню - $VERMENU"
                                              echo
                                              uname -a
                                              echo
                                              echo "Интегрирован - $exist"
                                              echo "Путь интеграции - $int"
                                              echo "Время запуска - $startuptime"
                                              echo "Desktop сессия - $DESKTOP_SESSION"
                                              echo "Терминал [OS X] - $TERM_PROGRAM"
                                              echo "Терминал [Othr] - $SHELL"
                                              echo "Версия терминала - $BASH_VERSION"
                                              echo "Аргументы запуска - $@"
                                              echo "Определённое семейство - $linx"
                                              echo "Имя пользователя - $USER"
                                              echo "Название скрипта - $0"
                                              echo "Whoami - $(whoami)"
                                              echo "Домашняя директория - $HOME"
                                              pause;;
                                            3)clear & date & env & pause;;
                                            4)break;;
                                        esac
                                        done;;
                      esac
                      done;;
        8)exitscr;;
    esac
done
done
#Russanandres with Fox ^_^
