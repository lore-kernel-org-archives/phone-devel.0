Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CF3C2BB40
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 10:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F47623A5A
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 10:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgLHKiQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:38:16 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37806 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbgLHKiP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Dec 2020 05:38:15 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0B4A41C0BAF; Tue,  8 Dec 2020 11:37:32 +0100 (CET)
Date:   Tue, 8 Dec 2020 11:37:30 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] D4 after leste update: rotated touchscreen
Message-ID: <20201208103729.GA11631@amd>
References: <20201207223323.GA322@amd>
 <20201207224953.GA596@amd>
 <e5d7848f-2fdb-929f-f7b5-53687ba65685@wizzup.org>
 <20201207230849.GA1400@amd>
 <ebbd1c5a-71d1-f48b-78f0-f14ed7db435b@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <ebbd1c5a-71d1-f48b-78f0-f14ed7db435b@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-12-08 00:33:55, Merlijn Wajer wrote:
> On 08/12/2020 00:08, Pavel Machek wrote:
> > Hi!
> >=20
> >>>> I did apt-get update/upgrade on Leste, and results are not good.
> >>>>
> >>>> It still boots, but it looks like touchscreen is "rotated" 90 degrees
> >>>> or so, so touches are registered at wrong places.
> >>>>
> >>>> If someone knows how to fix that, let me know.
> >>>
> >>> Aha, I only had partial update. elogind held some packages
> >>> back. I did explicit install of elogind and rebooted. Now I have black
> >>> screen in portrait mode, which has top overlayed with one icon. Not
> >>> good.
> >>
> >> Definitely not good.
> >>
> >> Do you have usbnet access? You might just need to remove a few leftover
> >> configuration files.
> >=20
> > Do you have idea what files to remove? That might be easiest. I'm not
> > sure if I have usbnet, but I should be able to move sdcard to
> > different machine and modify it there.
>=20
> Make sure that this directory is empty:
>=20
> /etc/X11/xorg.conf.d/

That one was empty.

> And check that these directories have their .leste and more importantly
> their non- .leste files:
>=20
> # ls /usr/share/X11/xorg.conf.d/*.leste
> /usr/share/X11/xorg.conf.d/40-ts.conf.leste
> /usr/share/X11/xorg.conf.d/99-omap.conf.leste

But I don't have these. Let me try restoring from new .xz
image. .. aha, no, that would not be easy, as it is disk image, not
tar image.

Let me reflash and start from scratch...

xzcat maemo-leste-1.0-armhf-droid4-20201206.img.xz > /dev/sdb

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/PV2kACgkQMOfwapXb+vJpLQCgtvN0rqRaPXurst1VibZaef8I
NX4An2FhnjtlunRMO5DI8e/KMnuSft+b
=Xq5G
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
