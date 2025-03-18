@echo off
setlocal

set "TARGET_DIR=%USERPROFILE%\bin"

if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

copy /Y cnew.bat "%TARGET_DIR%\cnew.bat"

echo %PATH% | findstr /I /C:"%TARGET_DIR%" >nul
if errorlevel 1 (
    echo Adding "%TARGET_DIR%" to PATH...
    setx PATH "%TARGET_DIR%;%PATH%" /M
)

echo Done!
echo.
echo Press Enter to exit...
pause >nul
