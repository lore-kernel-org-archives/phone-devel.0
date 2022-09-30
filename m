Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C4C4332F
	for <phone-devel@archiver.kernel.org>; Fri, 30 Sep 2022 12:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiI3Mba (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 30 Sep 2022 08:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiI3Mb3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 30 Sep 2022 08:31:29 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FF5106517
        for <phone-devel@vger.kernel.org>; Fri, 30 Sep 2022 05:31:23 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6F5AA1F67D;
        Fri, 30 Sep 2022 14:31:20 +0200 (CEST)
Date:   Fri, 30 Sep 2022 14:31:18 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: qcom-spmi-pmic: Add pm6125
 compatible
Message-ID: <20220930123118.nkmajihodvxgqdvw@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
 <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
 <20220928081055.p66huqct2wnrsrdx@SoMainline.org>
 <3f2e62f5-a6e4-7011-3f5b-29a6657eae79@linaro.org>
 <20220928082340.mkn23ersrtzb5oth@SoMainline.org>
 <2bd60261-a977-3225-8d41-4987252e6abb@linaro.org>
 <20220928154437.if3x2zf5yozhy5kt@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928154437.if3x2zf5yozhy5kt@meerkat.local>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-09-28 11:44:37, Konstantin Ryabitsev wrote:
> On Wed, Sep 28, 2022 at 10:30:00AM +0200, Krzysztof Kozlowski wrote:
> > > (Side-note: I should get accustomed to `b4 shazam` to automatically pick
> > >  this up from the list, instead of rebasing / re-applying local patches)
> > 
> > Would be nice if b4 could update patches in current branch adding the
> > tags... but git reset --hard && b4 shazam should work as well.
> 
> FYI, it can do just that using "b4 trailers -uF [msgid]". See:
> https://b4.docs.kernel.org/en/stable-0.10.y/contributor/trailers.html

That's super cool and will save a lot of time.  I'll also have to get
accustomed to `b4 prep` and `b4 send`, though typically prefer to look
at the `diff` between two `format-patch` revisions to make sure the
changelog is complete and no erratic changes made it in.

- Marijn
