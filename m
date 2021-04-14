Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5389C433B4
	for <phone-devel@archiver.kernel.org>; Wed, 14 Apr 2021 22:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 926326115C
	for <phone-devel@archiver.kernel.org>; Wed, 14 Apr 2021 22:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhDNW7U (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Apr 2021 18:59:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45432 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbhDNW7M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Apr 2021 18:59:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EFE111C0B77; Thu, 15 Apr 2021 00:58:48 +0200 (CEST)
Date:   Thu, 15 Apr 2021 00:58:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Chris Talbot <chris@talbothome.com>, marcel@holtmann.org,
        denkenz@gmail.com, phone-devel@vger.kernel.org
Cc:     ofono@ofono.org
Subject: Re: Forking on MMSD
Message-ID: <20210414225848.GA28307@amd>
References: <051ae8ae27f5288d64ec6ef2bd9f77c06b829b52.camel@talbothome.com>
 <634e0debea558b90af2cebfc99518071f1d630e9.camel@talbothome.com>
 <20210414192958.GA4539@duo.ucw.cz>
 <c7ffd7e4d62e5d5ed397f69be180d81588a4cfd1.camel@talbothome.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <c7ffd7e4d62e5d5ed397f69be180d81588a4cfd1.camel@talbothome.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This is not ofono I am forking, merely MMSD.

So first, sorry, I was confused, I assumed mmsd is part of ofono.

I guess Marcel Holtmann is right person to talk to. I put him in Cc
list. I'm also Ccing Denis and phone-devel list.

> and asking about how to contact the ofono maintainers in kernelnewbies
> in IRC.=20

Well, kernelnewbies and netdev mailing list are not really right
places to ask.

> I have attempted to individually email the mmsd Authors as well as
> anyone within the past 5 years who contributed to mmsd. I simply do not
> know of any other way to contact the mmsd maintainers.

Ok, so you did quite a good job.

I still hope Marcel will reply. If not, I believe it makes sense to
ask kernel.org admins (perhaps konstantin@linuxfoundation.org ?) who
is maintainer of mmsd repository and how to reach them, or perhaps how
to take over, as it is not exactly active.

2019-07-24	ofono: Read Firmware version (Revision) for Device
2019-07-24		ofono: Read IMEI SV for Device Management
2019-07-24		ofono: Read IMEI for Device Management	Ankit
2017-07-22	wsputil: Fix fall through comment	Marcel
2017-07-22	build: Use AM_CPPFLAGS instead of INCLUDES	Marcel
2015-04-20	gdbus: Close private connection if setup fails	Luiz

Best regards and good luck,

		       	     	     		   	 	Pavel
--=20
http://www.livejournal.com/~pavelmachek

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmB3c6gACgkQMOfwapXb+vKrvgCfbtHPiQ5mSjCMY9kWaxDeADZI
+EoAnjPa6g8IWGPeqG4vIe/eaz0TAtJg
=lY8c
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
