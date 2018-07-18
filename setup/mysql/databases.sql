# create databases
CREATE DATABASE IF NOT EXISTS `exercism_reboot_development`;
CREATE DATABASE IF NOT EXISTS `exercism_reboot_test`;

# grant exercism db user all rights
GRANT ALL ON *.* TO 'exercism_reboot'@'%';
