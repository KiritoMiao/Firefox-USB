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
echo û���ҵ�����������޷���ʼ������ȷ�ϴ���firefox.exe��Firefox�ļ��л�ff�ļ���
pause

:pass
if exist %root1%firefox.exe start %root1%firefox.exe -p
if exist %root2%firefox.exe start %root2%firefox.exe -p
if exist %root3%firefox.exe start %root3%firefox.exe -p