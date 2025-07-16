# 연습 문제 1
# 1-1
[hwang@localhost ~]$ pwd
/home/hwang
[hwang@localhost ~]$ cd ..
[hwang@localhost home]$ cd /
[hwang@localhost /]$ pwd
/
[hwang@localhost /]$ cd home
[hwang@localhost home]$ 

# 1-2
[hwang@localhost home]$ ls
hwang
[hwang@localhost home]$ ls -a

hwang@localhost ~]$ cd /
[hwang@localhost /]$ ls -a
.   afs  boot  etc   lib    media  opt   root  sbin  sys  usr
..  bin  dev   home  lib64  mnt    proc  run   srv   tmp  var
[hwang@localhost /]$ cd etc
[hwang@localhost etc]$ ls -a
.                        firefox         makedumpfile.conf.sample  samba
..                       firewalld       man_db.conf               sane.d
accountsservice          flatpak         mcelog                    sasl2
adjtime                  fonts           microcode_ctl             security
aliases                  foomatic        mime.types                selinux
alsa                     fprintd.conf    mke2fs.conf               services
alternatives             fstab           modprobe.d                sestatus.conf
anacrontab               fuse.conf       modules-load.d            setroubleshoot
appstream.conf           fwupd           motd                      sgml
asound.conf              gcrypt          motd.d                    shadow
at.deny                  gdm             mtab                      shadow-
audit                    geoclue         multipath                 shells
authselect               glvnd           nanorc                    skel
avahi                    gnupg           netconfig                 smartmontools
bash_completion.d        GREP_COLORS     NetworkManager            sos
bashrc                   groff           networks                  speech-dispatcher
bindresvport.blacklist   group           nftables                  ssh
binfmt.d                 group-          nsswitch.conf             ssl
bluetooth                grub2.cfg       nsswitch.conf.bak         sssd
brlapi.key               grub.d          nvme                      statetab.d
brltty                   gshadow         openldap                  subgid
brltty.conf              gshadow-        opt                       subgid-
chromium                 gss             os-release                subuid
chrony.conf              host.conf       ostree                    subuid-
chrony.keys              hostname        PackageKit                sudo.conf
cifs-utils               hosts           pam.d                     sudoers
cockpit                  hp              papersize                 sudoers.d
containers               inittab         passwd                    sudo-ldap.conf
cron.d                   inputrc         passwd-                   sysconfig
cron.daily               iscsi           pbm2ppa.conf              sysctl.conf
cron.deny                issue           pinforc                   sysctl.d
cron.hourly              issue.d         pkcs11                    systemd
cron.monthly             issue.net       pkgconfig                 system-release
crontab                  kdump           pki                       system-release-cpe
cron.weekly              kdump.conf      plymouth                  terminfo
crypto-policies          kernel          pm                        tmpfiles.d
crypttab                 keys            pnm2ppa.conf              tpm2-tss
csh.cshrc                keyutils        polkit-1                  trusted-key.key
csh.login                krb5.conf       popt.d                    tuned
cups                     krb5.conf.d     printcap                  udev
cupshelpers              ld.so.cache     profile                   udisks2
dbus-1                   ld.so.conf      profile.d                 .updated
dconf                    ld.so.conf.d    protocols                 updatedb.conf
debuginfod               libaudit.conf   pulse                     UPower
default                  libblockdev     .pwd.lock                 usb_modeswitch.conf
depmod.d                 libibverbs.d    qemu-ga                   vconsole.conf
dhcp                     libnl           ras                       vimrc
DIR_COLORS               libpaper.d      rc.d                      virc
DIR_COLORS.lightbgcolor  libreport       rc.local                  vmware-tools
dnf                      libssh          redhat-release            vulkan
dnsmasq.conf             libuser.conf    request-key.conf          wgetrc
dnsmasq.d                locale.conf     request-key.d             wireplumber
dracut.conf              localtime       resolv.conf               wpa_supplicant
dracut.conf.d            login.defs      rocky-release             X11
egl                      logrotate.conf  rocky-release-upstream    xattr.conf
enscript.cfg             logrotate.d     rpc                       xdg
environment              lsm             rpm                       xml
ethertypes               lvm             rsyncd.conf               yum
exports                  machine-id      rsyslog.conf              yum.conf
favicon.png              magic           rsyslog.d                 yum.repos.d
filesystems              mailcap         rwtab.d
[hwang@localhost etc]$ 


