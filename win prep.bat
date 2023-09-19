@echo off

:menu
cls
title Lillebror's Win Prep
echo Menu:
echo 1. Vælg navn på computer
echo 2. Indstallering af programmer
echo 3. Opdater alt
echo 4. Genstar computer
set /p choice=Indtast dit valg: 

if "%choice%"=="1" (
    :changecomputername
    cls
    echo Nyt computer navn:
    set /p newcomputername=Indtast det nye navn: 


    if "%newcomputername%"=="" (
        echo Kan ikke være tom.
        pause
        goto changecomputername
    )

    echo Skifter navn til: %newcomputername%...
    netdom renamecomputer %COMPUTERNAME% /newname:%newcomputername%
    echo Computer name changed. Du skal genstarte for at det opdateres...
    set "bgimage=wallpaper_prep.jpg"
    set "bgimagepath=%~dp0%bgimage%"
    
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%bgimagepath%" /f
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    pause
    goto menu
)

if "%choice%"=="2" (
    :submenu2
    cls
    echo Program menu:
    echo 1. Standard pakke 
    echo    - Chrome 
    echo    - Discord 
    echo    - Everything 
    echo    - FileZilla
    echo 2. Gamer pakke
    echo    - Chrome 
    echo    - Discord 
    echo    - Everything 
    echo    - Spotify 
    echo    - Steam
    echo 3. Tilbage til hovede menu
    set /p choice2=Indtast dit valg: 

    if "%choice2%"=="1" (
        echo Finder pakke...
        start /wait msiexec /i "Programmer\Ninite Chrome Discord Everything FileZilla Installer.exe" /qn
        echo Indstallationen er igangsat.
        pause
        goto submenu2
    )

    if "%choice2%"=="2" (
        echo Finder pakke...
        start /wait msiexec /i "Programmer\Ninite Chrome Discord Everything Spotify Steam Installer.exe" /qn
        echo Indstallationen er igangsat.
        pause
        goto submenu2
    )

    if "%choice2%"=="3" (
        goto menu
    )

    echo Ugyldigt valg benyt 1 2 eller 3.
    pause
    goto submenu2
)

if "%choice%"=="3" (
    echo Finder alle opdateringer...
    winget upgrade --all
    echo Alle programmer er nu klar til brug.
    pause
    goto menu
)

if "%choice%"=="4" (
    echo Genstarter computer...
    echo Hej hej...
    shutdown /r /t 0
    exit /b 0
)

echo Ugyldigt valg.
pause
goto menu
