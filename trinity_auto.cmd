@echo off & chcp 65001>nul & set "working-direct=%~dp0"
title Загрузка..  -  Trinity Auto
:checking
	if NOT exist "%working-direct%/cyggcc_s-1.dll" (goto error)
	if NOT exist "%working-direct%/cyggcrypt-20.dll" (goto error)
	if NOT exist "%working-direct%/cyggpg-error-0.dll" (goto error)
	if NOT exist "%working-direct%/cygintl-8.dll" (goto error)
	if NOT exist "%working-direct%/cygwin1.dll" (goto error)
	if NOT exist "%working-direct%/cygz.dll" (goto error)
	if NOT exist "%working-direct%/psvimg-create.exe" (goto error)
	if NOT exist "%working-direct%/psvimg-extract.exe" (goto error)
	if NOT exist "%working-direct%/psvimg-keyfind.exe" (goto error)
	if NOT exist "%working-direct%/psvmd-decrypt.exe" (goto error)

:working
	set /p enteredkey="> Введите полученный ключ: "
	psvimg-extract -K %enteredkey% game/game.psvimg game_dec
	pause>nul & cls & goto listofcommand


:error
	echo. Скрипт лежит не в папке с psvimgtools. & pause>nul & exit
