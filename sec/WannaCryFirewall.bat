@ECHO OFF

rem http://www.iuqerfsodp9ifjaposdfjhgosurijfaewrwergwea.com



ECHO open firewall
rem netsh firewall set opmode enable
rem netsh advfirewall set allprofiles state on

rem netsh advfirewall firewall add rule name="Deny Port 445" dir=in action=block protocol=TCP localport=445
rem netsh firewall set portopening  protocol=TCP port=445 mode=disable name=deny445
ECHO close 445 port

rem netsh advfirewall firewall add rule name="Deny Port 137" dir=in action=block protocol=TCP localport=137
rem netsh firewall set portopening  protocol=TCP port=137 mode=disable name=deny137
ECHO close 137 port

rem netsh advfirewall firewall add rule name="Deny Port 138" dir=in action=block protocol=TCP localport=138
rem netsh firewall set portopening  protocol=TCP port=138 mode=disable name=deny138
ECHO close 138 port

rem netsh advfirewall firewall add rule name="Deny Port 139" dir=in action=block protocol=TCP localport=139
rem netsh firewall set portopening  protocol=TCP port=139 mode=disable name=deny139
ECHO close 139 port

ECHO port all close

PAUSE

