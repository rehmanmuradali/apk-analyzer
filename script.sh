echo Hello World

if [ $1 -eq 0]
then
	echo "No argument supplied"
	exit 1
fi

#clone repo

git clone https://github.com/skylot/jadx.git

# change dir
cd jadx

#run gradlew dist
./gradlew dist	

#copy apk to current directory
cp $1 app.apk

#run jadx
build/jadx/bin/jadx app.apk


#go to app decompiled directory
cd app/sources/com

echo Searching Hard Coded Strings in decompiled apk.....

#search recursively hard coded strings
grep -r -E "\".*\""