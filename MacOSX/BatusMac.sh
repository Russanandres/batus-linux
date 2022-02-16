#!/bin/bash
VER="1.0 Amonsus"
VERMENU="2 Bdielog"
BACKTITLE="Batus For MacOS.sh"

# инициализация функций
function pause(){ read -p "Нажмите ENTER для продолжения..."
}

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
echo ...Batus.For.MacOS.sh...........................BETA......
echo ..........................................................
echo Проснитесь и пойте мистер $USER, проснитесь и пойте
echo
sleep 2
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
             echo ...Batus.For.MacOS.sh...........................BETA......
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
            clear
            echo проверяем ваш интернет...
            ping 8.8.8.8
            pause
            break
            ;;
        5)
            echo Перезагрузка компьютера
            read -p "Вы уверенны? " -n 1 -r
            if [[ $REPLY =~ ^[YyДд]$ ]]; then
             echo Введита пароль для перезагрузки:
             sudo reboot
            fi
            ;;
        6)
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
                    cmd=(dialog --clear --backtitle "$BACKTITLE" --title "Настройки" --menu "Выберите одну опцию из списка ниже:" 15 40 4)
                      options=(1 "Выход"
                               2 "Не выход"
                               3 "DebugSet")
                      choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                      for choice in $choices
                      do
                      case $choice in
                                    1)clear ; echo Batus For MacOS.sh $VER - 2020-2022. Russanandres ; date ; exit 0
                                         ;;
                                    2)break
                                         ;;
									3) 
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
                                            2)cat /tmp/BFL.sh_log.txt ; pause ; break
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
            clear
            echo Batus For MacOS.sh $VER - 2020-2022. Russanandres
            date
            exit
            ;;
    esac

done
done
echo Ur find end of the script ^_^
clear
echo Batus For MacOS.sh $VER - 2020-2022. Russanandres
date
exit 0
