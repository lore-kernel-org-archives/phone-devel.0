Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE9351C13
	for <phone-devel@vger.kernel.org>; Tue, 25 Aug 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670827; cv=none; b=m+TfH5hrGOLeqllSd8Q3FTh/hdxQUNrxSxeIDikrIe+U/PJ0sV2iFBRWYNSBKUqKvY107e18+eS87uX9/kAtupUERARE/WQNJg8Ee8RE96XGDg3+zvBHxwGBUdROKAnk0iHTbsAPFnxI5VWkvO5oW8oiu/NqeFWrbYCx8OQeW7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670827; c=relaxed/simple;
	bh=XmfOOU7691N+KkQ8GiGELZKd28e5PbsBVfDhJyJipeI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qzxvrZYuqptx1K9CXuPvzV2zE4oCfpy0UhAuBAHAfZAcBDlwaO5mkznyXKU7teOuHv89/Ok8y/ote/IkG4hfoxK+B9T4NOGZ3sXINC8Lp5Z6Pyp2/mmLdi4TmI2sBAAprgH0uEl6sy7iPeEHZ4+U7NPUP6KwYj1q4fbvTd0yuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=MfpVkShX; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="MfpVkShX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787670816; x=1787930016;
	bh=U/aJMYHCzX/HFGpVzD1DHX7oE2IwL3z6Lz70PcbiJ5I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MfpVkShXz1WnJFuXXhP94YggXXX7MVP8kaAxT/h1g4gqBNGdLNF0Z6KUguFkaZiG1
	 nmf6XiL82hN/dJXdmlROCdw6aDb1tDnpxvaN7xAzhZcTLkjTuoIJq6Chimd0zK1kha
	 ptknMFU//QLh/NU0Q840Yo9F4BHNmFkF3l4VvSUlA33TWelYvx3ZnvXpAvMTgOZyf/
	 6uKDPFTEN9QOgnVv+wm4bxaJeMs2hR2Aka3sGx4Ic2OyZd2qFmqZXlYEMs/gBr6HqX
	 ODxArwzypYK99GJ+3AO/bYgaq8xcO03ljDCZ85ql8wTv1sHr7dO6sd7fvtCA7yL/Bv
	 wAYwjCI4f1ZGw==
Date: Tue, 25 Aug 2026 15:13:31 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: How to install Ubuntu Linux Server, Apache Web Server, MariaDB Database Server and phpMyAdmin
Message-ID: <sDCsZEF1dwyF1D_QPeZ8vH04TnTClhMk6dQXiHLLgWt5LTa38ZbIxWTwoe9V2vPLixRhbi2wALMn1CNinkxfyxkabMUCmYHGEnNp_xpMtwA=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: be66d210bd28b1bc10d26bd08ef8b41ccb234e84
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: How to install Ubuntu Linux Server, Apache Web Server, MariaDB Dat=
abase Server and phpMyAdmin

Good day from Singapore,

Author: Mr. Turritopsis Dohrnii Teo En Ming
Date: 25 Aug 2026 Tuesday
Time: 8.05 pm Singapore Time
Country: Singapore

Ubuntu Linux version:

Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-100-generic x86_64)

1. Enable Apache SSL

a2enmod ssl

2. Create a self-signed certificate

mkdir -p /etc/apache2/ssl

openssl req -x509 -nodes -days 3650 \
  -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/apache-selfsigned.key \
  -out /etc/apache2/ssl/apache-selfsigned.crt
 =20
3. Create the HTTPS VirtualHost

nano /etc/apache2/sites-available/selfsigned-ssl.conf

<VirtualHost *:443>
    ServerAdmin webmaster@localhost

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache-selfsigned.crt
    SSLCertificateKeyFile /etc/apache2/ssl/apache-selfsigned.key

    ErrorLog ${APACHE_LOG_DIR}/ssl-error.log
    CustomLog ${APACHE_LOG_DIR}/ssl-access.log combined
</VirtualHost>

4. Enable the HTTPS site

a2ensite selfsigned-ssl.conf

apache2ctl configtest

systemctl reload apache2

ss -lntp | grep :443

5. Open firewall port

ufw status verbose

ufw allow 'Apache Full'

ufw status

6. Stop Zabbix

killall zabbix_server

systemctl disable zabbix-server

reboot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I already have MariaDB Database server installed previously
No need to install again
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Install phpMyAdmin

apt-get update

apt install phpmyadmin

During installation, you may see configuration screens.

When asked =E2=80=9CWeb server to reconfigure automatically=E2=80=9D, selec=
t:

[*] apache2

Configure database for phpmyadmin with dbconfig-common?

Choose Yes. You'll normally be asked to create/confirm a password for phpMy=
Admin's database configuration.

2. Enable the required PHP module and restart Apache

phpenmod mbstring
systemctl restart apache2

3. Open phpMyAdmin

https://fqdn/phpmyadmin/

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Diehard hardcore PAP government supporter
25 Aug 2026 Tuesday 11.10 pm Singapore Time









