# Docker_setup_MacOs

# This script will install docker and run a Container that will install/configure/and start a LAMP server automatically !
# if you dont have the goinfre folder just delete the section where we use it as a base folder and you are ready to go.
# normal macOs version will be added soon !
Error :

Cloning into 'apache_runner'...
Enabling module rewrite.
To activate the new configuration, you need to run:
  service apache2 restart
 * Restarting Apache httpd web server apache2
Output of config test was:
   ...fail!
 * The apache2 configtest failed.
AH00526: Syntax error on line 2 of /etc/apache2/sites-enabled/000-default.conf:
AllowOverride not allowed here
Action 'configtest' failed.
The Apache error log may have more information.