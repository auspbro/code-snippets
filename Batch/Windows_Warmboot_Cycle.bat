@echo on

type test.log | find /c /v "" > count.bat
find /i "20" count.bat
if not errorlevel 1 goto end
goto start

:start
timeout 10
start /w shutdown /r /t 5
echo ***%date% %time%*** >> test.log
goto end

:end