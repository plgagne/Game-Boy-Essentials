# Références

## URLs
- [Github Pages](https://plgagne.github.io/Game-Boy-Essentials/)
- [Serveur IPv4](http://54.204.100.238)
- [Serveur IPv6](http://2600:1f10:4ec1:a200:833c:772f:ed3b:9a67)
- [Serveur URL](http://ec2-54-204-100-238.compute-1.amazonaws.com)
- [CloudFront](https://d22xncr9jc5j2j.cloudfront.net)

## URLs du serveur test temporaire


## Tâches faites
To enable root on EC2 instance:
sudo vi /root/.ssh/authorized_keys
  - enter edit with q
  - Delete the text at the begining of the file until you get to the words ssh-rsa.
  - esc then :x to save & exit
sudo nano /etc/ssh/sshd_config
  - Make sure PermitRootLogin is set to prohibit-password
sudo /etc/init.d/ssh restart

To set up auto-upgrade:
https://wiki.debian.org/UnattendedUpgrades

To set-up auto-reboot:
TO DO AFTER I CONFIRM EMAILING WORKS

To send external mail using external mail service:
https://community.spiceworks.com/how_to/180401-send-mail-by-using-an-external-smtp-server-in-debian-10-buster-and-11-bullseye

To install https:
https://certbot.eff.org/instructions?ws=apache&os=debianbuster

To change hostname:
https://linuxhandbook.com/debian-change-hostname/
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html

Moving to nginx (si ça marche):
- changer de façon permanente le hostname
- enlever apache
- enlever certbot
- redémarrer le serveur