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
	title Ввод ключа  -  Trinity Auto
	set /p enteredkey="> Введите полученный ключ: "
	psvimg-extract -K %enteredkey% game/game.psvimg game_dec|findstr "invalid key" >nul 2>&1 && (
		echo Неверный ключ. && pause>nul && cls && goto working
	)
	pause>nul & cls & goto working


:error
	title Ошибка  -  Trinity Auto
	echo. Скрипт лежит не в папке с psvimgtools. & pause>nul & exit