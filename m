Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F22BEFF6;
	Fri,  2 Jan 2026 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767377667; cv=none; b=mQIXTwX4TUFInG2bsekvYjHuFLWx7ZcjwYDsIOIWk+ZTA7dj/4iheLZGGbCWjfzowzZTRCzPpzAnqvJXHkZaVrSyEt0rYToK2Oki0wLM9eST638i8CNcUTO9jk90WvXVwYXykavNR4rvIYj9gCsns1sVdVVLVzAnDHsjfer8/NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767377667; c=relaxed/simple;
	bh=uSrRFN4ZrLaBFdlUP6rAopD5O+/azXoCiCcmZlMOoZQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3K9xhoT4CSeKw6RzIvlUGDYieY4r1/fvL5ogHzAs/sxO3vu3ZruZPfw4PFnqpfBXw4i0gaxNOVWEz7qMq74x/5kZwrPMhVimtzNUu/GX4TYY4kS8jTNT/K7RljL4W67Ei7qKF1syfUlvbjo0KCtfr2KG0IC+3RY1bIlXn10g+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=EMFkiG0v; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="EMFkiG0v"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6D3BE1C01B5; Fri,  2 Jan 2026 19:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1767377220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=7BsNcHQSLx27DY0vfH6oTdl73ZETZlisFhrcF8oWJT4=;
	b=EMFkiG0vY/JXj9f4Qh7HUzOR4/DcHgpwtVtCEV8M0VZc5Aj4euSC1xUankwjojU7CK7pR/
	RWFGGrGMeg0UY8bRa0xWMr6gl1hHuRQrnp3c7lAT/0yUlQc6JLmctQJItvNfUbVtKijckz
	8x249mkxmxWGwZiP8VxE1jm7FLk7ptM=
Date: Fri, 2 Jan 2026 19:06:59 +0100
From: Pavel Machek <pavel@ucw.cz>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux@jrother.eu, kernel list <linux-kernel@vger.kernel.org>
Subject: mainline on Samsung S4 mini (seranoltexx), earlyfb patch?
Message-ID: <aVgJQ6PK7XiV9tGT@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mgrHqxWY2AMprDgS"
Content-Disposition: inline


--mgrHqxWY2AMprDgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm playing with S4 mini, and I can get to init/main.c:

  writel(0xffffff, (void *) 0x88100030);
  print_kernel_cmdline(saved_command_line);

I'm not sure I have right .config or pass right parameters to
mkbootimg.

I started from

commit b51f999a8ab27982c2b5ea07f963cd226058ac04 (origin/msm8227-6.19, origi=
n/HEAD)
Author: user0-07161 <user0thenyancat@proton.me>
Date:   Sun Dec 21 12:01:52 2025 +0100

    fix wifi for loganre and break wifi for others

commit 661c321a9c4bdf9ae41fc084e1f1bdb5bf338622
Author: user0-07161 <user0thenyancat@proton.me>
Date:   Sat Dec 20 22:02:23 2025 +0100

    make the charger driver compile again

commit 48f5ca0471184a7bcbe4beffb29180f7da076b91
Author: user0-07161 <user0thenyancat@proton.me>
Date:   Sat Dec 20 20:58:55 2025 +0100

    replace l22 value with the one from downstream

commit 94fd592c86d23706c60289147c8b21f73f3c7a18
Author: Julian Rother <linux@jrother.eu>
Date:   Fri Oct 24 23:29:06 2025 +0200

    Initial dts for Samsung Galaxy S4 Mini International LTE

I got config by

cp ./arch/arm/configs/qcom_msm8227_defconfig .config

and I'm attempting to boot from lk2nd

make -j 25 ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- oldconfig zImage=
 dtbs
cat arch/arm/boot/zImage arch/arm/boot/dts/qcom/qcom-msm8930-samsung-serran=
olte.dtb > kernel.bin

mkbootimg -o boot.img --pagesize 4096 --base 0x80200000 --kernel_offset 0x0=
0008000 --ramdisk_offset 0x02000000 --second_offset 0x00f00000 --tags_offse=
t 0x00000100 --kernel kernel.bin --ramdisk ../rootfs.cpio.gz --cmdline "con=
sole=3DttyMSM0,115200 earlycon"

fastboot boot boot.img

Would someone be willing to supply known-good .config and mkbootimg
parameters?

I noticed lk2nd puts framebuffer at different address, so I did:

+++ b/arch/arm/boot/dts/qcom/qcom-msm8930-samsung-serranolte.dts
@@ -27,7 +27,7 @@ chosen {
=20
        framebuffer0: framebuffer@88300000 {
                compatible =3D "simple-framebuffer";
-               reg =3D <0x88300000 0x300000>;
+               reg =3D <0x88100000 0x300000>;

=2E..but I get hang with or without that patch. I also tried
origin/msm8227-6.15 , but same results.

I attempted to debug things by enabling early access to framebuffer
and then drawing dots. That works, but I was told there's "earlyfb"
patch that would make that easier. I could not find it, so pointer
would be welcome.

Thanks and best regards,
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--mgrHqxWY2AMprDgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaVgJQwAKCRAw5/Bqldv6
8tGpAJ9oCxyN21Vc2dGV20WE0RPIjUKm3QCfebgu96fuWbvIsJICGYGq5PWbkMc=
=WNbx
-----END PGP SIGNATURE-----

--mgrHqxWY2AMprDgS--
