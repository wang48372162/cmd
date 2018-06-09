@echo off

set n=node_modules
set v=vendor
set dirExist=0

:subMain
for /d %%a in (*) do (
  call :subExistDir %%a %n%
  call :subExistDir %%a %v%
)
if %dirExist% == 1 (
  set dirExist=0
  goto :subMain
)
echo Success!
pause
goto :eof

:subRmDir
if exist %~dp0%1\%2 (
  rmdir %~dp0%1\%2 /s /q
)

:subExistDir
if exist %~dp0%1\%2 (
  call :subRmDir %1 %2
  set dirExist=1
) else (
  set dirExist=0
)
