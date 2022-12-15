Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A094CC4332F
	for <phone-devel@archiver.kernel.org>; Thu, 15 Dec 2022 21:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiLOVGD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Dec 2022 16:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiLOVGD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Dec 2022 16:06:03 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F0A32BBA
        for <phone-devel@vger.kernel.org>; Thu, 15 Dec 2022 13:06:02 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 606363F321;
        Thu, 15 Dec 2022 22:06:00 +0100 (CET)
Date:   Thu, 15 Dec 2022 22:05:59 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8976: Declare and use SDC2 pins
Message-ID: <20221215210559.px53d22a7jsth7cx@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>, Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214232049.703484-1-marijn.suijten@somainline.org>
 <20221214232049.703484-6-marijn.suijten@somainline.org>
 <33fe1249-34b4-443b-4258-586ed8c5f0e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33fe1249-34b4-443b-4258-586ed8c5f0e6@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-12-15 14:20:30, Konrad Dybcio wrote:
> 
> 
> On 15.12.2022 00:20, Marijn Suijten wrote:
> > Add the pinctrl states for SDC2 and use them on sdhc_2 to support SD
> > Cards on the currently mainlined Sony Loire platform.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  .../qcom/msm8956-sony-xperia-loire-kugo.dts   |  6 +++
> >  .../dts/qcom/msm8956-sony-xperia-loire.dtsi   |  6 +++
> >  arch/arm64/boot/dts/qcom/msm8976.dtsi         | 45 +++++++++++++++++++
> >  3 files changed, 57 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
> > index 3fb8e23e4330..9178943e2ee1 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
> > @@ -33,3 +33,9 @@ &pm8950_l1 {
> >  	regulator-min-microvolt = <1100000>;
> >  	regulator-max-microvolt = <1300000>;
> >  };
> > +
> > +&sdc2_on_state {
> > +	data-pins {
> > +		drive-strength = <8>;
> > +	};
> > +};
> You can add a label to the data-pins subnode.

I prefer this simplicity as the sdc2_*_state labels are already
available and will be extended later with sd-cd-pins regardless. I'll
change this if others share the same opinion.

However, you're also right this way of writing makes it unclear to the
reader whether data-pins already exists or has to exist; that would not
be the case when a label is explicitly assigned to data-pins.

- Marijn
