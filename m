Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7850C4332F
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 12:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiKYMxa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 07:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKYMx3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 07:53:29 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6FB20F48
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 04:53:28 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id e13so6270986edj.7
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 04:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MW9qEDvEypwtmNeKhaakCVB5v+cR7tGbD9IvNzHyZUw=;
        b=CkqYr0u3f2/Rsjhv3hBUgSdVzrg7HoivocSQLG3BJFUAhERGyTNQM9Z0O8DyC+jcs0
         BFXPwet7kB3qJav0qH4qmYfHWZY78q6nPwAr1urIKpSQsAYds2h6Tw1EpTrd/jmtaUEd
         gPEsO/gOmVusl80JUhD7bdMFhJRbC9rl0KRLqLs3ShT6Q/aQHwmK5ZFEMfDXEjm38Fq1
         SNaSx/FWpqf4ditIO3cD+D105r8mo9djiEfY1bWtvn3vPVpkmMNg3Nh6tLZj4/wn1XJO
         H31CqjLhMdHg30Qniv1RaJARPw3fPROKl8/4+mlvJTlQasH0gbx9bxJaPnLFKNONaQYZ
         JkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MW9qEDvEypwtmNeKhaakCVB5v+cR7tGbD9IvNzHyZUw=;
        b=4bbuWimskxzTpOGDYvXg5uWXTa8jWIEdrYvQ5oFOd7Ka1EGR92KEdQGE+9UGu6eYGq
         9OB8VINWr/EIyvqt7Rocs1U8YzOX86++Os0N8e9eTYLleR42xxVwNhDR64XNpNilFeo/
         bv9BvXw7oYngpCyfNZF29zBCFDU9cSJrniArDcEki66w0MiAwcPgAmBlspNz5beapdMm
         Sbs0IbALfpxLNpn+dMyNDdkfL4u72REvyM+eNftSqw/Dgvacuikh6NXB1nSgCCwh2wyu
         671cM+weJSlcYvDMj7OmFk/t81Tom9r2GQhMr3KC7zM7oqxGgMXgbaJqyK8m+6l9j07V
         RKxQ==
X-Gm-Message-State: ANoB5pnrEkzhNvtH6AzVy/xzSelN7qVFHO+B4922IZ+PikuJvXlp9jRw
        mcCrHyTkjG+prFetV8GAG01QVQ==
X-Google-Smtp-Source: AA0mqf5DIHq5RVrb3cKy2+JrviZoyXnxfbejTJMHZXd1JAsHQOIw50ZjTBwxibzDDFX+TcPP7ZqnMg==
X-Received: by 2002:a05:6402:4515:b0:461:cf2b:627b with SMTP id ez21-20020a056402451500b00461cf2b627bmr33936125edb.73.1669380806834;
        Fri, 25 Nov 2022 04:53:26 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gu21-20020a170906f29500b007ad86f86b4fsm1525631ejb.69.2022.11.25.04.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:53:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 25 Nov 2022 13:53:25 +0100
Message-Id: <COLE3UWQCQ8R.XY36EY07DDDK@otso>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add
 sm6350 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Johan Hovold" <johan@kernel.org>
X-Mailer: aerc 0.13.0
References: <20221125092749.46073-1-luca.weiss@fairphone.com>
 <Y4CP9fwhDXsLu57Q@hovoldconsulting.com> <COLABNHBQ1DG.1PB8SDY3FW1YY@otso>
 <Y4CWoT52Q8jnm/dF@hovoldconsulting.com>
In-Reply-To: <Y4CWoT52Q8jnm/dF@hovoldconsulting.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri Nov 25, 2022 at 11:19 AM CET, Johan Hovold wrote:
> On Fri, Nov 25, 2022 at 10:55:31AM +0100, Luca Weiss wrote:
> > Hi Johan,
> >=20
> > On Fri Nov 25, 2022 at 10:50 AM CET, Johan Hovold wrote:
> > > On Fri, Nov 25, 2022 at 10:27:47AM +0100, Luca Weiss wrote:
> > > > Add the compatible describing the combo phy found on SM6350.
> > > >=20
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > ---
> > > > @Johan Hovold, I've sent this v2 as RFC because there are several t=
hings
> > > > where I have questions on how it should be done.
> > > >=20
> > > > In this patch, you can see there's cfg_ahb (&xo_board) and power-do=
mains
> > > > is not set. In msm-4.19 &gcc_usb30_prim_gdsc is only used in the
> > > > ssusb@a600000 node, or should I also add it to qmpphy?
> > >
> > > Yeah, you may need to add a platform specific section of the clocks,
> > > which appear to be different, even if I'm not sure they are currently
> > > described correctly (xo_board as cfg_ahb and "QLINK" as ref). How are
> > > they named in the vendor's dts?
> >=20
> > This is the msm-4.19 dts:
> > https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/hea=
ds/android-msm-bramble-4.19-android11-qpr1/qcom/lagoon-usb.dtsi#354
>
> 		clocks =3D <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> 			<&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> 			<&rpmhcc RPMH_QLINK_CLK>,
> 			<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> 			<&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> 		clock-names =3D "aux_clk", "pipe_clk", "ref_clk_src",
> 				"ref_clk", "com_aux_clk";
>
> So it looks like you don't need update the binding for the clocks as the
> above matches sc8280xp:
>
> 	aux
> 	ref
> 	com_aux
> 	usb3_pipe

Thanks for checking!

>
> Parent clocks (ref_clk_src) should not be included in the binding, but
> rather be handled by the clock driver. For example, see:
>
> 	https://lore.kernel.org/all/20221121085058.31213-4-johan+linaro@kernel.o=
rg/
> 	https://lore.kernel.org/all/20221115152956.21677-1-quic_shazhuss@quicinc=
.com/

So I assume you mean that I shouldn't do this:

clocks =3D <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
     <&rpmhcc RPMH_QLINK_CLK>,
     <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
     <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
clock-names =3D "aux", "ref", "com_aux", "usb3_pipe";

But for "ref" use GCC_USB3_PRIM_CLKREF_CLK? That also seems to work
fine, also if RPMH_QLINK_CLK is not used from Linux-side (checked in
debugfs).


And for the driver patch, I've discovered that this phy doesn't have
separate txa/tbx region, so dts was also wrong there. Do you know if
there's a way to test DP phy initialization without having all the USB-C
plumbing in place? Might be good to validate at least phy init works if
we're already touching all of this.

Regards
Luca

>
> > > >  .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 5 +=
++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qm=
p-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qm=
p-usb43dp-phy.yaml
> > > > index 6f31693d9868..3e39e3e0504d 100644
> > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43=
dp-phy.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43=
dp-phy.yaml
> > > > @@ -17,16 +17,18 @@ properties:
> > > >    compatible:
> > > >      enum:
> > > >        - qcom,sc8280xp-qmp-usb43dp-phy
> > > > +      - qcom,sm6350-qmp-usb3-dp-phy
> > > > =20
> > > >    reg:
> > > >      maxItems: 1
> > > > =20
> > > >    clocks:
> > > > -    maxItems: 4
> > > > +    maxItems: 5
> > > > =20
> > > >    clock-names:
> > > >      items:
> > > >        - const: aux
> > > > +      - const: cfg_ahb
> > > >        - const: ref
> > > >        - const: com_aux
> > > >        - const: usb3_pipe
> > >
> > > So this would need to be moved to an allOf: construct at the end with
> > > one section each for sc8280xp and sm6350.
> >=20
> > Ack.
>
> So no need to change this it seems.
>
> Johan

