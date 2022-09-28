Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E55C32771
	for <phone-devel@archiver.kernel.org>; Wed, 28 Sep 2022 08:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbiI1ILJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 28 Sep 2022 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiI1ILG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 28 Sep 2022 04:11:06 -0400
X-Greylist: delayed 133735 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Sep 2022 01:11:00 PDT
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0241E62A98
        for <phone-devel@vger.kernel.org>; Wed, 28 Sep 2022 01:11:00 -0700 (PDT)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1A4171F97A;
        Wed, 28 Sep 2022 10:10:57 +0200 (CEST)
Date:   Wed, 28 Sep 2022 10:10:55 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Message-ID: <20220928081055.p66huqct2wnrsrdx@SoMainline.org>
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
 <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-09-28 09:35:40, Krzysztof Kozlowski wrote:
> On 26/09/2022 21:01, Marijn Suijten wrote:
> > Document support for the pm6125, typically paired with the sm6125 SoC.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

https://lore.kernel.org/linux-arm-msm/0ec65132-7d7a-2f8d-cc16-cb76efc343d6@linaro.org/

Thanks, I thought of it this morning while browsing lore, but only got
to a screen just now so you beat me to it by ~30 minutes.

No need to lecture me on the rules, but I can't promise this won't
happen again.

- Marijn
