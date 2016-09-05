@ECHO Off

:: 在组策略中配置关机脚本，开始-运行-GPEDIT.MSC,计算机配置→Windows设置-脚本-开机,浏览选择此脚本文件.
:: Reboot之后启用本地连接
netsh interface set interface "Ethernet 2" enabled



:END
