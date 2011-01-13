%define version 1.0.8.20110113

License: MPL LGPL
Name: ispcp-omega
Version: %{version}
Release: 0%{dist}
URL: http://isp-control.net/
Source: ispcp-omega-%{version}.tar.gz
Summary: IspCP omega web hosting panel
Group: System/Management
Packager: George Machitidze <giomac@gmail.com>
Buildroot: $RPM_BUILD_ROOT/tmp/ispcp/
Buildrequires: glibc-headers gcc
Requires: amavisd-new awstats bind-chroot bind-utils bzip2 caching-nameserver chkrootkit
Requires: clamav clamav-data clamav-lib clamav-server clamav-update courier-authlib-userdb courier-authlib-mysql 
Requires: courier-imap cpan2rpm cyrus-sasl-gssapi cyrus-sasl-plain cyrus-sasl-md5 cyrus-sasl-ntlm 
Requires: expect gcc httpd iptables libdbi-dbd-mysql libmcrypt libtool-ltdl mod_perl mod_ssl mod_auth_mysql 
Requires: mysql-server patch perl-Archive-Tar perl-Archive-Zip perl-BerkeleyDB perl-Bit-Vector perl-Carp-Clan 
Requires: perl-Compress-Zlib perl-Convert-TNEF perl-Convert-UUlib perl-Crypt-Blowfish perl-Crypt-CBC perl-Crypt-DH
Requires: perl-Crypt-PasswdMD5 perl-Date-Calc perl-DateManip perl-DBD-MySQL perl-Digest-HMAC perl-HTML-Parser
Requires: perl-HTML-Tagset perl-MIME-tools perl-IO-stringy perl-libwww-perl perl-MailTools perl-Net-CIDR-Lite
Requires: perl-Net-DNS perl-Net-IP perl-Net-LibIDN perl-Net-Netmask perl-Net-Server perl-SNMP_Session
Requires: perl-TermReadKey perl-Term-ReadPassword perl-TimeDate perl-URI perl-Unix-Syslog php php-bcmath php-dba php-gd
Requires: php-ldap php-mbstring php-mcrypt php-mysql php-odbc php-pear php-snmp php-xml postfix proftpd-mysql
Requires: rkhunter spamassassin system-config-bind tar unixODBC unzip wget
Requires: mod_fcgid perl-HTML-Mason perl-Text-Aspell perl-XML-DOM perl-XML-Parser postgrey perl-File-Copy-Recursive
Requires: cyrus-sasl-sql postgrey perl-File-MimeInfo
Provides: perl(ispcp-db-keys.pl) perl(ispcp_common_code.pl) perl(ispcp_common_methods.pl)  perl(ispcp-setup-methods.pl) perl(ispcp-load-db-keys.pl) perl(..::ispcp-load-db-keys.pl)
Buildarch: x86_64 i386

%description
IspCP is a project founded to build a Multi Server Control and Administration Panel.

%package pma
Summary: IspCP omega phpMyAdmin
Requires: ispcp-omega
Buildarch: noarch

%description pma
phpmyadmin for ispcp-omega

%package webmail
Summary: IspCP omega squirrelmail
Requires: ispcp-omega
Buildarch: noarch

%description webmail
webmail for ispcp-omega

%package filemanager
Summary: IspCP omega FTP file manager
Requires: ispcp-omega
Buildarch: noarch

%description filemanager
filemanager for ispcp-omega

%prep

%setup -q
rm -rf $RPM_BUILD_ROOT
#mkdir `pwd`/test/
#INST_PREF=`pwd`/test make -f Makefile.fedora install
INST_PREF=$RPM_BUILD_ROOT make -f Makefile.fedora install

%install
#cp -a `pwd`/test/* $RPM_BUILD_ROOT/ 
find $RPM_BUILD_ROOT/var/www/ispcp/gui/ -type d -exec chmod 555 "{}" ';'
find $RPM_BUILD_ROOT/var/www/ispcp/gui/ -type f -exec chmod 444 "{}" ';'
chmod -R 755 $RPM_BUILD_ROOT/var/www/ispcp/gui/tools/webmail/data
chmod -R 777 $RPM_BUILD_ROOT/var/www/ispcp/gui/tools/filemanager/temp
chmod -R 644 $RPM_BUILD_ROOT/var/www/ispcp/gui/themes/user_logos/*
chmod 755 $RPM_BUILD_ROOT/var/www/ispcp/gui/themes/user_logos
chmod -R 755 $RPM_BUILD_ROOT/var/www/ispcp/gui/phptmp
mkdir -p $RPM_BUILD_ROOT/var/www/ispcp/skel
chown 3001:mail $RPM_BUILD_ROOT/var/www/ispcp/engine/messenger/*
mkdir -p $RPM_BUILD_ROOT/etc/httpd/vhosts/
echo 'include vhosts/*.conf' >> $RPM_BUILD_ROOT/etc/httpd/conf.d/ispcp-vhosts-include.conf
echo 'options=\"--inet=127.0.0.1:10023\"' > /etc/sysconfig/postgrey
mkdir -p $RPM_BUILD_ROOT/var/www/fcgi/master

%pre
echo "Creating vu2000 virtual user and group: "
groupadd -g 2000 vu2000
useradd -g 2000 -u 2000 -s /bin/false vu2000
echo "Creating vmail virtual user: "
useradd -d /home/vmail -c vmail-user -g mail -u 3001 -s /bin/false vmail

%post
#ln -s /var/named/chroot/var/named/data /var/named/data
touch /etc/sasldb2
mkdir /var/spool/postfix/etc
cp -p /etc/sasldb2 /var/spool/postfix/etc/sasldb2
chmod +x /etc/init.d/ispcp_*
echo "ROOTDIR=\"/var/named/chroot\"" >> /etc/sysconfig/named
echo "include \"/etc/named-ispcp.conf\";" >> /etc/named.conf
/sbin/chkconfig --add ispcp_daemon
/sbin/chkconfig --add ispcp_network
/sbin/chkconfig --add proftpd-ispcp
echo "Recreating vu2000 virtual user and group"
userdel -f -r vu2000
rm -rf /home/vu2000
groupadd -g 2000 vu2000
useradd -k /var/www/ispcp/skel -d /var/www/fcgi/master/ -c vu-master -g 2000 -u 2000 -s /bin/false -m vu2000
echo "Recreating vmail virtual user"
userdel -f -r vmail
rm -rf /home/vmail
useradd -k /var/www/ispcp/skel -d /home/vmail -c vmail-user -g mail -u 3001 -s /bin/false -m vmail
/sbin/chkconfig ispcp_daemon off
/sbin/chkconfig ispcp_network off
/sbin/chkconfig proftpd off
/sbin/chkconfig proftpd-ispcp on
/sbin/service proftpd stop
#/sbin/chkconfig httpd on
#/sbin/chkconfig proftpd on
#/sbin/chkconfig spamassassin on
#/sbin/chkconfig courier-authlib on
#/sbin/chkconfig named on
#/sbin/chkconfig postgrey on
#/sbin/chkconfig mysqld on
#/sbin/chkconfig courier-authlib on
#/sbin/chkconfig saslauthd on
chmod o+x /var/spool/authdaemon
chmod 777 /usr/sbin/authdaemond
if [ -f /usr/lib/sasl2/smtpd.conf ]
then
    cp -p /usr/lib/sasl2/smtpd.conf /usr/lib/sasl2/smtpd.conf.orig
    echo "pwcheck_method: authdaemond" > /usr/lib/sasl2/smtpd.conf
    echo "authdaemond_path:/var/spool/authdaemon/socket" >> /usr/lib/sasl2/smtpd.conf
    echo "mech_list: plain login" >> /usr/lib/sasl2/smtpd.conf
fi
if [ -f /usr/lib64/sasl2/smtpd.conf ]
then
    cp -p /usr/lib64/sasl2/smtpd.conf /usr/lib64/sasl2/smtpd.conf.orig
    echo "pwcheck_method: authdaemond" > /usr/lib64/sasl2/smtpd.conf
    echo "authdaemond_path:/var/spool/authdaemon/socket" >> /usr/lib64/sasl2/smtpd.conf
    echo "mech_list: plain login" >> /usr/lib64/sasl2/smtpd.conf
fi
/sbin/service   saslauthd start
cp -p /etc/named.conf /etc/named.conf.orig
sed 's/127.0.0.1/any/g' /etc/named.conf > /etc/named.conf
sed 's/listen-on-v6/\/\/listen-on-v6/g' /etc/named.conf > /etc/named.conf
#service named restart
#service spamassassin restart
#service postgrey restart
#service httpd start
#service ispcp_daemon start 
#service ispcp_network start
echo "Configure and run mysql server with root user and password:"
echo "start mysql server and then run mysql_secure_installation"
echo "after cd /var/www/ispcp/engine/setup/ and then run ./ispcp-setup with -rpm switch"

%postun
if [ -f /etc/init.d/ispcp_daemon ]
then
    /sbin/chkconfig --del ispcp_daemon
fi

if [ -f /etc/init.d/ispcp_network ]
then
    /sbin/chkconfig --del ispcp_network
fi


%files
%defattr(-,root,root)
%config	%{_sysconfdir}/init.d/ispcp*
%config	%{_sysconfdir}/init.d/proftpd-ispcp
#%config(noreplace) %{_sysconfdir}/courier/userdb
%config	%{_sysconfdir}/httpd/conf.d/*ispcp*
%dir	%{_sysconfdir}/httpd/vhosts/
%config	%{_sysconfdir}/logrotate.d/ispcp
%attr(-,root,vu2000)	%config(noreplace)	%{_sysconfdir}/ispcp/ispcp.conf
%config	%{_sysconfdir}/ispcp/apache
%config	%{_sysconfdir}/ispcp/awstats
%config	%{_sysconfdir}/ispcp/bind
%config	%{_sysconfdir}/ispcp/courier
%config	%{_sysconfdir}/ispcp/cron.d
%config	%{_sysconfdir}/ispcp/database
%config	%{_sysconfdir}/ispcp/fcgi
%config	%{_sysconfdir}/ispcp/pma
%config	%{_sysconfdir}/ispcp/postfix
%config	%{_sysconfdir}/ispcp/proftpd
%config %{_sysconfdir}/ispcp/proftpd/proftpd.conf
%config	%{_sysconfdir}/sysconfig/proftpd-ispcp
%config(noreplace)	%{_sysconfdir}/postfix
%config	%{_sysconfdir}/proftpd.conf.ispcp
%config	%{_sysconfdir}/proftpd/ispcp/root_domain.conf
	%{_sbindir}/maillogconvert.pl
%dir	%{_localstatedir}/log/httpd/backup
%attr(-,vmail,mail)	%dir	%{_localstatedir}/log/ispcp/ispcp-arpl-msgr
%dir	%{_localstatedir}/mail/virtual/
	%{_localstatedir}/www/awstats/
%attr(-,vu2000,vu2000)	%{_localstatedir}/www/fcgi
%dir	%{_localstatedir}/www/ispcp/
	%{_localstatedir}/www/ispcp/daemon/
%attr(-,-,-)	%{_localstatedir}/www/ispcp/engine/
%attr(0555,vu2000,apache)	%dir %{_localstatedir}/www/ispcp/gui/
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/a*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/c*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/d*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/e*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/f*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/i*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/l*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/o*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/p*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/r*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/themes*
%attr(-,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/tools/index.php
%attr(0755,vu2000,apache)	%{_localstatedir}/www/virtual
	%{_localstatedir}/www/scoreboards/

%files pma
%attr(0555,vu2000,apache)	%dir %{_localstatedir}/www/ispcp/gui/tools/pma
%attr(0555,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/tools/pma/*

%files filemanager
%attr(0555,vu2000,apache)	%dir %{_localstatedir}/www/ispcp/gui/tools/filemanager
%attr(0555,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/tools/filemanager/*

%files webmail
%attr(0555,vu2000,apache)	%dir %{_localstatedir}/www/ispcp/gui/tools/webmail
%attr(0555,vu2000,apache)	%{_localstatedir}/www/ispcp/gui/tools/webmail/*

%changelog
* Thu Jan 13 2011 George Machitidze <giomac@gmail.com> 1.0.8.20110113-0.fc14
- Update to trunk
- Many enhancements and fixes
- Package separation for phpMyadmin, filemanager and squirrelmail

* Mon Aug 31 2009 George Machitidze <giomac@gmail.com> 1.0.3.20090831-0.6.fc11
- Update to trunk

* Fri Aug 28 2009 George Machitidze <giomac@gmail.com> 1.0.3.20090828-0.5.fc11
- Update to trunk

* Sun Aug 23 2009 George Machitidze <giomac@gmail.com> 1.0.2.20090822-0.2.fc11
- More fixes, update to 1.0.2

* Fri Aug 14 2009 George Machitidze <giomac@gmail.com> 1.0.1-0.fc11
- Corrected some issues, better compatibility for fedora

* Wed Apr 1 2009 George Machitidze <giomac@gmail.com> 1.0.0-0.fc10
- First test build

