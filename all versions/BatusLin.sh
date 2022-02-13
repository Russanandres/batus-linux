#!/usr/bin/bash
date >> /tmp/BFL.sh_log.txt
echo новый запуск >> /tmp/BFL.sh_log.txt
VER="1.0 Amonsus"
VERMENU="2 Bdielog"
BACKTITLE="Batus For Linux.sh"

# инициализация функций
function pause(){ read -p "Нажмите ENTER для продолжения..."
}

echo инициализация функций успешна >> /tmp/BFL.sh_log.txt
# просмотр файла настроек
source config.txt
echo инициализация настроек успешна >> /tmp/BFL.sh_log.txt
# просмотр и выполнение аргументов
if [ "$1" == "-v" ]; then
 echo $VER
 exit
elif [ "$1" == "--skip-logo" ]; then
 jumpto aftrlg
elif [ "$1" == "--force-quit" ]; then
 clear
 echo Batus For Linux.sh $VER - 2020-2022. Russanandres
 date
 exit
elif [ "$1" == "--commands" ]; then
 echo [batus] список доступных команд:
 echo [batus] -v - выводит версию микропрограммы
 echo [batus] --force-quit - экстренно выходит из микропрограммы
 echo [batus] --install-needs - установка зависимостей
 exit
elif [ "$1" == "--install-needs" ]; then
 echo установка нужных компанентов через apt
 read -p "Вы уверенны? " -n 1 -r
  if [[ $REPLY =~ ^[YyДд]$ ]]; then
    sudo apt install sudo dialog -y
  fi
fi

echo инициализация аргументов успешна >> /tmp/BFL.sh_log.txt
# заставка
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
echo ...Batus.For.Linux.sh...........................BETA......
echo ..........................................................
echo Проснитесь и пойте мистер $USER, проснитесь и пойте
echo
sleep 2
echo Заставка показана >> /tmp/BFL.sh_log.txt
while [ 1 == 1 ]; do
# следующая часть
clear
cmd=(dialog --clear --backtitle "$BACKTITLE" --title "Глобальное меню" --menu "Выберите одну опцию из списка ниже:" 15 40 4)

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
        1)
            clear
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
             echo ...Batus.For.Linux.sh...........................BETA......
             echo ..........................................................
             echo
             echo Версия - $VER
             echo Версия меню - $VERMENU
             echo
             uname -a
             echo
             pause
             break
            ;;
        2)
            echo пользователь в отчистке >> /tmp/BFL.sh_log.txt
            echo Отчистка /tmp с root правами.
            read -p "Вы уверенны? " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo Введите пароль для полной отчистки:
             sudo rm -rf /tmp
             echo Отчищено
             clear
            fi
            break
            ;;
        3)
                      echo пользователь в запуске программ >> /tmp/BFL.sh_log.txt
                      cmd=(dialog --clear --backtitle "$BACKTITLE" --title "Запуск программ" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
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
        4)
            echo пользователь в интернетменю >> /tmp/BFL.sh_log.txt
            clear
            echo проверяем ваш интернет...
            ping 8.8.8.8
            pause
            break
            ;;
        5)
            echo пользователь в меню перезагрузки >> /tmp/BFL.sh_log.txt
            echo Перезагрузка компьютера
            read -p "Вы уверенны? " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo Введита пароль для перезагрузки:
             sudo reboot
            fi
            ;;
        6)
                      echo пользователь в обновлении по >> /tmp/BFL.sh_log.txt
                      cmd=(dialog --clear --backtitle "$BACKTITLE" --title "Обновление системы" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
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
        7)
                    echo пользователь в настройках >> /tmp/BFL.sh_log.txt
                    cmd=(dialog --clear --backtitle "$BACKTITLE" --title "Настройки" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Выход"
                               2 "Не выход"
                               3 "DebugSet")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)clear ; echo Batus For Linux.sh $VER - 2020-2022. Russanandres ; date ; exit 0
                                         ;;
                                    2)break
                                         ;;
                                    3) echo пользователь в DEBUGMENU!!!!!!! >> /tmp/BFL.sh_log.txt
                                        cmd=(dialog --clear --backtitle "Debug" --title "Debug" --menu "Debug" 15 40 4)
                                        options=(1 "удалить логи"
                                                 2 "Показать логи"
                                                 3 "выйти с ошибкой"
                                                 4 "назад")
                                        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                        for choice in $choices
                                        do
                                        case $choice in
                                            1)rm -rf /tmp/BFL.sh_log.txt
                                                ;;
                                            2) cat /tmp/BFL.sh_log.txt ; pause ; break
                                                ;;
                                            3)exit 255
                                                ;;
                                            4)break
                                                ;;
                                        esac
                                        done
                                        ;;
                      esac
                      done
            ;;
        8)
            echo пользователь выходит >> /tmp/BFL.sh_log.txt
            clear
            echo Batus For Linux.sh $VER - 2020-2022. Russanandres
            date
            exit
            ;;
    esac

done
done
echo пользователь сделал невозможное >> /tmp/BFL.sh_log.txt
echo Ur find end of the script ^_^
clear
echo Batus For Linux.sh $VER - 2020-2022. Russanandres
date
exit 0
