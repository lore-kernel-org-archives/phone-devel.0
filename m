Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBEBC4167B
	for <phone-devel@archiver.kernel.org>; Wed,  9 Dec 2020 17:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B8E523C91
	for <phone-devel@archiver.kernel.org>; Wed,  9 Dec 2020 17:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731919AbgLIRQT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 9 Dec 2020 12:16:19 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42306 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgLIRQN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 9 Dec 2020 12:16:13 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3D9251C0B7C; Wed,  9 Dec 2020 18:15:29 +0100 (CET)
Date:   Wed, 9 Dec 2020 18:15:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: D4: Control and capslock keyboard mapping
Message-ID: <20201209171528.GB11203@duo.ucw.cz>
References: <20201207223323.GA322@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <20201207223323.GA322@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm dual booting between Leste and original ROM, and it is super
annoying... because Leste uses shift as control and capslock as shift.

Could we use shift as shift and capslock as control? That should make
keyboard behave more like original ROM and be less confusing
overall...

There is some precedent for putting control where capslock is today --
I use that setup on notebooks, sun did that (
https://deskthority.net/wiki/Sun_Type_3 ), and in fact original IBM PC
did, too: https://en.wikipedia.org/wiki/File:IBM_Model_F_XT.png

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9EGMAAKCRAw5/Bqldv6
8gWWAJ9oY4gk8riw+WngrxvnQrUYGVcOyQCfZ524UKgBGgXEraH4bme28oO8G4Y=
=5l02
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
