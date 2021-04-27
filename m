Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177ADC433ED
	for <phone-devel@archiver.kernel.org>; Tue, 27 Apr 2021 09:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCDC361026
	for <phone-devel@archiver.kernel.org>; Tue, 27 Apr 2021 09:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbhD0JQl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Apr 2021 05:16:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42928 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbhD0JQk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Apr 2021 05:16:40 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2ED301C0B80; Tue, 27 Apr 2021 11:15:57 +0200 (CEST)
Date:   Tue, 27 Apr 2021 11:15:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Chris Talbot <chris@talbothome.com>
Cc:     marcel@holtmann.org, denkenz@gmail.com,
        phone-devel@vger.kernel.org, ofono@ofono.org
Subject: Re: Forking on MMSD
Message-ID: <20210427091556.GA9745@amd>
References: <051ae8ae27f5288d64ec6ef2bd9f77c06b829b52.camel@talbothome.com>
 <634e0debea558b90af2cebfc99518071f1d630e9.camel@talbothome.com>
 <20210414192958.GA4539@duo.ucw.cz>
 <c7ffd7e4d62e5d5ed397f69be180d81588a4cfd1.camel@talbothome.com>
 <20210414225848.GA28307@amd>
 <a18323cb5f1bfc154826fe250a20a1023e0713f4.camel@talbothome.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <a18323cb5f1bfc154826fe250a20a1023e0713f4.camel@talbothome.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > This is not ofono I am forking, merely MMSD.
> >=20
> > So first, sorry, I was confused, I assumed mmsd is part of ofono.
>=20
> No worries! To the best of my knowledge, mmsd is a part of ofono? That
> is why I have tried to submit my patches on the Ofono Mailing list
> several times. However, for the purposes of getting MMS to work in
> Mobian/PostmarketOS/Fedora, I have only been working on mmsd.
>=20
> The "Open Source Telephony Group" is listed as the maintainers of it on
> kernel.org, which I assumed to be the Ofono group.
>=20
> > I guess Marcel Holtmann is right person to talk to. I put him in Cc
> > list. I'm also Ccing Denis and phone-devel list.
> >=20
> > > and asking about how to contact the ofono maintainers in
> > > kernelnewbies
> > > in IRC.=20
> >=20
> > Well, kernelnewbies and netdev mailing list are not really right
> > places to ask.
> >=20
>=20
> I have attempted to contact Mr. Holtmann and Mr. Kenzior individually
> (as they are listed as Authors on mmsd). However, I do know at least
> Mr. Kenzior is on the Ofono Mailing list. I believe both are on the
> Ofono IRC (guessing by the screen names). I really did not want to spam
> their personal email addresses multiple times, as I feel that is rude.
>=20
> I contacted the netdev mailing list at the advice of another developer.
>=20
> kernelnewbies=A0was a guess from myself, as I had no idea who else to
> contact to talk to folks on kernel.org and that seemed like a
> reasonable starting point.

It increasingly looks like you did right.

You still may want to contact linuxfoundations admins -- for example
Konstantin Ryabitsev <konstantin@linuxfoundation.org> .

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCH1kwACgkQMOfwapXb+vJyIACffuNY060O82r1OKiyr5DmlREe
g7QAn2+0ldWbISXPkPfxy3KJRdDW+OMz
=iTgj
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
