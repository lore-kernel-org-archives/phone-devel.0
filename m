Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF604C433FE
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 812E323A79
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgLHLpR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Dec 2020 06:45:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44412 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgLHLpR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Dec 2020 06:45:17 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 78B131C0BD5; Tue,  8 Dec 2020 12:44:35 +0100 (CET)
Date:   Tue, 8 Dec 2020 12:44:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] D4 after leste update: rotated touchscreen
Message-ID: <20201208114435.GA5294@duo.ucw.cz>
References: <20201207223323.GA322@amd>
 <20201207224953.GA596@amd>
 <e5d7848f-2fdb-929f-f7b5-53687ba65685@wizzup.org>
 <20201207230849.GA1400@amd>
 <ebbd1c5a-71d1-f48b-78f0-f14ed7db435b@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <ebbd1c5a-71d1-f48b-78f0-f14ed7db435b@wizzup.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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
>=20
> And check that these directories have their .leste and more importantly
> their non- .leste files:
>=20
> # ls /usr/share/X11/xorg.conf.d/*.leste
> /usr/share/X11/xorg.conf.d/40-ts.conf.leste
> /usr/share/X11/xorg.conf.d/99-omap.conf.leste
>=20
> That would be my first guess.

Thanks for the help. I reflashed from the latest image, and things are
back to the working order.

I found default screen vibration way too annoying. I turned it
off... after reboot, it seems to have helped. But it still clicks
after touch, and I believe it "clicks" with the vibration motor.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX89nIwAKCRAw5/Bqldv6
8mYUAJ442nC7cvpzlMtAcZHJ6qv9O9vkXACgsyq4zS5vnzb6C6JsT+BsXBnd3BE=
=eC9t
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
