@echo off
if "%1"=="" (
    set /p "error_code=Enter an error code: "
) else (
    set error_code=%1
)

setlocal enabledelayedexpansion
echo Error code: %error_code%
for /f "skip=1 tokens=*" %%A in ('certutil -error %error_code%') do (
    set "line=%%A"
    set "certutil=!line:*CertUtil: =!"
    echo !certutil:*-error =!
)
pause
