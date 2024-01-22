@echo off
title Password Generator

:main
cls
echo Password Generator
echo -----------------
echo.
pushd %~dp0

setlocal enableDelayedExpansion

rem Get password length from user
set /p "length=Enter password length (8-20 characters): "
set "password="

rem Check if length is within valid range
if %length% lss 8 (
    echo Password length must be at least 8 characters.
    pause
    goto main
) else if %length% gtr 20 (
    echo Password length must be at most 20 characters.
    pause
    goto main
)

rem Characters to include in the password
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-=_+[]{}|;:',.<>?/`~"

rem Generate the password
for /l %%i in (1, 1, %length%) do (
    set /a "index=!random! %% 77"
    for /l %%j in (!index!, 1, !index!) do (
        set "char=!chars:~%%j,1!"
        set "password=!password!!char!"
    )
)

echo.
echo Your generated password is: %password%
echo.
pause
popd
goto :eof
