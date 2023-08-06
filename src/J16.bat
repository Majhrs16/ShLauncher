Call ShLauncher.bat %*
cls & Echo Cargando variables personalizadas...
Set Version=J16
Set AssetsIndex=1.16
Set Natives=%MC%\versions\%Version%\natives
Set CLASSPATH=%Lib%\log4j-core-2.17.0.jar;%Lib%\log4j-api-2.17.0.jar;%MC%\versions\%Version%\%Version%.jar
Set Flags=%Flags% "-Djava.library.path=%Natives%" -cp "%CLASSPATH%" "-Dlog4j.configurationFile=%Lib%\client-1.12.xml"
Set Args=--gameDir "%MC%\%Version%" --assetsDir "%MC%\assets" %Nick% --accessToken %Token% --version "%Version%" --assetIndex "%AssetsIndex%"
cls & Echo Cargando variables personalizadas... OK
Call ShLauncher.bat