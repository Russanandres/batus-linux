#!/bin/bash
VER="0.5 Beta for iPhone.sh"
VERMENU="2 NiPhgner"

# инициализация функций
function pause(){ read -p "Нажмите ENTER для выхода..."
}

# заставка
clear
echo .....................................................
echo .....................................................
echo .....................................................
echo ..//////////............//////////.......////////....
echo ..///////////...........//////////.......////////....
echo ..///....////...........////...............////......
echo ..////...////...........////...............////......
echo ..////////............../////////..........////......
echo ..////////////........../////////..........////......
echo ..///.....////..........////...............////......
echo ..////....////....//....////.......//......////......
echo ..////////////...////...////......////...////////....
echo ..//////////.....////...////......////...////////....
echo .....................................................
echo ...Batus.For.iPhone.sh.....................BETA......
echo .....................................................
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
             echo .....................................................
             echo .....................................................
             echo .....................................................
             echo ..//////////............//////////.......////////....
             echo ..///////////...........//////////.......////////....
             echo ..///....////...........////...............////......
             echo ..////...////...........////...............////......
             echo ..////////............../////////..........////......
             echo ..////////////........../////////..........////......
             echo ..///.....////..........////...............////......
             echo ..////....////....//....////.......//......////......
             echo ..////////////...////...////......////...////////....
             echo ..//////////.....////...////......////...////////....
             echo .....................................................
             echo ...Batus.For.iPhone.sh.....................BETA......
             echo .....................................................
             echo
             echo Версия - $VER
             echo Версия меню - $VERMENU
             echo
             uname -a
             echo
             pause
           elif [ "$opt" = "перезагрузка" ]; then
             echo Введита пароль для перезагрузки:
             sudo reboot
           elif [ "$opt" = "настройки" ]; then
             clear
                OPTIONS="выход"
                select opt in $OPTIONS; do
                    if [ "$opt" = "выход" ]; then
                    clear
                    echo Batus For iPhone.sh $VER - 2020-2022. Russanandres
                    date
                    exit
                    fi
                done
             exit
           elif [ "$opt" = "выход" ]; then
             clear
             echo Batus For iPhone.sh $VER - 2020-2022. Russanandres
             date
             exit
            else
             echo это так не работает
           fi
done
done
