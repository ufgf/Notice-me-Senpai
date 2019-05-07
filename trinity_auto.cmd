@echo off & chcp 65001>nul
title Загрузка..  -  Trinity Auto
:checking
	if NOT exist "%cd%/cyggcrypt-20.dll" (goto error)
	if NOT exist "%cd%/cyggpg-error-0.dll" (goto error)
	if NOT exist "%cd%/cygintl-8.dll" (goto error)
	if NOT exist "%cd%/cygwin1.dll" (goto error)
	if NOT exist "%cd%/cygz.dll" (goto error)
	if NOT exist "%cd%/psvimg-create.exe" (goto error)
	if NOT exist "%cd%/psvimg-extract.exe" (goto error)
	if NOT exist "%cd%/psvimg-keyfind.exe" (goto error)
	if NOT exist "%cd%/psvmd-decrypt.exe" (goto error)

:working
	set /p enteredkey="> Введите полученный ключ: "
	psvimg-extract -K %enteredkey% game/game.psvimg game_dec
	pause>nul & cls & goto listofcommand


:error
	echo. Скрипт лежит не в папке с psvimgtools. & pause>nul & exit
