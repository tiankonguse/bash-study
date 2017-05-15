@ECHO OFF

rem http://www.iuqerfsodp9ifjaposdfjhgosurijfaewrwergwea.com



ECHO open firewall

rem old cmd open firewall
rem netsh firewall set opmode enable

rem new cmd open firewall
netsh advfirewall set currentprofile state on
netsh advfirewall set allprofiles state on

netsh advfirewall firewall add rule name="Deny WannaCry port" dir=in action=block protocol=TCP localport=445,137,138,139
ECHO close 445,137,138,139 port


net stop netbt
net stop srv
net stop rdr
net stop langmanserver

PAUSE

