@Echo OFF

if defined MC Goto Launch

:Data
	cls & Echo Cargando variables por defecto...

	Set JVM=Start /Low javaw
	If not "%2" == "" Set MinRam=%2
	If not "%3" == "" Set MaxRam=%3
	If not defined MinRam Set MinRam=512M
	If not defined MaxRam Set MaxRam=512M
	Set MC=%CD%
	Set Lib=%MC%\libraries
	Set CLASSPATH=
	Set natives=%MC%\bin\natives

:::::::::::::::::::
::	Flags estandar
::	Set Flags=-Xms%MinRam% -Xmx%MaxRam% -XX:+UnlockExperimentalVMOptions -XX:+IgnoreUnrecognizedVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Dsun.java2d.d3d=false -Dsun.java2d.opengl=false -Dorg.lwjgl.opengl.Display.allowSoftwareOpenGL=true
:::::::::::::::::::

::	Flags requiere de completacion NO es posible automatizarlo todo

:::::::::::::::::::::::::
::	Flags experimentales
	Set Flags=-Xms%MinRam% -Xmx%MaxRam% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:+IgnoreUnrecognizedVMOptions -XX:MaxGCPauseMillis=50 -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Dsun.java2d.d3d=false -Dsun.java2d.opengl=true -Dorg.lwjgl.opengl.Display.allowSoftwareOpenGL=true
	Set Flags=%Flags% -XX:+AggressiveOpts -XX:-UseCompressedOops -XX:ParallelGCThreads=4

::	-XX:+UseParallelGC -XX:+UseConcMarkSweepG -Xlog:gc*:logs/gc.log:time,uptime:filecount=5,filesize=1M -Dorg.lwjgl.opengl.Display.setFullscreen=true
::		No funcional
:::::::::::::::::::::::::

	Set MainClass=net.minecraft.client.main.Main
	If not "%1" == "" Set Nick=--username "%1"
	Set Token=null
	Set Version=CM
	Set AssetsIndex=1.8
	Set Args=

::	Set Args=--gameDir "%MC%" --assetsDir "%MC%\assets" %Nick% --accessToken %Token% --version "%Version%" --assetIndex "%AssetsIndex%" --userProperties {}
::		Args requiere de completacion NO es posible automatizarlo todo
	
	cls & Echo Cargando variables por defecto... OK
	Goto Exit

:Launch
	cls & Echo Lanzando Minecraft :D
	cd "%MC%"
	%JVM% %Flags% %MainClass% %Args%
	Goto Exit
	cls & Echo FIN
:Exit