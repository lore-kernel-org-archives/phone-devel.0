Return-Path: <SRS0=B2mx=D6=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05535C55178
	for <phone-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA372225F
	for <phone-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461730AbgJWJvT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 23 Oct 2020 05:51:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49648 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461674AbgJWJvT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 23 Oct 2020 05:51:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C47371C0B77; Fri, 23 Oct 2020 11:51:14 +0200 (CEST)
Date:   Fri, 23 Oct 2020 11:51:14 +0200
From:   Pavel Machek <pavel@denx.de>
To:     jslaby@suse.cz, gregkh@linuxfoundation.org, jhovold@gmail.com,
        kernel list <linux-kernel@vger.kernel.org>, tony@atomide.com,
        phone-devel@vger.kernel.org
Subject: gsm muxing for Droid 4
Message-ID: <20201023095113.GA18590@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

a579767c1 interferes with gsmmux patches for Droid 4.

Reverting it gets the stuff to compile again in 5.10-rc0.9.

Best regards

							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+Sp5EACgkQMOfwapXb+vL4FwCaAw1tOTm7NESzUdBI3j3l2AJY
dH0AoKZeT90ELKYjHKezi407t6BH5DEJ
=HBzT
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
