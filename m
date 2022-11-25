Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D50C4321E
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 09:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKYJ5l (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 04:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiKYJ5X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 04:57:23 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D348765
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 01:55:34 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r26so3590027edc.10
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 01:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gBtKZ9zx2Pm/QswfVM6U5FT5WCTySCzVA2lRu0vZYg=;
        b=3JXZ9i2lxLnQM0cikC8NLREGele7lN/5iPmgqRvmomvdJVd3s1P/7UI9EQqxvvYwBE
         oBJSlQNCRIXmr5I5hxZQR64jdXkpc9MGz811/HU+zsLeqMMJakrZozPCtn5rQnwIA1aV
         nt0ml934Gk+/97Q0m10njwYQcAI4aJDu37TymEtxLGCuFYDUN2pCG70SELy7KD4fMDve
         lfXddNnCv7FxahMPjdYDESyYgOS9udT4V/EeNHAuiYdmKOawyu4l+i/BLGFjS6x/XKF3
         dWLU0zuE6Z7/yVTjH5sfMuP/y0ODr0gSXWKD9LffW3FHscv/Vs7QqCG+z8EOm6h56Tuu
         L+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gBtKZ9zx2Pm/QswfVM6U5FT5WCTySCzVA2lRu0vZYg=;
        b=OZWentU7XDh187CpslhTOKE+I1eRJ6FyzBWneHZorLliLwTVaz552SK0a1iTKibtq2
         1ceW2M7d4RHQioc2ZkkAIk4jgWXoTFB1kDogocA3bsVXJ6AuGA1QJHHdSwAM7szcJypL
         f41ZO/rfoTtHv2AG+mAXoHcbyBmmt+A3Ic6h1rVaV2zmGlLX4HIppGO8uxaFM8O52ewt
         ez5b6vG1paknRdxVtbRsfQh4oVAyRsDticj668eIvnezSWf6g5yuk8QkydNX1JB0H06N
         9VD9oSoaVA92LDWwoEEDebfXAq3THyXFM60Dv44/kG3uEsP3ZZr3Oyu6caxV7y2z/v+1
         rcSA==
X-Gm-Message-State: ANoB5pkazp0US+WRTCyrVpf5ndADLVVnZFeVaF7z1R/HpNVGSXLxAdbC
        K9izBjgoxuNGr81MO3hxy4YI0g==
X-Google-Smtp-Source: AA0mqf6hz+jLPZkAJZJ35vx8mMN7LAoU9iZsAgiOtesJBekuIWWL3NO2uwsFi3tIZRuuLGXsc09FIw==
X-Received: by 2002:aa7:cc8a:0:b0:464:1296:d5d4 with SMTP id p10-20020aa7cc8a000000b004641296d5d4mr33388969edt.83.1669370133372;
        Fri, 25 Nov 2022 01:55:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c991000000b004619f024864sm1568627edt.81.2022.11.25.01.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 01:55:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 25 Nov 2022 10:55:31 +0100
Message-Id: <COLABNHBQ1DG.1PB8SDY3FW1YY@otso>
To:     "Johan Hovold" <johan@kernel.org>
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
X-Mailer: aerc 0.13.0
References: <20221125092749.46073-1-luca.weiss@fairphone.com>
 <Y4CP9fwhDXsLu57Q@hovoldconsulting.com>
In-Reply-To: <Y4CP9fwhDXsLu57Q@hovoldconsulting.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Johan,

On Fri Nov 25, 2022 at 10:50 AM CET, Johan Hovold wrote:
> On Fri, Nov 25, 2022 at 10:27:47AM +0100, Luca Weiss wrote:
> > Add the compatible describing the combo phy found on SM6350.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > @Johan Hovold, I've sent this v2 as RFC because there are several thing=
s
> > where I have questions on how it should be done.
> >=20
> > In this patch, you can see there's cfg_ahb (&xo_board) and power-domain=
s
> > is not set. In msm-4.19 &gcc_usb30_prim_gdsc is only used in the
> > ssusb@a600000 node, or should I also add it to qmpphy?
>
> Yeah, you may need to add a platform specific section of the clocks,
> which appear to be different, even if I'm not sure they are currently
> described correctly (xo_board as cfg_ahb and "QLINK" as ref). How are
> they named in the vendor's dts?

This is the msm-4.19 dts:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/a=
ndroid-msm-bramble-4.19-android11-qpr1/qcom/lagoon-usb.dtsi#354

>
> It should be OK to include the power-domain also for the PHY node.

Ack.

>
> >  .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml
> > index 6f31693d9868..3e39e3e0504d 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-p=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-p=
hy.yaml
> > @@ -17,16 +17,18 @@ properties:
> >    compatible:
> >      enum:
> >        - qcom,sc8280xp-qmp-usb43dp-phy
> > +      - qcom,sm6350-qmp-usb3-dp-phy
> > =20
> >    reg:
> >      maxItems: 1
> > =20
> >    clocks:
> > -    maxItems: 4
> > +    maxItems: 5
> > =20
> >    clock-names:
> >      items:
> >        - const: aux
> > +      - const: cfg_ahb
> >        - const: ref
> >        - const: com_aux
> >        - const: usb3_pipe
>
> So this would need to be moved to an allOf: construct at the end with
> one section each for sc8280xp and sm6350.

Ack.

Thanks for the quick response!

Regards,
Luca

>
> > @@ -61,7 +63,6 @@ required:
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> >    - resets
> >    - reset-names
> >    - vdda-phy-supply
>
> Johan

