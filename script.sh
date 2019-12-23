echo Hello World


if [ $1 -eq 0]
then
	echo "No argument supplied"
	exit
fi

#clone repo

git clone https://github.com/lxdvs/apk2gold

# change dir
cd apk2gold

#run make.sh
. make.sh	

#copy apk to current directory
cp $1 app.apk

#run apk2gold
. apk2gold app.apk


#go to app decompiled directory
cd app

echo Searching Hard Coded Strings in decompiled apk.....

#search recursively hard coded strings
grep -r -E "\"[\w\s]*\""