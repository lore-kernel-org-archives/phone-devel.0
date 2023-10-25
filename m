Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E923C0032E
	for <phone-devel@archiver.kernel.org>; Wed, 25 Oct 2023 08:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjJYIbS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbjJYIbR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Oct 2023 04:31:17 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C698812A;
        Wed, 25 Oct 2023 01:31:14 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D06001C0079; Wed, 25 Oct 2023 10:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1698222672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K5b8VxAJIn+dbIaaMO3Y3bs3x2LTJPKWvzi8/c5oplg=;
        b=eWpWdySy0HTFCZvH2BYvZXLv/Ha8APYid6FXcU+BrdCmlWfjuTVVdAStgAcBhk/vQTVCoA
        pP1qIeBnfpkhxdUaqJ7XDwqoN9PYrFZnaez1sIj7d36FwRvbydIgOyQ4mwpwaXOPsM73g9
        YkcK9hbB5LPrzgofczc+IzZm9+fLp8o=
Date:   Wed, 25 Oct 2023 10:31:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Piotr =?utf-8?Q?Mas=C5=82owski?= <piotr@maslowski.xyz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Robert Mader <robert.mader@posteo.de>,
        Guido Gunther <agx@sigxcpu.org>,
        dri-devel@lists.freedesktop.org, Hector Martin <marcan@marcan.st>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        asahi@lists.linux.dev, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
Message-ID: <ZTjSUPUKxsuIYPkC@duo.ucw.cz>
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
 <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
 <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BKsHCK/XSjafsKFw"
Content-Disposition: inline
In-Reply-To: <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


--BKsHCK/XSjafsKFw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > An orthogonal issue is labeling all of those regions. I think we should
> > start with fully obscured areas and maybe less readable ones like the
> > waterfall edges. Still, different features should live on different
> > masks =E2=80=93 even if we don't attach meaningfull labels (like 'notch=
' or
> > 'camera cutout') to them right away.
> >=20
> >=20
> > What do you all think of that? I didn't see this approach considered in
> > any of the earlier discussions, yet it seems so elegant to me. Am I
> > missing something?
>=20
> I think the unfortunate truth is that approximating notches and rounded
> corners exclusively with regular arcs at the cost of pixel accuracy is
> just such a no-brainer. Pixel masks would be pixel accurate, but there
> is no benefit compared to a slightly underfit curve.

Pixel accuracy may be important for low-resolution displays.

And... I have certain low-resolution displays in mind. There are
keyboards with individual backlights below each key.

Maybe they could/should be treated similarily to displays with
occlusions? But we'll really need to be pixel-perfect for that.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--BKsHCK/XSjafsKFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZTjSUAAKCRAw5/Bqldv6
8oFPAJ95or5A0GJeZajBk7IYau7VzJLw2QCeJzrKL+rZIklUforgWph0lEF6FCA=
=wIrJ
-----END PGP SIGNATURE-----

--BKsHCK/XSjafsKFw--
