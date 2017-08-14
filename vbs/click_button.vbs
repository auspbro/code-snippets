dim wsh
set wsh=createobject("wscript.shell")
'wsh.run "notepad.exe"
'wsh.run "calc.exe"
wscript.sleep 1000
wsh.appactivate "MaxxAudioPro Jack - 0"     '激活窗口标题名为"MaxxAudioPro Jack - 0" 的窗口
wsh.sendkeys"{tab}"     '模拟按下tab键
wsh.sendkeys"{tab}"
wsh.sendkeys"{Enter}"
'wsh.sendkeys"4"