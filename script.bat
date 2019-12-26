
echo Hello World

@echo on

:: clone repo
git clone https://github.com/skylot/jadx.git

:: change dir
cd jadx


echo run gradle dist

:: run gradlew dist
call gradlew dist	


:: copy apk to current directory
copy %1 app.apk

:: run jadx
call build/jadx/bin/jadx app.apk


:: go to app decompiled directory
cd app/sources/com

echo Searching Hard Coded Strings in decompiled apk.....

:: search recursively hard coded strings
call findstr /S "\".*\"" *

echo Finished