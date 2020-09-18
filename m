Return-Path: <SRS0=Zjk+=C3=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742EFC43464
	for <phone-devel@archiver.kernel.org>; Fri, 18 Sep 2020 22:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A38F21734
	for <phone-devel@archiver.kernel.org>; Fri, 18 Sep 2020 22:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRWD1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Sep 2020 18:03:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38678 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgIRWD0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Sep 2020 18:03:26 -0400
X-Greylist: delayed 545 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 18:03:25 EDT
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3C3901C0B78; Fri, 18 Sep 2020 23:54:19 +0200 (CEST)
Date:   Fri, 18 Sep 2020 23:54:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     phone-devel@vger.kernel.org
Subject: Welcome to phone-dev... and good news for Droid 4 modem
Message-ID: <20200918215418.GB7443@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Welcome to mailing list.

We should have mail list archives set up, at
https://lore.kernel.org/phone-devel/ .

And to have some real news, Droid 4's modem should be supported (using
AT commands over USB) by latest ofono.

commit 07e00b7215cd98aa033f2ebc4ff169662d95d34c (HEAD -> master, ofic/maste=
r)
Author: Pavel Machek <pavel@ucw.cz>
Date:   Tue Sep 15 15:23:25 2020 +0200

    droid 4: Add probing.
   =20
    Probe Droid 4 modem. This should result in basic support working.

I'm using this to keep the USB alive, so that incoming calls and SMSes
working. It also burns power...

# writing to ttyUSB3 eventually crashes the modem
# ttyUSB0 -- works w/o delay for an hour.
date
DEV=3D/dev/ttyUSB0
while test -e $DEV; do
  echo > $DEV
  sleep .3
  done
date

Oh and... I'm still looking for phone running mainline kernel I could
_use_. N900 is close, with exception of voice calls. Droid still waits
for patches to be merged, and needs a bit more work with SMSes (and at
least mixers).

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2UsigAKCRAw5/Bqldv6
8oqVAKC3jvf6maE56VnRWx5NruUdGA2jAACfV4Tp6MDNKEMplMOHO4ExP6UogrM=
=fnGM
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
