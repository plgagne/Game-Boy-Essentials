# Références

## URLs
- [Github Pages](https://plgagne.github.io/Game-Boy-Essentials/)
- [Serveur IPv4](http://54.204.100.238)
- [Serveur IPv6](http://2600:1f10:4ec1:a200:833c:772f:ed3b:9a67)
- [Serveur URL](http://ec2-54-204-100-238.compute-1.amazonaws.com)
- [CloudFront](https://d22xncr9jc5j2j.cloudfront.net)

## Tâches faites
To enable root on EC2 instance:
sudo nano /root/.ssh/authorized_keys
  - Delete the lines at the begining of the file until you get to the words ssh-rsa.
sudo nano /etc/ssh/sshd_config
  - Set the variable PermitRootLogin to PermitRootLogin prohibit-password (without quotes)
sudo /etc/init.d/ssh restart

To set up auto-upgrade:
https://wiki.debian.org/UnattendedUpgrades

To set-up auto-reboot:
TO DO

To send external mail using external mail service:
https://community.spiceworks.com/how_to/180401-send-mail-by-using-an-external-smtp-server-in-debian-10-buster-and-11-bullseye

To enable mod_rewrite:
a2enmod headers
systemctl apache2 restart

To install https on Apache:
https://certbot.eff.org/instructions?ws=apache&os=debianbuster