Return-Path: <SRS0=Cl2N=DC=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B75BC4363D
	for <phone-devel@archiver.kernel.org>; Fri, 25 Sep 2020 17:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEB1221741
	for <phone-devel@archiver.kernel.org>; Fri, 25 Sep 2020 17:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgIYR01 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Sep 2020 13:26:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41454 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgIYR01 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Sep 2020 13:26:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E3D0D1C0B77; Fri, 25 Sep 2020 19:26:23 +0200 (CEST)
Date:   Fri, 25 Sep 2020 19:26:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>, phone-devel@vger.kernel.org,
        maemo-leste@lists.dyne.org
Subject: Droid 4: testing mainline ofono, audio problems
Message-ID: <20200925172623.GA10885@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Would it be possible to pack mainline ofono for Droid 4? It should
have calls and outgoing SMSes working. I'd like mostly testing of
incoming SMSes.

It needs workaround for powermanagement on usb; I'm using this:

while test -e /dev/ttyUSB3; do echo > /dev/ttyUSB3; sleep .3; done

(BTW incoming SMSes over QMI are working with that workaround, too).

Oh and I'm seeing some audio problems. In particular, playing melodies
seems to work ok until I do a call; often after a call melody gets cut
after second or so. If someone knew how to debug it... let me know.=20

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX24oPwAKCRAw5/Bqldv6
8voaAKCit+q5zL0wkzZwU7luVz8x7GP7vwCfZsp2ZXxBzmbTjjj7n93ssyzWgG8=
=K6yT
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
