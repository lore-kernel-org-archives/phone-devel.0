Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02873C4361B
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 22:34:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4CBF239A1
	for <phone-devel@archiver.kernel.org>; Mon,  7 Dec 2020 22:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgLGWeI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Dec 2020 17:34:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49272 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgLGWeI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Dec 2020 17:34:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 863341C0B76; Mon,  7 Dec 2020 23:33:24 +0100 (CET)
Date:   Mon, 7 Dec 2020 23:33:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: D4 after leste update: rotated touchscreen
Message-ID: <20201207223323.GA322@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I did apt-get update/upgrade on Leste, and results are not good.

It still boots, but it looks like touchscreen is "rotated" 90 degrees
or so, so touches are registered at wrong places.

If someone knows how to fix that, let me know.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/OrbMACgkQMOfwapXb+vIOPwCdHGCeksgaQ5CB5U1y1Dwb/A4y
U20AoKgwr0h4PofH+EnFhAwybAyI/MrD
=bm7z
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
