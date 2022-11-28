Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D4CC433FE
	for <phone-devel@archiver.kernel.org>; Mon, 28 Nov 2022 21:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbiK1VHf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Nov 2022 16:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbiK1VHH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Nov 2022 16:07:07 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9722A303EB;
        Mon, 28 Nov 2022 13:06:48 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 644C3D05C5;
        Mon, 28 Nov 2022 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1669669576; bh=Sa86+AagUehDF0ksSiVhkM9xysNYLZt4WDI8S+0fsCo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XpmQdM4VodA5P4jXVe2afw/JhSEqmjSUONCmpiDFPwmq3E53LHitMQ+ObA+E6FMNb
         VcPXxRzioZcflGhy+ZPWWs/C4V90ZSvwyvVC0mCOzwUZVq7AKNMKzpXbpt45piEloY
         opdFokO2xUbyX4HXCazVy8eUlduhiGCZ0fVavPSc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Enable ADSP
Date:   Mon, 28 Nov 2022 22:06:15 +0100
Message-ID: <1912229.PYKUYFuaPT@g550jk>
In-Reply-To: <cce01dbd-e2b7-3d6b-9c83-af3790f3ee89@linaro.org>
References: <20221125223400.94515-1-matti.lehtimaki@gmail.com> <90d231c6-1f16-74ea-ddf7-5e09a51a93ea@gmail.com> <cce01dbd-e2b7-3d6b-9c83-af3790f3ee89@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Montag, 28. November 2022 21:59:06 CET Konrad Dybcio wrote:
> On 28.11.2022 18:01, Matti Lehtim=E4ki wrote:
> > On 28.11.2022 16.41, Konrad Dybcio wrote:
> >> On 25.11.2022 23:34, Matti Lehtim=E4ki wrote:
> >>> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> >>> b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts index
> >>> 1c52337af560..859e91c16c61 100644
> >>> --- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> >>> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> >>> @@ -133,7 +133,8 @@ wcnss@d200000 {
> >>>               no-map;
> >>>           };
> >>>   -        adsp@d900000 {
> >>> +        /delete-node/ adsp@dc00000;
> >>=20
> >> Please delete nodes by referencing the label like so:
> >>=20
> >> /delete-node/ &adsp_region;
> >=20
> > When I created the devicetree I was asked to do the opposite for the
> > smem_region [1] which I had originally deleted using the label near top=
 of
> > the file but then moved next to the relevant node, where I cannot use
> > label when deleting it. Should the smem_region also be moved to the top
> > of the file if I move this delete-node there so the file would be
> > consistent?
> In [1] you were asked to move the delete-node statement, not to alter
> the argument. Referencing nodes by label is allowed globally in the DTS.
> The removal should stay inside reserved-memory.

Having e.g. this doesn't build, you get "syntax error" error

  reserved-memory {
      /delete-node/ &venus_region;
  };

Not sure exactly why, but that's the reason everything's outside of the roo=
t=20
node if you use labels (don't ask me why labels lead to syntax error but=20
specifying the name manually works)

>=20
> Konrad
>=20
> > [1]
> > https://lore.kernel.org/linux-arm-msm/CAA8EJpqUH_v1GXEYF62Z3DBtFu_305_h=
4D
> > 36aCnBr38bo5HoJw@mail.gmail.com/




