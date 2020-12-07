Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67898C433FE
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 22:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F08239FE
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 22:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgLGWuu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Dec 2020 17:50:50 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52412 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgLGWuu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Dec 2020 17:50:50 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 202E31C0B76; Mon,  7 Dec 2020 23:49:54 +0100 (CET)
Date:   Mon, 7 Dec 2020 23:49:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] D4 after leste update: rotated touchscreen
Message-ID: <20201207224953.GA596@amd>
References: <20201207223323.GA322@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20201207223323.GA322@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I did apt-get update/upgrade on Leste, and results are not good.
>=20
> It still boots, but it looks like touchscreen is "rotated" 90 degrees
> or so, so touches are registered at wrong places.
>=20
> If someone knows how to fix that, let me know.

Aha, I only had partial update. elogind held some packages
back. I did explicit install of elogind and rebooted. Now I have black
screen in portrait mode, which has top overlayed with one icon. Not
good.

Any ideas would be welcome. But I guess it is "back up and re-install
with fresh image"...

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/OsZEACgkQMOfwapXb+vKbNgCeMIFpc4Jioh7qLXddxYeVojJR
9IgAoKDfkLdcdaA7MZD2OGyXyOObrfNa
=mpjB
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
