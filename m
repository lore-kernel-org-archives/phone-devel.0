Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA42DC77B7C
	for <phone-devel@archiver.kernel.org>; Wed, 10 May 2023 06:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbjEJGrN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 May 2023 02:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbjEJGrM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 May 2023 02:47:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3FD268D
        for <phone-devel@vger.kernel.org>; Tue,  9 May 2023 23:47:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-965f7bdab6bso1051800566b.3
        for <phone-devel@vger.kernel.org>; Tue, 09 May 2023 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683701229; x=1686293229;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H//eZGlEJS/35YEhZwhGTWp7oEUZuMDqjOLd1KsW/Dk=;
        b=je9yKiewPEqrhtPLrQqwPtxJPJwBxoylsg0o6HBvbvHaeaOCMwK2O/K63M9TCx581q
         KMMEW5t63lQuVAUf1xo+olgAm9NiF6RqPLHCm5i+3249dA9gRah3aSuUILXkeOSWeZbG
         nfU0EK3FPHsTNEA2Rzwnv+XtlWgxujJ+iefazA07nVnVP+axplHu7lDjdx8lkxhv/I1h
         z9kYI5FDwrnlSuLvF0oE2woDtXjyXIGcPgE9ii0MybB5S5nbkMhDjAd0K6pMvyE+H0pd
         xr+vKV4JEGeOhwrPDqHa3bBrM65Isgzv9dun7qEXa6Y9blruDQQRXwqOIl8ZCJ6oRCUs
         Eu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701229; x=1686293229;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H//eZGlEJS/35YEhZwhGTWp7oEUZuMDqjOLd1KsW/Dk=;
        b=OHBCyxrDZJRVYeAqR3PX4x8YbaB5hJOILjkmkeOjioP/YIp6/3EO+UKMoTDuGaBcaz
         Djxi/rTMTwZEx5sXfGCm7pDSSDptlOXDNs3JFKaom/vNoCI8C43G5Hi7ClQGViVwAzcb
         9vh8yTMWESWi24F21DKOy+uQeznIfxKcewM/2VDedsFUSHI3f97SPleAYhDd2sRYWJnz
         pC3jk+M3fERRuYysTqiWxTqtBbMejiS3V4GgWp+Yiplu2um7Be16KdLfJnm1PcQo7gqi
         uShmsHIC8bjIgbYNfpkQZxSL71cP/MLi6dgo3a+9sx9CblT0jnrMRhqKBIXPNH//c/mR
         51dQ==
X-Gm-Message-State: AC+VfDw5zFodtOzRB3Qzpw22ox9LoFTqrw3xLNMGOZEV3UKBrU0EOXqJ
        FP9HHhldzpsQTvraJT2zdwLIVQ==
X-Google-Smtp-Source: ACHHUZ6oiJs4TBNp02xqpzNHKA1CCtOPDo+5SW3bC6Ts4SsxO/AZwHbz9fCAzOA3jOsEMZHvm8MaFg==
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id xa13-20020a170906fd8d00b0094f35210394mr13259517ejb.51.1683701229329;
        Tue, 09 May 2023 23:47:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id pk25-20020a170906d7b900b00965d9892bafsm2273306ejb.111.2023.05.09.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 23:47:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 10 May 2023 08:47:07 +0200
Message-Id: <CSIE9TYTQUHL.3E769C2Y4RAAO@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm7250b: make SID configurable
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>
X-Mailer: aerc 0.15.1
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
 <20230407-pm7250b-sid-v1-2-fc648478cc25@fairphone.com>
 <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
In-Reply-To: <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Krzysztof,

On Fri Apr 7, 2023 at 10:27 AM CEST, Krzysztof Kozlowski wrote:
> On 07/04/2023 09:45, Luca Weiss wrote:
> > Like other Qualcomm PMICs the PM7250B can be used on different addresse=
s
> > on the SPMI bus. Use similar defines like the PMK8350 to make this
> > possible.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dt=
s/qcom/pm7250b.dtsi
> > index daa6f1d30efa..eeb476edc79a 100644
> > --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > @@ -7,6 +7,15 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/spmi/spmi.h>
> > =20
> > +/* This PMIC can be configured to be at different SIDs */
> > +#ifndef PM7250B_SID
> > +	#define PM7250B_SID 2
>
> Drop indentation, although anyway I am against this. Please don't bring
> new patterns of this at least till we settle previous discussion.
>
> https://lore.kernel.org/linux-arm-msm/46658cbb-fff5-e98b-fdad-88fa683a9c7=
5@linaro.org/

What's the outcome of the discussion? For this PMIC it's totally enough
to have the SID configurable like in this patch, I don't think this PMIC
will be included twice in a board - at least I'm not aware of such a
configuration.

Regards
Luca

>
>
> Best regards,
> Krzysztof

