Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC51C433E0
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 21:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33CD564E5F
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 21:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhBTVPP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 20 Feb 2021 16:15:15 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35354 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhBTVPO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 20 Feb 2021 16:15:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 330811C0B77; Sat, 20 Feb 2021 22:14:32 +0100 (CET)
Date:   Sat, 20 Feb 2021 22:14:31 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Ivan J." <parazyd@dyne.org>
Cc:     tony@atomide.com, sre@kernel.org, merlijn@wizzup.org,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] Droid4: USB host works in Leste
Message-ID: <20210220211431.GA22212@duo.ucw.cz>
References: <20201207223323.GA322@amd>
 <20201209171528.GB11203@duo.ucw.cz>
 <20210220170845.GA11787@amd>
 <20210220204110.h54nvx4mwkx3wrhz@fq>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20210220204110.h54nvx4mwkx3wrhz@fq>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-02-20 21:41:10, Ivan J. wrote:
> On Sat, Feb 20, 2021 at 06:08:45PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > I played with USB host and Maemo Leste, and it works with recently
> > packaged kernel:
> >=20
> > devuan-droid4 5.10.4 #1 SMP PREEMPT Mon Jan 18 21:56:35 UTC 2021
> >=20
> > USB devices are only detected when you plug them in. If you plug
> > dongle first, then device to the dongle, it does not work.
> >=20
> > Mouse, keyboard and mass storage seems to work.
> >=20
> > It is probably possible to charge the battery and use USB host at the
> > same time. Good.
> >=20
> > DisplayLink and USB ethernet does not, as the modules are missing.
> >=20
> > Could I get Leste to build neccessary modules? Turning phone into
> > usable desktop computer sounds like fun.
> >=20
> > I'd need:
> >=20
> > CONFIG_USB_NET_AX8817X=3Dm
> > CONFIG_DRM_UDL=3Dm
>=20
> hmm, I thought usbnet was fine in Leste.

Apparently there are many different types of usbnet devices, and I
have this one...

> I will check this soon and add these modules. By the way, for -devel
> I recently built 5.11, but I haven't changed anything in the kernel
> config.

It would be interesting to try, yes. 5.10 has various problems 5.9 did
not have (rebooting when on USB power), perhaps 5.11 has different
problems :-).

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDF7twAKCRAw5/Bqldv6
8jkHAKDCzU18md5W/F8d6WI+irX4uT7YbgCeMFJJzW6+XUmPlOkCIY3kUhb5RYY=
=gz8G
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
