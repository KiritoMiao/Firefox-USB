@shift /0
@echo off
title FireFox Boot From USB
color F1
set root1=%~dp0
set root2=%root1%firefox\
set root3=%root1%ff\
if exist %root1%firefox.exe goto pass
if exist %root2%firefox.exe goto pass
if exist %root3%firefox.exe goto pass
title FireFox Boot From USB -- Error (FireFox Missing)
echo 没有找到火狐，程序无法初始化，请确认存在firefox.exe或Firefox文件夹或ff文件夹
pause
exit

:pass
if exist %root1%ffusb.lock goto boot
if exist %root2%ffusb.lock goto boot
if exist %root3%ffusb.lock goto boot
error no installed files...
pause


:sl1
echo 您可能是第一次运行FireFox Boot From USB！！！
echo 这将可能影响程序正常运行，请问您是否需要启动配置程序？
echo 如果您的FireFox文件夹下已经放入profile文件夹，请按1
echo 如果没有，请按2（载入配置程序）
echo 如果不知道，请按3
echo 退出，选择4
echo 输出日志，选择5
echo _______________________________________________________________
echo 请输入选择项目的序号：
set /p ID=
if "%id%"=="1" goto lockinstall
if "%id%"=="2" goto setup
if "%id%"=="3" goto try
IF "%id%"=="4" exit
IF "%id%"=="5" goto log
echo 错误的输入
goto sl1


:setup
if exist %root1%firefox.exe start %root1%firefox.exe -p
if exist %root2%firefox.exe start %root2%firefox.exe -p
if exist %root3%firefox.exe start %root3%firefox.exe -p
echo 请在Firefox文件夹下创建"profile"文件夹(不包含双引号)
echo 创建完成,任意键继续
pause >> nul
goto lockinstall



:try
echo 扫描本地环境
title FireFox Boot From USB 扫描本地环境
echo %~dp0
echo %~f0
time /T
echo 设定变量
title FireFox Boot From USB 设定变量
color F2
set profile1=%root1%profile\
set profile2=%root2%profile\
set profile3=%root3%profile\
echo 检查变量
title FireFox Boot From USB 设定变量-检查变量
color FA
set root
set profile
set profile2
echo 启动Firefox
title FireFox Boot From USB 启动Firefox
color F5
if exist %root1%firefox.exe start %root1%firefox.exe -Profile %profile1%
if exist %root2%firefox.exe start %root2%firefox.exe -Profile %profile2%
if exist %root3%firefox.exe start %root3%firefox.exe -Profile %profile2%
goto sl2

:sl2
echo 正常启动，请按1。
echo 未正常启动，请按2。
echo 请输入选择项目的序号：
set /p TRY=
if "%try%"=="1" goto lockinstall
if "%try%"=="2" goto pass

echo 错误的输入
goto pass

:lockinstall
echo lock >> ffusb.lock
if exist %root1%firefox.exe move ffusb.lock %root1%/ffusb.lock
if exist %root2%firefox.exe move ffusb.lock %root2%/ffusb.lock
if exist %root3%firefox.exe move ffusb.lock %root3%/ffusb.lock
pause


:boot
echo 扫描本地环境
title FireFox Boot From USB 扫描本地环境
echo %~dp0
echo %~f0
time /T
echo 设定变量
title FireFox Boot From USB 设定变量
color F2
set profile1=%root1%profile\
set profile2=%root2%profile\
set profile3=%root3%profile\
echo 检查变量
title FireFox Boot From USB 设定变量-检查变量
color FA
set root
set profile
set profile2
echo 启动Firefox
title FireFox Boot From USB 启动Firefox
color F5
if exist %root1%firefox.exe start %root1%firefox.exe -Profile %profile1%
if exist %root1%firefox.exe exit
if exist %root2%firefox.exe start %root2%firefox.exe -Profile %profile2%
if exist %root2%firefox.exe exit
if exist %root3%firefox.exe start %root3%firefox.exe -Profile %profile2%
if exist %root3%firefox.exe exit
color 48
title FireFox Boot From USB ERROR(FireFox Missing)--请检查设置问题,如果无设置问题请上传log.txt
echo firefox missing...
echo 请检查设置问题,如果无设置问题请上传log.txt

:log
echo 变量 >> log.txt
echo %~dp0 >> log.txt
echo %~f0 >> log.txt
echo 系统时间 >> log.txt
time /T >> log.txt
echo 变量 >> log.txt
set root >> log.txt
set root1 >> log.txt
set root2 >> log.txt
set root3 >> log.txt
set profile >> log.txt
set profile1 >> log.txt
set profile2 >> log.txt
set profile3 >> log.txt
echo 系统配置 >> log.txt
systeminfo >> log.txt
echo 按任意键退出
pause > nul
