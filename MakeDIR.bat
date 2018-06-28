@echo off
REM @author: charlespetchsy
REM A batch script (.bat) that simply creates folders

SET /p UserInput="Enter the number of folders: "
if %UserInput% EQU 0 GOTO E_INVALIDINPUT

SET /A UserInputVal="%UserInput%"*1
if %UserInputVal% EQU 0 echo "UserInput must be an integer." && pause && exit
GOTO EOF

:E_INVALIDINPUT
ECHO Invalid user input
:EOF

set /p pre="Enter subdirectory prefix: "

for /f "tokens=1-3 delims=/" %%a in ("%date%") do (
    md "%%a_%%b_%%c" && set file_name="%%a_%%b_%%c"
)

cd "%file_name%"  
for /L %%i in (1,1,%UserInput%) do (
    md "%pre%-%%i"
)
pause