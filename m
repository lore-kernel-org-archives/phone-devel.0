Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3C2C4320E
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 22:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2778A60F5B
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 22:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238690AbhH3WQd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 30 Aug 2021 18:16:33 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:60111 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhH3WQc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 30 Aug 2021 18:16:32 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 41C541F89E;
        Tue, 31 Aug 2021 00:15:36 +0200 (CEST)
Date:   Tue, 31 Aug 2021 00:15:34 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: qcom-msm8974: Add xo_board reference clock to
 DSI0 PHY
Message-ID: <YS1YhsT2iIj3Ydd9@Marijn-Arch-PC.localdomain>
References: <20210830175739.143401-1-marijn.suijten@somainline.org>
 <YS1NbxhPrAPIQwk3@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS1NbxhPrAPIQwk3@yoga>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2021-08-30 16:28:15, Bjorn Andersson wrote:
> On Mon 30 Aug 12:57 CDT 2021, Marijn Suijten wrote:
> 
> > According to YAML validation, and for a future patchset putting this
> > xo_board reference clock to use as VCO reference parent, add the missing
> > clock to dsi_phy0.
> > 
> 
> And just to confirm on MSM8974 "ref" is supposed to be 19.2Mhz?

Yes, the 28nm-hpm driver (unlike the 28nm-8960 driver for apq8064) uses
19.2MHz for its hardcoded VCO_REF_CLK_RATE calculations.

Perhaps we should reword the commit message to read "... add the missing
19.2MHz xo clock ...".

- Marijn

> Regards,
> Bjorn
> 
> > Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > index db4c06bf7888..96722172b064 100644
> > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > @@ -1580,8 +1580,8 @@ dsi_phy0: dsi-phy@fd922a00 {
> >  				#phy-cells = <0>;
> >  				qcom,dsi-phy-index = <0>;
> >  
> > -				clocks = <&mmcc MDSS_AHB_CLK>;
> > -				clock-names = "iface";
> > +				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
> > +				clock-names = "iface", "ref";
> >  			};
> >  		};
> >  
> > -- 
> > 2.33.0
> > 
