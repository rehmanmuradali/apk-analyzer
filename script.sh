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

#search recursively hard coded strings
grep -r -E "PASSWORD|API_KEY|api_key"