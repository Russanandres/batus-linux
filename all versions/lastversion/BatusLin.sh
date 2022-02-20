#!/bin/bash
date >> /tmp/BFL.sh_log.txt
echo новый запуск >> /tmp/BFL.sh_log.txt
VER="1.1 Bee0c"
VERMENU="2 Bdielog"
BACKTITLE="Batus For Linux.sh"
LINDSTR="undetected"
linx=Linux
int=/bin/batus
startuptime=$(date)

### инициализация функций
function pause(){ read -p "Нажмите ENTER для продолжения..."
}

echo инициализация функций успешна >> /tmp/BFL.sh_log.txt

### IF/ELSE инициализация
# OS X
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
 BACKTITLE="Batus For MacOS.sh"
 linx="MacOS"
 LINSTR="Mac OS X"
fi

UNVER=$(hostnamectl | grep System)
UNKERN=$(hostnamectl | grep Kernel)
UNARCH=$(hostnamectl | grep Architecture)

# детектим TWRP
if [ "$PWD" == "/sdcard" ]; then
 if [ "$EXTERNAL_STORAGE" == "/sdcard" ]; then
  if [ "$ANDROID_DATA" == "/data" ]; then
   if [ "$ANDROID_ROOT" == "/system" ]; then
    if [ "$LD_LIBRARY_PATH" == "/sbin" ]; then
     linx="TWRP"
     LINDSTR="Team Win Recovery"
     echo Наша ультрасупер программа обнаружила что вы запустили её в TWRP.\
          Скорее всего у вас нет необходимых библиотек для работы.\
          Для TWRP скачайте специальную версию BFR
    read -p "Вы хотите продолжить на свой страх и риска?[YyДд] " -n 1 -r
    if [[ $REPLY =~ ^[YyДд]$ ]]; then
    echo Ок. Продолжаем. Но мы вас предупреждали^_^
    pause
    fi
    fi
   fi
  fi
 fi
fi


# Ubnutu дткт
if [ "$GDMSESSION" == "ubuntu" ]; then
 if [ "$DESKTOP_SESSION" == "ubuntu" ]; then
 LINDSTR="ubuntu"
 kupi=true
 cost=6000RUB
 fi
fi

# Андрюха в термуксе
if [ "$SHELL" == "/data/data/com.termux/files/usr/bin/bash" ]; then
 LINDSTR="Android"
 linx="Android"
 BACKTITLE="Batus For Android.sh"
fi

# iPhone дткт
if [ "$HOME" == "/var/mobile" ]; then
 LINDSTR="iPhone"
 linx="iPhone"
 BACKTITLE="Batus For iPhone.sh"
    echo Наша ультрасупер программа обнаружила что вы запустили её на iPhone.\
          Скорее всего у вас нет необходимых библиотек для работы.\
          Для iPhone скачайте версию BFLS
    read -p "Вы хотите продолжить на свой страх и риска?[YyДд] " -n 1 -r
    if [[ $REPLY =~ ^[YyДд]$ ]]; then
    echo Ок. Продолжаем. Но мы вас предупреждали^_^
    pause
    fi
fi

# инициализация интеграции
if [ -f "$int" ]; then
 exist="установлен"
else
 exist="не установлен"
fi

# Аргументы запуска
if [ "$1" == "-v" ]; then
 echo $VER
 exit
elif [ "$1" == "--debug-mode" ]; then
clear
echo "__/\\\\\\\\\\\\\_______________________________________________________________        "
echo "__\/\\\/////////\\\_____________________________________________________________       "
echo "___\/\\\_______\/\\\______________________/\\\___________________________________      "
echo "____\/\\\\\\\\\\\\\\____/\\\\\\\\\______/\\\\\\\\\\\___/\\\____/\\\___/\\\\\\\\\\_     "
echo "_____\/\\\/////////\\\__\////////\\\____\////\\\////___\/\\\___\/\\\__\/\\\//////__    "
echo "______\/\\\_______\/\\\____/\\\\\\\\\\______\/\\\_______\/\\\___\/\\\__\/\\\\\\\\\\_   "
echo "_______\/\\\_______\/\\\___/\\\/////\\\______\/\\\_/\\___\/\\\___\/\\\__\////////\\\_  "
echo "________\/\\\\\\\\\\\\\/___\//\\\\\\\\/\\_____\//\\\\\____\//\\\\\\\\\____/\\\\\\\\\\_ "
echo "_________\/////////////______\////////\//_______\/////______\/////////____\//////////__"
clear
exit
elif [ "$1" == "--force-quit" ]; then
 clear
 echo Batus For Linux.sh $VER - 2020-2022. Russanandres
 date
 exit
elif [ "$1" == "--commands" ]; then
 echo [batus] список доступных команд:
 echo [batus] -v - выводит версию микропрограммы
 echo [batus] --force-quit - экстренно выходит из микропрограммы
 echo [batus] --install-needs - установка зависимостей через APT
 exit
elif [ "$1" == "--install-needs" ]; then
 echo установка зависимостей
 echo Выберите ваш менаджер пакетов:
 echo Внимание! Если скрипт всё-же не заработал, проверьте подключение к интернету или работу вашего п.м.
 OPTIONS="apt pacman idk пропустить выход"
 select opt in $OPTIONS; do
 if [ "$opt" == "apt" ]; then
 read -p "Вы уверенны?[YyДд] " -n 1 -r
  if [[ $REPLY =~ ^[YyДд]$ ]]; then
    sudo apt install dialog -y
    apt install sudo dialog -y
  fi
  break
 elif [ "$opt" == "pacman" ]; then
   if [[ $REPLY =~ ^[YyДд]$ ]]; then
    sudo pacman -Sy dialog -y
    pacman -Sy sudo dialog -y
   fi
   break
 elif [ "$opt" == "idk" ]; then
    sudo apt install dialog -y
    apt install sudo dialog -y
    sudo pacman -Sy dialog -y
    pacman -Sy sudo dialog -y
    break
 elif [ "$opt" == "пропустить" ]; then
 break
 elif [ "$opt" == "выход" ]; then
 clear & exit
 else echo такого пункта не существует
 fi
 done
elif [ "$@" != "--run" ]; then
 echo Такого аргумента не существует! Используйте --commands для просмотра доступных аргументов.
 echo Batus $VER
 exit
fi

echo инициализация аргументов успешна >> /tmp/BFL.sh_log.txt
### заставка
clear
echo ..........................................................
echo ..........................................................
echo ..................................................^_^.....
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
echo ...Batus.For.$linx.sh.....................................
echo ..........................................................
echo Проснитесь и пойте мистер $USER, проснитесь и пойте
echo
sleep 2
echo Заставка показана >> /tmp/BFL.sh_log.txt
while true; do
### следующая часть
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
             echo пользователь в VERMENU >> /tmp/BFL.sh_log.txt
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
             echo ...Batus.For.$linx.sh.....................................
             echo ..........................................................
             echo
             echo Версия - $VER
             echo Версия меню - $VERMENU
             echo
             echo Запущено с аргументом - $@
             echo
             uname -a
             echo
             pause
             break
            ;;
        2)  echo пользователь в отчистке >> /tmp/BFL.sh_log.txt
            echo Отчистка /tmp с root правами.
            read -p "Вы уверенны?[YyДд] " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo Введите пароль для полной отчистки:
             sudo rm -rf /tmp
             echo Отчищено
             clear
            fi
            break
            ;;
        3)            echo пользователь в запуске программ >> /tmp/BFL.sh_log.txt
                      cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Запуск программ" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Discord"
                               2 "Firefox"
                               3 "Steam"
                               4 "Nautilus"
                               5 "Spotify"
                               6 "Назад")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)discord
                                         ;;
                                    2)firefox
                                         ;;
                                    3)steam
                                         ;;
                                    4)nautilus
                                         ;;
                                    5)spotify
                                         ;;
                                    6)break
                                         ;;
                      esac
                      done
            ;;
        4)  echo пользователь в интернетменю >> /tmp/BFL.sh_log.txt
            clear
            echo проверяем ваш интернет...
            ping 8.8.8.8
            pause
            break
            ;;
        5)  echo пользователь в меню перезагрузки >> /tmp/BFL.sh_log.txt
            echo Перезагрузка компьютера
            read -p "Вы уверенны?[YyДд] " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo Введита пароль для перезагрузки:
             sudo reboot
            fi
            ;;
        6)            echo пользователь в обновлении по >> /tmp/BFL.sh_log.txt
                      cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Обновление системы apt" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "update"
                               2 "upgrate"
                               3 "оба"
                               4 "выйти")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)sudo apt update
                                         ;;
                                    2)sudo apt upgrade -y
                                         ;;
                                    3)sudo apt update && sudo apt upgrade -y
                                         ;;
                                    4)break
                                         ;;
                      esac
                      done
            ;;
        7)          echo пользователь в настройках >> /tmp/BFL.sh_log.txt
                    cmd=(dialog --clear --nocancel --backtitle "$BACKTITLE" --title "Настройки" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Выход"
                               2 "Не выход"
                               3 "Функции откладки")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)clear ; echo Batus For Linux.sh $VER - 2020-2022. Russanandres ; date ; exit 0
                                         ;;
                                    2)break
                                         ;;
                                    3)echo пользователь в DEBUGMENU!!!!!!! >> /tmp/BFL.sh_log.txt
                                        cmd=(dialog --clear --nocancel --backtitle "Debug" --title "Debug" --menu "Debug" 15 40 4)
                                        options=(1 "удалить логи"
                                                 2 "Показать логи"
                                                 3 "Принудительно создать логи"
                                                 4 "выйти с ошибкой"
                                                 5 "Показать инфо"
                                                 6 "Показать переменные"
                                                 7 "Интегрировать в систему"
                                                 8 "назад")
                                        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                        for choice in $choices
                                        do
                                        case $choice in
                                            1)read -p "Вы уверенны?[YyДд] " -n 1 -r
                                              if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                              rm -rf /tmp/BFL.sh_log.txt
                                              fi
                                                ;;
                                            2)cat /tmp/BFL.sh_log.txt ; pause
                                                ;;
                                            3)sudo echo фаил логов создан! >> /tmp/BFL.sh_log.txt
                                                ;;
                                            4)exit 255
                                                ;;
                                            5)clear
                                              echo ..........................................................
                                              echo ..........................................................
                                              echo ..........................................................
                                              echo ..//////////............//////////.......////......////...
                                              echo ..///////////...........//////////.......////......////...
                                              echo ..///....////...........////.............////......////...
                                              echo ..////...////...........////.............////......////...
                                              echo ../////////............./////////........////......////...
                                              echo ..////////////........../////////........////......////...
                                              echo ..///.....////..........////.............////......////...
                                              echo ..////....////..........////.............////......////...
                                              echo ..////////////..........////.............//////////////...
                                              echo ..//////////............////..............////////////....
                                              echo ..........................................................
                                              echo ...Batus.sh...............................................
                                              echo ..........................................................
                                              echo
                                              echo Версия - $VER
                                              echo Версия меню - $VERMENU
                                              echo
                                              uname -a
                                              echo
                                              echo Интегрирован - $exist
                                              echo Путь интеграции - $int
                                              echo Время запуска - $startuptime
                                              echo Desktop сессия - $DESKTOP_SESSION
                                              echo Терминал [OS X] - $TERM_PROGRAM
                                              echo Терминал [Othr] - $SHELL
                                              echo Версия терминала - $BASH_VERSION
                                              echo Аргументы запуска - $@
                                              echo Дистрибутив [вариант 1]- $LINDSTR
                                              echo Дистрибутив [вариант 2] - $UNVER
                                              echo Определённое семейство - $linx
                                              echo Ядро системы - $UNKERN
                                              echo Архитектура - $UNARCH
                                              echo Имя пользователя - $USER
                                              echo Домашняя директория - $HOME
                                              pause
                                                ;;
                                            6)clear & date & env & pause
                                                ;;
                                            7)cmd=(dialog --clear --nocancel --backtitle "Batus For Unix.sh" --title "Интеграция в систему" --menu "Состояние: $exist" 15 40 4)
                                              options=( 1 "Установить"
                                                        2 "Удалить"
                                                        3 "Переустановить"
                                                        4 "Назад")
                                              choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                              for choice in $choices
                                              do
                                              case $choice in
                                                1)echo Интеграция BatusLin в систему
                                                    echo ВАРНИНГ АТЕНТИОН!!!!!!! НЕ ДЕЛАЙТЕ ЕСЛИ ЖАЛКО СИСТЕМУ!!!!!!!
                                                    echo Для успешного копирования положите BatusLin.sh в корневую директорию текущего пользователя
                                                    read -p "Вы уверенны?[YyДд] " -n 1 -r
                                                    if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                                    echo Введите пароль для копирования:
                                                    sudo cp /home/$USER/BatusLin.sh /bin/batus
                                                    echo готово!
                                                    echo Используйте команду batus для запуска!
                                                    pause
                                                    clear
                                                    fi
                                                    ;;
                                                2)echo Вы действительно хотите удалить Batus из системы?
                                                  read -p "Вы уверенны?[YyДд] " -n 1 -r
                                                  if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                                  echo Введите пароль для удаления:
                                                  sudo rm -fv /bin/batus /bin/BatusLin.sh
                                                  fi
                                                  ;;
                                                3)echo Интеграция BatusLin в систему
                                                    echo ВАРНИНГ АТЕНТИОН!!!!!!! НЕ ДЕЛАЙТЕ ЕСЛИ ЖАЛКО СИСТЕМУ!!!!!!!
                                                    echo Для успешного копирования положите BatusLin.sh в корневую директорию текущего пользователя
                                                    read -p "Вы уверенны?[YyДд] " -n 1 -r
                                                    if [[ $REPLY =~ ^[YyДд]$ ]]; then
                                                    echo Введите пароль для копирования:
                                                    sudo rm -fv /bin/batus /bin/BatusLin.sh
                                                    sudo cp /home/$USER/BatusLin.sh /bin/batus
                                                    echo готово!
                                                    echo Используйте команду batus для запуска!
                                                    pause
                                                    clear
                                                    fi
                                                    ;;
                                                4)break;;
                                                esac
                                                done
                                                ;;
                                            8)break
                                                ;;
                                        esac
                                        done
                                        ;;
                      esac
                      done
            ;;
        8)  echo пользователь выходит >> /tmp/BFL.sh_log.txt
            clear
            echo Batus For $linx.sh $VER - 2020-2022. Russanandres
            date
            exit
            ;;
    esac
done
done
