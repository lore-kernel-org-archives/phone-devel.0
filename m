Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B6EECAAA1
	for <phone-devel@archiver.kernel.org>; Mon, 12 Sep 2022 06:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiILGua (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 12 Sep 2022 02:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiILGu1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 12 Sep 2022 02:50:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF2E183AE
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 23:50:24 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r18so17849008eja.11
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=xZBOwNESCEJeEq+vLfcgL2fVk6vfsvOgXDG6N/bBa6c=;
        b=aCnY/rISi56RQ4sPzM0j9ja3twfV0iGOd9cV/JuLqIummpMz4IEIARe/FDf6qXzmN3
         CdVzUiENGT5wqRSyGJ0M26+ILsRG6vRnq4JD+hI8p8uSa/KCefW+1nb5qkbPLVqdCojC
         PHsvUPwW9R2B8aBXprG+bfV2UmqgyqeOH2BQw4XAnqmIgAK7MWZXodrKksGTx8M13g7Y
         hFJTaFFX8wB6O86V02Lti3xfygV96CZqQm1NMlQJh3AV1+gqzHWCLMufuRplAHgEWk44
         LV0YpeGE/AOz/GSq686GotC+XGfn1TGtk62thgIe6Sqtr4bDY6v8NivbUscfxTN7Gci0
         yLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=xZBOwNESCEJeEq+vLfcgL2fVk6vfsvOgXDG6N/bBa6c=;
        b=ODlAYc/UVasyOwD97zsgxl632m3hpoGFHQEfu+3F47GqgltV3LQXCVrZGVIGcA7kvc
         oc4loY6ZImeW61t7pGB3QPFl4YbcEOREPlU+SP13XBODIpeqxbxLT4VY++nOiisUjLNZ
         vA0j6ToPm1gFusykhRzo5JtXC2Tg3KqlDi85ZuprQdrO/zCE8wm1PFqWFrppF/OviY/2
         jOkBZzFYEr0HvZdpFSIS3OWblYRQSqnucG7XxTgAZtPxt0C4LiOmlaNfII1kRVZq0MuK
         1IjeGARPQl3jmF9mmPdlKhFV3DrqJHJyYHI0YLmggTgiVILz5nqyB7Kf7L+WcccAc0HI
         hzIQ==
X-Gm-Message-State: ACgBeo3SY0xT8lZ5WImeSF/LYe/88y3fAT9J/i90g2dV+12KZmrQaGY2
        qsx01lfg64uBgDigwdWhrME5ow==
X-Google-Smtp-Source: AA6agR5N3rC7lPJBRa2z0wfQhvNsQktDqbdv2Xr/KHg5grU1X4tND818Jy3MzYr9U1yU0pi+RAlq+A==
X-Received: by 2002:a17:907:868f:b0:730:bc1f:a8d8 with SMTP id qa15-20020a170907868f00b00730bc1fa8d8mr18280757ejc.106.1662965422709;
        Sun, 11 Sep 2022 23:50:22 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709064b0900b0073d218af237sm3920973eju.216.2022.09.11.23.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 23:50:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 12 Sep 2022 08:50:21 +0200
Message-Id: <CMU81K51YF5E.4KH2T53ZEIKW@otso>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.11.0
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
 <20220909143950.GA992904-robh@kernel.org>
In-Reply-To: <20220909143950.GA992904-robh@kernel.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Rob,

On Fri Sep 9, 2022 at 4:39 PM CEST, Rob Herring wrote:
> On Mon, Jan 03, 2022 at 08:43:48AM +0100, Luca Weiss wrote:
> > Convert the PDC interrupt controller bindings to YAML.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes since v1:
> > * Adjust description of second reg-name as suggested by Maulik Shah
> >=20
> > @Rob Herring: Hope it's ok to keep your R-b given the above changes
> >=20
> > This patch depends on the following patch, which fixed sm8250 & sm8350
> > compatibles and adds sm6350.
> > https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss=
@fairphone.com/
> >=20
> >  .../interrupt-controller/qcom,pdc.txt         | 77 -----------------
> >  .../interrupt-controller/qcom,pdc.yaml        | 86 +++++++++++++++++++
> >  2 files changed, 86 insertions(+), 77 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/qcom,pdc.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/qcom,pdc.yaml
>
> In checking top compatibles without schemas[1][2], I found this. Now=20
> applied with sm8150 compatible which was the only change since this.

Thanks for digging this out, I have totally forgotten about it!

Regards
Luca

>
> Rob
>
> [1] https://gitlab.com/robherring/linux-dt/-/jobs/3005191129
> [2] https://gitlab.com/robherring/linux-dt/-/jobs/3005191129/artifacts/fi=
le/all-compatible-warnings.log

