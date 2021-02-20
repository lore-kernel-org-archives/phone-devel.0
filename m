Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1BC433E0
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 17:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8AD64EC0
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 17:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhBTRJh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 20 Feb 2021 12:09:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40374 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbhBTRJg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 20 Feb 2021 12:09:36 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A4D961C0B77; Sat, 20 Feb 2021 18:08:45 +0100 (CET)
Date:   Sat, 20 Feb 2021 18:08:45 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     tony@atomide.com, sre@kernel.org, merlijn@wizzup.org,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Droid4: USB host works in Leste
Message-ID: <20210220170845.GA11787@amd>
References: <20201207223323.GA322@amd>
 <20201209171528.GB11203@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20201209171528.GB11203@duo.ucw.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I played with USB host and Maemo Leste, and it works with recently
packaged kernel:

devuan-droid4 5.10.4 #1 SMP PREEMPT Mon Jan 18 21:56:35 UTC 2021

USB devices are only detected when you plug them in. If you plug
dongle first, then device to the dongle, it does not work.

Mouse, keyboard and mass storage seems to work.

It is probably possible to charge the battery and use USB host at the
same time. Good.

DisplayLink and USB ethernet does not, as the modules are missing.

Could I get Leste to build neccessary modules? Turning phone into
usable desktop computer sounds like fun.

I'd need:

CONFIG_USB_NET_AX8817X=3Dm
CONFIG_DRM_UDL=3Dm

Thanks and best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAxQhwACgkQMOfwapXb+vLBigCgjlj75a0ESOhA3NSvc2zuwuy0
m34An274x0NjOx+2Oy2QlceGUwPYvEv4
=D7S+
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
