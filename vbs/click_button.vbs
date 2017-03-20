dim wsh
set wsh=createobject("wscript.shell")
'wsh.run "notepad.exe"
'wsh.run "calc.exe"
wscript.sleep 1000
wsh.appactivate "MaxxAudioPro Jack - 0"
wsh.sendkeys"{tab}"
wsh.sendkeys"{tab}"
wsh.sendkeys"{Enter}"
'wsh.sendkeys"4"