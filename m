Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9295EC677F1
	for <phone-devel@archiver.kernel.org>; Mon, 16 Jan 2023 20:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjAPUf4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Jan 2023 15:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbjAPUfz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Jan 2023 15:35:55 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AF42A983
        for <phone-devel@vger.kernel.org>; Mon, 16 Jan 2023 12:35:54 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0C3B11F5E0;
        Mon, 16 Jan 2023 21:35:50 +0100 (CET)
Date:   Mon, 16 Jan 2023 21:35:49 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "phy: qualcomm: usb28nm: Add MDM9607 init
 sequence"
Message-ID: <20230116203549.5jzd2olxua662n6w@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221214223733.648167-1-marijn.suijten@somainline.org>
 <Y8GY51Cfkj7o1MJs@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8GY51Cfkj7o1MJs@matsya>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2023-01-13 23:16:15, Vinod Koul wrote:
> On 14-12-22, 23:37, Marijn Suijten wrote:
> > This reverts commit 557a28811c7e0286d3816842032db5eb7bb5f156.
> > 
> > This commit introduced an init sequence from downstream DT [1] in the
> > driver.  As mentioned by the comment above the HSPHY_INIT_CFG macro for
> > this sequence:
> > 
> >     /*
> >      * The macro is used to define an initialization sequence.  Each tuple
> >      * is meant to program 'value' into phy register at 'offset' with 'delay'
> >      * in us followed.
> >      */
> > 
> > Instead of corresponding to offsets into the phy register, the sequence
> > read by the downstream driver [2] is passed into ulpi_write [3] which
> > crafts the address-value pair into a new value and writes it into the
> > same register at USB_ULPI_VIEWPORT [4].  In other words, this init
> > sequence is programmed into the hardware in a totally different way than
> > downstream and is unlikely to achieve the desired result, if the hsphy
> > is working at all.
> > 
> > An alternative method needs to be found to write these init values at
> > the desired location.  Fortunately mdm9607 did not land upstream yet [5]
> > and should have its compatible revised to use the generic one, instead
> > of a compatible that writes wrong data to the wrong registers.
> 
> Applied after adding missing subsystem tag, thanks

Thanks, it wasn't clear to me whether to suffix the title when already
included in the Revert: "phy: qualcomm: ..." title :)

- Marijn
