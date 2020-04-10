#!/bin/bash
# refers to comments.
if [ $1 ] 
	then
		#We come here if paramter1 exists
		if [[ $1 == "--help" || $1 == -* ]]
			then
				man htmlcreator
				exit 0
			else
				#We come here if paramter1 is a valid folder name
				projectName="$1"
		fi
	else
		echo "You forgot project name,Please provide one"
		while [ ${#projectName} -le 0 ]
			do
				read projectName
			done
fi   #if [ $1 ]

if [[ "$2" == "-w" || "$3" == "-w" ]]
	then
	echo "Whats the path you  want the folder to be created : "
	echo "example:= For C: drive just mention c, D: mention d, For d:/Sample mention d/Sample" 
	read path
	projectName="/mnt/$path/$projectName"
fi 

if [[ "$2" == "-l" || "$3" == "-l" ]]
	then
	echo "The project will be created inside your \"Home\" directory which can be accessed by ~ "
	projectName="/home/$USER/$projectName"
fi 

if [ $projectName  ]
	then
		echo "************ Creating Folders ***************"
		sleep 1
		mkdir -p $projectName && echo "Project Folder $projectName created" || echo "Sorry...!!! $projectName not created !!!"
		mkdir $projectName/assets && echo "Folder '$projectName/assets' created" || echo "Sorry...!!! '$projectName/assets' not created !!!"
		mkdir $projectName/css && echo "Folder '$projectName/css' created" || echo "Sorry...!!! '$projectName/css' not created !!!"
		mkdir $projectName/js && echo "Folder '$projectName/js' created" || echo "Sorry...!!! '$projectName/js' not created !!!"
		echo "Folders  :  DONE !!!!!"
		sleep 1


echo "************ Creating Files ***************"
sleep 1
touch $projectName/css/app.css && echo "app.css created inside css folder";sleep 1
touch $projectName/js/app.js && echo "app.js created inside js folder";sleep 1
touch $projectName/index.html && echo "index.html created inside $projectName folder";sleep 1
echo "Files  :  DONE !!!!!"
sleep 1
chmod -R 777 $projectName
echo "***** Adding Contents to each file ********"
sleep 1
echo "***** index.html *****"
sleep 1
if [[ "$2" != "-a" && "$3" != "-a" ]] #Check for the existance of -a option
	then
echo "<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="css/app.css" >
        <title> I am trying to be a developer !!!</title>
</head>
<!--This is a comment-->
<body>
	<header>
        	This is Header Section
        </header>
        <nav>
        	This is Nav Section
        </nav>
        <main>
        	This is the Main Section
        	<div>
                	<h6>Hello....I am a webpage created from linux environment</h6>
            	</div>
        </main>
        <footer>
        	This is the Footer Section
        	<br>&copy; Abin Thomas <!--This shows the copyright symbol-->
        </footer>
</body>
</html>" > $projectName/index.html
echo "index.html ....... DONE !!!!"
sleep 1
echo "***** app.css *****"
sleep 1
echo "body{
    width: 90%;
    margin: 0 auto;
    height: 700px;
    background: #363062;
    color: #000;/*color refers to the text color*/
}
header{
    width: 100%;
    height: 200px;
    color: #fff;
}
nav{
    width: 100%;
    height: 50px;
    background: #97e5ef;
}
main{
    width: 100%;
    height: 400px;
    background: #4cd3c2;
}
footer{
    width: 100%;
    height: 50px;
    background: #d8b9c3;
    color: #fff;
}" > $projectName/css/app.css
echo "app.css ..... DONE !!!!"

else # below code executes if $2 or $3 is -a
echo "****** Lets create CUSTOM index file *****"
sleep 1
echo "What should be the title ? "
read title
echo "What to show in the header ? "
read header
echo "What to show in navigation bar ? "
read nav
echo "What to show in the main part ? "
read main
echo "What to show in the footer ? "
read footer
echo "***** Thats it, We are done here *****"
echo "<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="css/app.css" >
        <title> $title</title>
</head>
<!--This is a comment-->
<body>
	<header>
        	$header
        </header>
        <nav>
        	$nav
        </nav>
        <main>
        	This is the Main Section
        	<div>
                	$main
            	</div>
        </main>
        <footer>
        	$footer
        </footer>
</body>
</html>" > $projectName/index.html
sleep 1
echo "index.html ....... DONE !!!!"
echo "***** app.css *****"
sleep 1
echo "body{
    width: 90%;
    margin: 0 auto;
    height: 700px;
    background: #363062;
    color: #000;/*color refers to the text color*/
}
header{
    width: 100%;
    height: 200px;
    color: #fff;
}
nav{
    width: 100%;
    height: 50px;
    background: #97e5ef;
}
main{
    width: 100%;
    height: 400px;
    background: #4cd3c2;
}
footer{
    width: 100%;
    height: 50px;
    background: #d8b9c3;
    color: #fff;
}" > $projectName/css/app.css
echo "app.css ..... DONE !!!!"
sleep 1
echo "***** We have created a dummy css file for you... *****"
sleep 1
cat $projectName/css/app.css
sleep 1
echo " Do you want to modify it (Y/N) ?? "
read modifyCss
if [[ $modifyCss =~ ^[Yy]$ ]]
then
vi $projectName/css/app.css
fi #if [[ $modifyCss =~ ^[Yy]$ ]]



fi #if [[ "$2" != "-a" && "$3" != "-a" ]]



fi    #[ $projectName ]