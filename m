Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF45C4361B
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 23:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5587423A01
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 23:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgLGXJh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Dec 2020 18:09:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:32982 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgLGXJh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Dec 2020 18:09:37 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 59AC01C0B79; Tue,  8 Dec 2020 00:08:53 +0100 (CET)
Date:   Tue, 8 Dec 2020 00:08:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] D4 after leste update: rotated touchscreen
Message-ID: <20201207230849.GA1400@amd>
References: <20201207223323.GA322@amd>
 <20201207224953.GA596@amd>
 <e5d7848f-2fdb-929f-f7b5-53687ba65685@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <e5d7848f-2fdb-929f-f7b5-53687ba65685@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> I did apt-get update/upgrade on Leste, and results are not good.
> >>
> >> It still boots, but it looks like touchscreen is "rotated" 90 degrees
> >> or so, so touches are registered at wrong places.
> >>
> >> If someone knows how to fix that, let me know.
> >=20
> > Aha, I only had partial update. elogind held some packages
> > back. I did explicit install of elogind and rebooted. Now I have black
> > screen in portrait mode, which has top overlayed with one icon. Not
> > good.
>=20
> Definitely not good.
>=20
> Do you have usbnet access? You might just need to remove a few leftover
> configuration files.

Do you have idea what files to remove? That might be easiest. I'm not
sure if I have usbnet, but I should be able to move sdcard to
different machine and modify it there.

> > Any ideas would be welcome. But I guess it is "back up and re-install
> > with fresh image"...
>=20
> there should be new images now.
>=20
> Perhaps you'd be willing to test this version (I have not tested it yet!)
>=20
> https://phoenix.maemo.org/view/Images/job/leste-image-droid4/

It depends how desperate I am :-).

Yes, I'll use latest version if I'm forced to reinstall.

Thanks for support,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/OtgAACgkQMOfwapXb+vKz5QCdGOJ7TWX76ldYOhgB+zbAOsqQ
6woAmgOXqlo9eoXQ0/nVy/wq30o9qjJv
=H5hD
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
