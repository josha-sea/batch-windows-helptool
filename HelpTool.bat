@ECHO OFF


REM Set window title and color scheme
TITLE Help-Tool for Windows
CLS
COLOR 0A

REM Check for administrative privilige
NET SESSION > NUL 2>&1
IF %ERRORLEVEL% neq 0 (
	ECHO Requires administrative privilege.
	ECHO:
	ECHO Please run as administrator.
	ECHO Press any button to close.
	PAUSE>NUL
	EXIT

)
REM Main Script
:MENU
CLS

REM Banner
ECHO """"""""""""""""""""""""""""""""""""""
ECHO " _   _      _     _____           _ "
ECHO "| | | | ___| |_ _|_   _|__   ___ | |"
ECHO "| |_| |/ _ \ | '_ \| |/ _ \ / _ \| |"
ECHO "|  _  |  __/ | |_) | | (_) | (_) | |"
ECHO "|_| |_|\___|_| .__/|_|\___/ \___/|_|"
ECHO "             |_|                    "
ECHO """"""""""""""""""""""""""""""""""""""

ECHO:

ECHO ============= MENU =============
ECHO -------------------------------------
ECHO [1] - Secure File Checker
ECHO [2] - Restore Health
ECHO [3] - Show Internet Connections
ECHO [4] - Check Disk
ECHO [5] - Repair Disk (Restart required!)
ECHO [6] - Download Virus
ECHO -------------------------------------
ECHO ==========PRESS 'Q' TO QUIT==========
ECHO.

SET INPUT=
SET /P INPUT=Please select a number:

IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='3' GOTO Selection3
IF /I '%INPUT%'=='4' GOTO Selection4
IF /I '%INPUT%'=='5' GOTO Selection5
IF /I '%INPUT%'=='6' GOTO Selection6
IF /I '%INPUT%'=='Q' GOTO Quit

CLS

ECHO ============INVALID INPUT============
ECHO -------------------------------------
ECHO Please select a number from the Main
ECHO Menu [1-6] or select 'Q' to quit.
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE > NUL
GOTO MENU

:Selection1

CLS
ECHO ======== Secure File Checker starts ========
ECHO:

SFC/SCANNOW

ECHO:
PAUSE
GOTO MENU

:Selection2

CLS
ECHO ======== Restoring Health ========
ECHO:

DISM.exe /Online /Cleanup-Image /RestoreHealth

ECHO:
PAUSE
GOTO MENU

:Selection3

CLS
ECHO ======== Showing Internet Connections ========
ECHO:

NETSTAT -bof

ECHO:
PAUSE
GOTO MENU

:Selection4

CLS
ECHO ======== Checking Disk ========
ECHO:

CHKDSK

ECHO:
PAUSE
GOTO MENU

:Selection5

CLS
ECHO ======== Repairing Disk ========
ECHO:

CHKDSK /R 

ECHO:
PAUSE
GOTO MENU

REM Prank selection
:Selection6

CLS

ECHO Ur an idiot. Have fun closing :) > %USERPROFILE%\Desktop\Iamabigidiotfortrustingalittlebatchscript.txt
START /MAX notepad.exe %USERPROFILE%\Desktop\Iamabigidiotfortrustingalittlebatchscript.txt
TIMEOUT /T 5

FOR /L %%i IN (1,1,20) DO START cmd.exe

EXIT



:Quit
CLS

ECHO ==============THANKYOU===============
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO EXIT======

PAUSE > NUL
EXIT
