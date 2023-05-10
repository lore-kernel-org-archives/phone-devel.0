Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE57DC7EE24
	for <phone-devel@archiver.kernel.org>; Wed, 10 May 2023 08:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbjEJIfs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 May 2023 04:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbjEJIfI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 May 2023 04:35:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFF37A9D
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 01:34:44 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bd875398dso10541344a12.1
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683707681; x=1686299681;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/oSM3NDo7yCUuuUmfzMkN8De2E+eLR51o10BvRa8Cg=;
        b=iO5VscEjOdvzjd/aAllbGT8Mmj/rT0DclWpe6PYn6QbI3AuBaBPMeeBf2RxZxjKjBx
         wWjdGt3MyWDWWsatOGNuatv0rvxdT0xotxx6eh4vBxwPosrp8R38lzl0auTwSbD9Yp+5
         VlHh2nn4wFqs5bsUrz2BC+oKWmvdcdeqmQLUq9njJnDyEWhPo1ZAg9pwyHP5EpnVPkWR
         lS0057sYBJiUd68K7pj4L+hCw2YXbJflqFqM+l2ZzCYovzw2ndcPVVcxnG3N1n7SetHe
         +G+NOJHK2F6kCVMO7ISq8Vb7SxspuLxzBUcvk5wTkFEiBQ4I/LtHrHoJybPjlKdFBVf1
         RB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707681; x=1686299681;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/oSM3NDo7yCUuuUmfzMkN8De2E+eLR51o10BvRa8Cg=;
        b=Hoqw/hMkA/bfr6/fCGfnRJ1ZrxLAeiYWELuqh1Odav5UUaEYWlirpUYv9pbg3w5V1Q
         OlklZE68IWojyXYN9nO/NWRYQbvrOLn9sPQNWn7f5U0mw1hGeYiw6aMABbTtrZfqU350
         7gqg8Kscij+gQ2DefRjd1nI+J+qTVpQyBt7Ok+A3b7GDGlm8SCpilVUTM0XzdOudnMVb
         v8DAo9c3xE+09D+2zHDsqF/O4UmU76jvcxisRxXBsbw3VbKkaF+dI2x3/uLavnjSwDFU
         7pvAaoU6VmG14Dy44FOb8SNHRU0qjSaF0rbw0MlcJy2nD2GmvY08Ged6mlVf5K6pHOHQ
         yByg==
X-Gm-Message-State: AC+VfDwhdxOf1oTAFr2sxMam/NTx5XegN3oM9CnDa4Ha6Mw5EG6hw8RM
        Xg4ShRZyMVA4CqMs4e1Alf2c9Q==
X-Google-Smtp-Source: ACHHUZ4PrLt6E4LujoxA4KMX4/KwC76+UUiP2JWThIIqR1/5kBjKDAPctDKTxoXKI7tW7uFvUGSxaw==
X-Received: by 2002:a17:907:928b:b0:966:2123:e0c3 with SMTP id bw11-20020a170907928b00b009662123e0c3mr10553473ejc.15.1683707680984;
        Wed, 10 May 2023 01:34:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jy17-20020a170907763100b00969dc13d0b1sm2063951ejc.43.2023.05.10.01.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:34:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 10 May 2023 10:34:39 +0200
Message-Id: <CSIGK60CQSD8.1Q4SOANJRMASF@otso>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm7250b: make SID configurable
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: aerc 0.15.1
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
 <20230407-pm7250b-sid-v1-2-fc648478cc25@fairphone.com>
 <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
 <CSIE9TYTQUHL.3E769C2Y4RAAO@otso>
 <c9eea8ec-b289-334c-9c0b-7c992184a265@linaro.org>
 <CAA8EJpoSpytSTm=y7oPD_SC+0-bd735KEczR1JgMc7RuMZ+A+g@mail.gmail.com>
In-Reply-To: <CAA8EJpoSpytSTm=y7oPD_SC+0-bd735KEczR1JgMc7RuMZ+A+g@mail.gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed May 10, 2023 at 10:07 AM CEST, Dmitry Baryshkov wrote:
> On Wed, 10 May 2023 at 09:55, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 10/05/2023 08:47, Luca Weiss wrote:
> > > Hi Krzysztof,
> > >
> > > On Fri Apr 7, 2023 at 10:27 AM CEST, Krzysztof Kozlowski wrote:
> > >> On 07/04/2023 09:45, Luca Weiss wrote:
> > >>> Like other Qualcomm PMICs the PM7250B can be used on different addr=
esses
> > >>> on the SPMI bus. Use similar defines like the PMK8350 to make this
> > >>> possible.
> > >>>
> > >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++-------
> > >>>  1 file changed, 16 insertions(+), 7 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boo=
t/dts/qcom/pm7250b.dtsi
> > >>> index daa6f1d30efa..eeb476edc79a 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > >>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > >>> @@ -7,6 +7,15 @@
> > >>>  #include <dt-bindings/interrupt-controller/irq.h>
> > >>>  #include <dt-bindings/spmi/spmi.h>
> > >>>
> > >>> +/* This PMIC can be configured to be at different SIDs */
> > >>> +#ifndef PM7250B_SID
> > >>> +   #define PM7250B_SID 2
> > >>
> > >> Drop indentation, although anyway I am against this. Please don't br=
ing
> > >> new patterns of this at least till we settle previous discussion.
> > >>
> > >> https://lore.kernel.org/linux-arm-msm/46658cbb-fff5-e98b-fdad-88fa68=
3a9c75@linaro.org/
> > >
> > > What's the outcome of the discussion? For this PMIC it's totally enou=
gh
> > > to have the SID configurable like in this patch, I don't think this P=
MIC
> > > will be included twice in a board - at least I'm not aware of such a
> > > configuration.
> >
> > We did not reach consensus and I still disagree with complex macros or
> > macros depending on order of inclusion.
>
> I still think we should find a way to parametrise PMIC dtsi, however I
> agree with Krzysztof that complex CPP is not a way to go.

What about the macro already used in-tree and proposed with this patch?
I wouldn't say this is a "complex macro" since it's just a single number
being replaced in a few places.

Could we get this in now, and if we find a new & better way in the
future we can adjust all the dtsi upstream?
