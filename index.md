# BatusLin.sh
Скрипт для unix систем, где все стандарнтые команды собраны в удобное меню.

Только русская версия

### С версии 1.1 batus для Android (Termux), Linux и Mac OS X интегрированны в один фаил BatusLin.sh!
## Как мне выбрать правильную версию?
Вот небольшая табилца:

https://github.com/Russanandres/batus-linux/blob/gh-pages/MSpaint.png

## Установка и запуск
[Скачать последнюю версию](https://github.com/Russanandres/batus-linux/tree/main/all%20versions/lastversion) | [с GitHub releases](https://github.com/Russanandres/batus-linux/releases) | [Если у вас нет dialog](https://github.com/Russanandres/batus-linux/tree/main/For%20Legacy%20Systems)

Перед запуском проверьте разрешения
Наберите в терминале:

$: ```sudo chmod +x BatusLin.sh```

$: ```./BatusLin.sh```

## ПРЕДУПРЕЖДЕНИЕ ДЛЯ MACOS X!!
Перед запуском скрипта на MacOS наберите эти 2 команды:

$: ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

$: ```brew install dialog```

Для них нужны ROOT права

Совместимость проверенна на Catalina в vmware! Могут быть глюки и не работающие функции!

## Редактирование
Я написал весь код в Kate редакторе.

Код полностью открыт для просмотра и изучения.

## Другие системы кроме Linux
Android - Работает хорошо в Termux. Используйте Linux версию.

Android recovery - Работают старые версии. Используйте BFR.zip в дирерктории все версии.

WearOS - Работает хорошо в Termux. Используйте Linux версию.

Mac OS X - Работает отлично. Проверено OS X Catalina. Некоторые функции не тестированны. Используйте Linux версию.

BSD - Работает прекрасно. Используйте Linux версию.

PocketBook - Работает хорошо, сделан специальный релиз.

Windows Mobile 5/6 - Я просто не могу перекинуть batus на мой eten лол. Скорее всего заработает [версия под windows](https://github.com/Russanandres/batus
).

PSVita/XMB - Я не нашёл порт терминала. BFLS запустится, если портируют sh. для PlayStation 2/3 установите PS2/3Linux.

WSL2 - Работает нативно. Используйте Linux версию. Перед запуском установите dialog!

SailfishOS - У меня нет возможности проверить работу, но я думаю он запустится.

Ubuntu touch - У меня нет возможности проверить работу, но я думаю он запустится.

ios/ipadOS и подобное - НУЖЕН JAILBREAK!!! Нет полноценной поддержки из-за отсутствия dialog. Проверенно iPhone 4s ios 6.1.3. Старые версии без dialog работают нормально. Предполагаю что можно запустить полноценную версию, но я не знаю как запихнуть dialog в систему. Используйте специальные релизы в "For Legacy Systems" директории.

ChromeOS/ChromiumOS - У меня нет возможности проверить работу, но я думаю он запустится.

OS/2 - В теории вы можете запустить, но я не проверял.

Symbian S60 9.3 - Есть возможность запуска только если телефон с сенсорным экраном. У меня нокия без него(

*-DOS и другие ОС старше 2005 наверн - нет возможности запуска без bash.

### Остальные системы будут тестироватся

## Список дел
- [x] Обновить linux версию.
- [ ] Сделать версию на kdialog
- [ ] Сделать версию для сеносрных экранов
- [x] Запустить Batus в андроид
- [ ] Сделать нативную андроид версию
- [ ] Сделать Debian LiveCD с batusLin.sh и android-platform-tools
- [x] Сделать MacOS x86 версию (или портировать linux версию)
- [ ] Всё сделанно! :tada:

## Windows версии
[Все windows версии доступны здесь](https://github.com/Russanandres/batus)
