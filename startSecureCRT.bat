@echo off
@SET TBJ="[Encoding] |InputEncoding=UTF8 |[WFClient] |CPMAllowed=On |ProxyFavorIEConnectionSetting=Yes |ProxyTimeout=30000 |ProxyType=Auto |ProxyUseFQDN=Off |RemoveICAFile=yes |TransparentKeyPassthrough=Local |TransportReconnectEnabled=On |VSLAllowed=On |Version=2 |VirtualCOMPortEmulation=Off |[ApplicationServers] |SecureCRT-S4= |[SecureCRT-S4] |Address=10.14.3.238:1494 |AutologonAllowed=ON |BrowserProtocol=HTTPonTCP |CGPAddress=*:2598 |ClearPassword=12C94D5A3437E8 |ClientAudio=Off |DesiredColor=8 |DesiredHRES=0 |DesiredVRES=0 |DoNotUseDefaultCSL=On |Domain=\EABB0464574B76AD |FontSmoothingType=0 |InitialProgram=#SecureCRT-S4 |LPWD=0 |LaunchReference=JBdotb+2l+4MAfu7nzU51wVExWDl2MVbUkQik38Jfes= |Launcher=WI |LocHttpBrowserAddress=! |LogonTicket=12C94D5A3437E8EABB0464574B76AD |LogonTicketType=CTXS1 |LongCommandLine= |NRWD=16 |ProxyTimeout=30000 |ProxyType=Auto |SFRAllowed=Off |SSLEnable=Off |SessionsharingKey=-x7y16V0IwcHJxpzejgG2V7 |StartIFDCD=1427250352215 |StartSCD=1427250352215 |TRWD=15 |TWIMode=On |Title=SecureCRT-S4 |TransportDriver=TCP/IP |UILocale=zh-CN |WinStationDriver=ICA 3.0 |[Compress] |DriverNameWin16=pdcompw.dll |DriverNameWin32=pdcompn.dll |[EncRC5-0] |DriverNameWin16=pdc0w.dll |DriverNameWin32=pdc0n.dll |[EncRC5-128] |DriverNameWin16=pdc128w.dll |DriverNameWin32=pdc128n.dll |[EncRC5-40] |DriverNameWin16=pdc40w.dll |DriverNameWin32=pdc40n.dll |[EncRC5-56] |DriverNameWin16=pdc56w.dll |DriverNameWin32=pdc56n.dll"


@echo secureCRT loading ...
@echo .
@del /Q launch.ica
@call :split %TBJ%
@CALL :Sleep 1


@echo secureCRT starting...
@start launch.ica


:Sleep
    @set time=%1
    @ping -n %time% 127.0.0.1 > /nul
GOTO :EOF

:split
    @set list=%1
    for /F  "tokens=1* delims=|" %%A in (%list%) do (
       @echo %%A >> launch.ica
       @if not "%%B" == "" ( call :split "%%B" ) 
    )
GOTO :EOF