#!/bin/bash
date >> /tmp/KKBFL.sh_log.txt
echo новый запуск >> /tmp/KKBFL.sh_log.txt
VER="12 Axer"
VERu="12"
gitVER=Kbatus12 # последняя гит версия
VERMENU="1KMenu"
LINDSTR="undetected"
install="kdialog dialog ncal"
linx=Linux
int=/bin/kbatus
startuptime=$(date)

### инициализация функций
function pause(){ read -p "Нажмите ENTER для продолжения..."
}
function exitscr(){
 unset rootpass
 clear
 echo KBatus For $linx.sh $VER - 2020-2022. Russanandres
 date
 exit
}
### инициализация интеграции
if [ -f "$int" ]; then
 exist="установлен"
else
 exist="не установлен"
fi

### просмотр и выполнение аргументов
UNVER=$(hostnamectl | grep System)
UNKERN=$(hostnamectl | grep Kernel)
UNARCH=$(hostnamectl | grep Architecture)

if [ "$1" == "-v" ]; then
 echo $VER
 exit
elif [ "$1" == "--debug" ]; then
 debugmode=1
elif [ "$1" == "-de" ]; then
 password=`kdialog --title "batus" --password "чё за пароль"`
 passwordd=$(echo $password | base64)
  if [ "$passwordd" == "YmF0dXMK" ]; then
    dbusRef=`kdialog --progressbar "Инициализация" 4`
    qdbus $dbusRef Set "" value 1
    qdbus $dbusRef setLabelText "Чё этр"
    sleep 2
    qdbus $dbusRef Set "" value 2
    sleep 2
    qdbus $dbusRef setLabelText "Ладно"
    qdbus $dbusRef Set "" value 3
    sleep 2
    qdbus $dbusRef Set "" value 4
    sleep 2
    qdbus $dbusRef close
   exit
  fi
elif [ "$1" == "--force-quit" ] || [ "$1" == "-fq" ]; then
 exitscr
elif [ "$1" == "--commands" ] || [ "$1" == "-h" ]; then
 echo [batus] список доступных команд:
 echo [batus] -v - выводит версию микропрограммы
 echo [batus] --force-quit [-fq] - экстренно выходит из микропрограммы
 echo [batus] --install-needs [-ian] - установка зависимостей через APT
 exit
elif [ "$1" == "--root-password" ] || [ "$1" == "--ins-root-pass" ]; then
 rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
 echo пароль сохранён в переменной
elif [ "$1" == "--install-needs" ] || [ "$1" == "-ian" ]; then #install all needs
 echo установка зависимостей
 echo Выберите ваш менаджер пакетов:
 echo Внимание! Если скрипт всё-же не заработал, проверьте подключение к интернету или работу вашего п.м.
  OPTIONS="apt pacman idk пропустить выход"
  select opt in $OPTIONS; do
   if [ "$opt" == "apt" ]; then
    apt install $install -y
    apt install sudo $install -y
    break
   elif [ "$opt" == "pacman" ]; then
     sudo pacman -Sy $install
     pacman -Sy sudo $install
     break
  elif [ "$opt" == "idk" ]; then
    sudo pacman -Sy $install
    apt install sudo $install -y
    sudo pacman -Sy $install
    pacman -Sy sudo $install
    break
  elif [ "$opt" == "пропустить" ]; then
   break
  elif [ "$opt" == "выход" ]; then
   exitscr
  else echo такого пункта не существует
  fi
  done
elif [ "$@" != "--run" ]; then
 echo Такого аргумента не существует! Используйте --commands для просмотра доступных аргументов.
 echo Batus $VER
 exit
fi

while true; do
menu=`kdialog --title "Главное меню" --menu Выберите: 0 "$(date)" 1 "Версия" 2 "Отчистка" 3 "Запуск" 4 "Перезагрузка" 5 "Обновление" 6 "Настройки" 7 "Выход"`
echo $menu
if [ "$menu" == "0" ]; then
 echo $(date)
 cal -A 2
 kdialog --title "Дата и время" --msgbox "$(date)\n$(cal)"
elif [ "$menu" == "1" ]; then
 echo пользователь в VERMENU >> /tmp/KBFL.sh_log.txt
 echo ..........................................................
 echo ..........................................................
 echo ..................................................BAT.....
 echo ..BATUSBATUS............BATUSBATUS.......KBFL.............
 echo ..BATUSBATUSB...........BATUSBATUS.......KBFL.............
 echo ..BAT....USBA...........BATU.............KBFL.............
 echo ..BATU...SBAT...........BATU.............KBFL.............
 echo ..BATUSBAT..............BATUSBATU........KBFL.............
 echo ..BATUSBATUSBA..........BATUSBATU........KBFL.............
 echo ..BAT.....USBA..........KBFL.............KBFL.............
 echo ..BATU....SBAT....BA....KBFL.......BA....KBFL.........BA..
 echo ..BATUSBATUSBA...KBFL...KBFL......KBFL...BATUSBATU...KBFL.
 echo ..BATUSBATUS.....KBFL...KBFL......KBFL...BATUSBATU...KBFL.
 echo ..........................................................
 echo ...KBatus.For.$linx.sh....................................
 kdialog --title "О микропрограмме:" --msgbox "
^_^
Версия - $VER
Версия меню - $VERMENU
Запущено с аргументом - $@
Огромное спасибо:
Компания KDE за KDialog и Kate
GitHub за хранилище версий
и тебе за пользование программой ^_^
Сделано Russanandres 2020-2022
"

elif [ "$menu" == "2" ]; then
 kdialog --yesnocancel 'Выполнить отчистку /tmp?\nЭто может повредить текущую сессию!' --cancel-label 'Без root прав' --title 'ВНИМАНИЕ!!!'
 case $? in
 0) rm -rf /tmp ;;
 1) echo batus systems ;;
 2) rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"` & echo $rootpass | sudo -S rm -rf /tmp;;
 esac
elif [ "$menu" == "3" ]; then
 runmenu=`kdialog --title "Запуск программ" --menu Меню 1 "discord" 2 "firefox" 3 "steam" 4 "nautilus" 5 "sudo nautilus" 6 "spotify" 7 "Android Platform Tools" 8 "выход"`
  if [ "$runmenu" == "1" ]; then
   discord
  elif [ "$runmenu" == "2" ]; then
   firefox
  elif [ "$runmenu" == "3" ]; then
   steam
  elif [ "$runmenu" == "4" ]; then
   nautilus
  elif [ "$runmenu" == "5" ]; then
   rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
   echo $rootpass | sudo -S nautilus
  elif [ "$runmenu" == "6" ]; then
   spotify
  elif [ "$runmenu" == "7" ]; then
   adbmenu=1
   while [ "$adbmenu" == "1" ]; do
       adf=`kdialog --title "Adnroid Tools" --combobox "Выберите программу:" "Android Debug Bridge" "FastBoot" "Помощь" "Назад"`
     if [ "$adf" == "Android Debug Bridge" ]; then
      adb=`kdialog --title "A.D.B." --combobox "Выберите:" "Devices" "Подключение по IP" "Sideload" "Push" "Pull" "Install" "Reboot" "Shell" "Своя команда" "Назад"`
       if [ "$adb" == "Devices" ]; then
        kdialog --title "ADB tools" --msgbox "$(adb devices)"
       elif [ "$adb" == "Подключение по IP" ]; then
        ip=`kdialog --title "IP подключение" --inputbox "Введите IP адрес для подключения:" "127.0.0.1:5555"`
        adb connect $ip
       elif [ "$adb" == "Sideload" ]; then
        zip=`kdialog --getopenfilename /home/$USER/ 'ZIP архивы (*.zip)'`
        adb sideload $zip
       elif [ "$adb" == "Push" ]; then
        kdialog --title "Push file" --msgbox "Выберите фаил для передачи:"
        pusf=`kdialog --getopenfilename /home/$USER/`
        pus=`kdialog --title "Push file" --inputbox "Введите путь передачи:" "/sdcard/Dowload"`
        adb push $pusf $pus
       elif [ "$adb" == "Pull" ]; then
        pul=`kdialog --title "Pull file" --inputbox "Введите путь файла НА ТЕЛЕФОНЕ:" "/sdcard/Dowload/myapk.apk"`
        kdialog --title "Pull file" --msgbox "Выберите папку для сохранения фала на пк:"
        sd=`kdialog --getexistingdirectory .`
        adb pull $pul $sd
       elif [ "$adb" == "Install" ]; then
        app=`kdialog --getopenfilename /home/$USER/ 'APK приложения (*.apk)'`
        adb install $app
       elif [ "$adb" == "Reboot" ]; then
        reb=`kdialog --title "Перезагрузка" --inputbox "Куда вы хотите перезагрузится?"`
        adb reboot $reboot
       elif [ "$adb" == "Shell" ]; then
        adb shell
       elif [ "$adb" == "Своя команда" ]; then
        adc1=`kdialog --title "ADB custom" --inputbox "Напишите первый аргумент:"`
        adc2=`kdialog --title "ADB custom" --inputbox "Напишите второй аргумент:"`
        adc3=`kdialog --title "ADB custom" --inputbox "Напишите третий аргумент:"`
        adb $adc1 $adc2 $adc3
       elif [ "$adb" == "Назад" ]; then
       adbmenu=0
       else echo Batus systems
       fi
     elif [ "$adf" == "FastBoot" ]; then
      fsb=`kdialog --title "Fastboot" --combobox "Выберите:" "Devices" "Flash" "Boot" "Reboot" "Своя команда" "Назад"`
       if [ "$fsb" == "Devices" ]; then
           kdialog --title "Fastboot" --msgbox "$(fastboot devices)"
       elif [ "$fsb" == "Flash" ]; then
        dsk=`kdialog --title "Прошивка" --inputbox "В какой раздел вы хотите прошить?"`
        fil=`kdialog --getopenfilename /home/$USER/ 'IMG архивы(*.img)'`
        fastboot flash $dsk $fil
       elif [ "$fsb" == "Boot" ]; then
        bot=`kdialog --getopenfilename /home/$USER/ 'IMG архивы(*.img)'`
        fastboot boot $bot
       elif [ "$fsb" == "Reboot" ]; then
        reb=`kdialog --title "Перезагрузка" --inputbox "Куда вы хотите перезагрузится?"`
        fastboot reboot $reboot
       elif [ "$fsb" == "Своя команда" ]; then
        fac1=`kdialog --title "ADB custom" --inputbox "Напишите первый аргумент:"`
        fac2=`kdialog --title "ADB custom" --inputbox "Напишите второй аргумент:"`
        fac3=`kdialog --title "ADB custom" --inputbox "Напишите третий аргумент:"`
        fastboot $fac1 $fac2 $fac3
       elif [ "$fsb" == "Назад" ]; then
        adbmenu=0
       else echo Batus systems
       fi
    elif [ "$adf" == "Помощь" ]; then
     kdialog --title "Fastboot" --msgbox "Помощь по adb: https://clck.ru/dQqPU\nПомощь по Fastboot: https://clck.ru/dQqxo"
    else adbmenu=0
    fi
    done
  elif [ "$runmenu" == "8" ]; then
  echo batus systems
  fi
elif [ "$menu" == "4" ]; then
 kdialog --yesnocancel 'Выполнить перезапуск?\nНесохранённые данные потеряются!' --cancel-label 'Без root прав' --title 'ВНИМАНИЕ!!!'
 case $? in
 0) reboot ;;
 1) echo batus systems ;;
 2) rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"` & echo $rootpass | sudo -S reboot;;
 esac
elif [ "$menu" == "5" ]; then
 updmenu=`kdialog --title "Обновление" --menu Меню 1 "Обновление скрипта" 2 "Установка доп DE" 3 "update" 4 "upgrate" 5 "оба" 6 "выход"`
  if [ "$updmenu" == "1" ]; then
   kdialog --title "Обновление" --msgbox "Посмотри в консоль"
   clear
   OPTIONS="Проверить_обновления обновить_принудительно удалить_обновления назад"
   select opt in $OPTIONS; do
    if [ "$opt" = "Проверить_обновления" ]; then
     dbusRef=`kdialog --progressbar "Инициализация" 4`
     qdbus $dbusRef Set "" value 1
     qdbus $dbusRef setLabelText "Проверяем обновления..."
     wget --no-verbose https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/klastversion >> /dev/null
     qdbus $dbusRef Set "" value 3
     lastversion=$(cat klastversion)
     rm -f klastversion
     qdbus $dbusRef Set "" value 4
      if [ "$VERu" == "$lastversion" ]; then
       kdialog --title "Обновление" --msgbox "Обновление не требуется\n:)"
       qdbus $dbusRef close
      elif [ "$lastversion" -gt "$VERu" ]; then
       kdialog --title "Обновление" --msgbox "Ваша версия устарела!\nОбновитесь через кнопку принудительного обновления"
       pause
       qdbus $dbusRef close
       break
      elif [ "$lastversion" -lt "$VERu" ]; then
       kdialog --title "Обновление" --msgbox "У вас слишком новая версия?\nПожалуйста создайте проблему на github."
       pause
       qdbus $dbusRef close
       break
      fi
     elif [ "$opt" = "обновить_принудительно" ]; then
      rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
      dbusRef=`kdialog --progressbar "Инициализация" 4`
      qdbus $dbusRef Set "" value 1
      qdbus $dbusRef setLabelText "Обновляем вашу версию"
      rm -fv $gitVER.sh
      wget https://raw.githubusercontent.com/Russanandres/batus-linux/main/all%20versions/lastversion/$gitVER.sh #получаем новую версию
      sleep 2
      pwd=$(pwd) #сохраняем путь
      qdbus $dbusRef Set "" value 2
      echo $rootpass | sudo -S echo "cd $pwd & sudo chmod +x $pwd/$gitVER.sh & bash $pwd/$gitVER.sh" > /tmp/KBFLupdatertmp.sh
      echo $rootpass | sudo -S  chmod +x /tmp/KBFLupdatertmp.sh #даём права на запуск
      qdbus $dbusRef Set "" value 3
      cd /tmp/
      echo $rootpass | sudo -S  sh /tmp/KBFLupdatertmp.sh
      BFLupdatertmp.sh
      qdbus $dbusRef Set "" value 4
      sleep 2
      qdbus $dbusRef close
      exitscr #выходим
      #пиздец
     elif [ "$opt" = "удалить_обновления" ]; then
      rm -fv /tmp/BFLupdatertmp.sh $gitVER.sh
     elif [ "$opt" = "назад" ]; then
      clear
      break
    fi
   done
  elif [ "$updmenu" == "2" ]; then
    echo batus systems
  elif [ "$updmenu" == "3" ]; then
  rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
   echo $rootpass | sudo -S apt update
  elif [ "$updmenu" == "4" ]; then
  rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
   echo $rootpass | sudo -S apt upgrade -y
  elif [ "$updmenu" == "5" ]; then
  rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
   echo $rootpass | sudo -S apt update && sudo apt upgrade -y
  elif [ "$updmenu" == "6" ]; then
  echo batus systems
  fi
elif [ "$menu" == "6" ]; then
 setmenu=`kdialog --title "Настройки" --menu "Настройки разные да" 1 "Назад" 2 "Выход" 3 "Установка зависимостей" 4 "Интеграция в систему" 5 "Функции откладки"`
  if [ "$setmenu" == "1" ]; then
   echo batus sustems
  elif [ "$setmenu" == "2" ]; then
    clear & echo KBatus For $linx.sh $VER - 2020-2022. Russanandres & date & exit
  elif [ "$setmenu" == "3" ]; then
    ins=`kdialog --combobox "Выберите ваш пакетный манаджер:" "APT" "Pacman" "Я не знаю" "Назад"`
     if [ "$ins" == "APT" ]; then
      rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
      echo $rootpass | sudo -S apt install $install -y
      apt install sudo $install -y
     elif [ "$ins" == "Pacman" ]; then
      rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
      echo $rootpass | sudo -S pacman -Sy $install
      pacman -Sy sudo $install
     elif [ "$ins" == "Я не знаю" ]; then
      rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
      echo $rootpass | sudo -S apt install $install -y
      apt install sudo $install -y
      echo $rootpass | sudo -S pacman -Sy $install
      pacman -Sy sudo $install
     else echo Batus systems
     fi
  elif [ "$setmenu" == "4" ]; then
   intmenu=`kdialog --title "Интеграция" --menu "Состояние: $exist" 1 "Назад" 2 "Установить" 3 "Удалить" 4 "Переустановить"`
    if [ "$intmenu" == "1" ]; then
     echo batus sustems
    elif [ "$intmenu" == "2" ]; then
     restart=`kdialog --title "Продолжить?" --yesno "ВНИМАНИЕ!\nДля успешной интеграции положите BatusLin.sh в папку пользователя!\nПродолжить?"`
     rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
     echo $rootpass | sudo -S cp /home/$USER/KBatusLin.sh /bin/kbatus
     sleep 2
     echo Готово!
     echo Используйте команду kbatus для запуска!
    elif [ "$intmenu" == "3" ]; then
     restart=`kdialog --title "Продолжить?" --yesno "Вы действительно хотите удалить Batus из системы?\nПродолжить?"`
     echo Введите пароль для удаления:
     echo $rootpass | sudo -S rm -fv /bin/kbatus /bin/KBatusLin.sh
    elif [ "$intmenu" == "4" ]; then
     restart=`kdialog --title "Продолжить?" --yesno "ВНИМАНИЕ!\nДля успешной интеграции положите BatusLin.sh в папку пользователя!\nПродолжить?"`
     rootpass=`kdialog --title "ROOT" --password "Введите пароль суперпользователя:"`
     echo $rootpass | sudo -S rm -fv /bin/kbatus /bin/KBatusLin.sh
     echo $rootpass | sudo -S cp /home/$USER/KBatusLin.sh /bin/kbatus
     sleep 2
     echo Готово!
     echo Используйте команду kbatus для запуска!
    fi
  elif [ "$setmenu" == "5" ]; then
  debmenu=`kdialog --title "Меню откладки" --menu Меню 1 "Назад" 2 "Удалить логи" 3 "Показать логи" 4 "Назначить переменную" 5 "Выйти с ошибкой" 6 "Показать инфо" 7 "Показать переменные" 8 "Почитсить консоль"`
  if [ "$debmenu" == "1" ]; then
   echo Batus systems
  elif [ "$debmenu" == "2" ]; then
   kdialog --title "Логи" --warningyesno "Удалить логи?!"
   rm -rf /tmp/KKBFL.sh_log.txt
  elif [ "$debmenu" == "3" ]; then
   cat /tmp/KBFL.sh_log.txt ; pause
  elif [ "$debmenu" == "4" ]; then
#    unk1=`kdialog --title "Переменная" --inputbox "Какую переменную перезаписать?"`
   unk2=`kdialog --title "Переменная" --inputbox "Какое значение поставить?"`
   set $unk1=$unk2
  elif [ "$debmenu" == "5" ]; then
   exit 255
  elif [ "$debmenu" == "6" ]; then
   clear
   echo ..................................................
   echo ..................................................
   echo ..................................................
   echo ..//////////.......//////////....////......////...
   echo ..///////////......//////////....////......////...
   echo ..///....////......////..........////......////...
   echo ..////...////......////..........////......////...
   echo ../////////......../////////.....////......////...
   echo ..////////////...../////////.....////......////...
   echo ..///.....////.....////..........////......////...
   echo ..////....////.....////..........////......////...
   echo ..////////////.....////..........//////////////...
   echo ..//////////.......////...........////////////....
   echo ..................................................
   echo ...KBatus.sh......................................
   echo ..................................................
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
   echo Ядро системы - $(uname -a)
   echo Архитектура - $UNARCH
   echo Имя пользователя - $USER
   echo ROOT пароль - $rootpass
   echo Whoami - $(whoami)
   echo Домашняя директория - $HOME
  elif [ "$debmenu" == "7" ]; then
   clear & date & env & pause
  elif [ "$debmenu" == "8" ]; then
   clear
  fi
  fi
else
 exitscr
fi
done
