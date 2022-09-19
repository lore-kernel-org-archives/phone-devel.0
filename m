Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28F4ECAAA1
	for <phone-devel@archiver.kernel.org>; Mon, 19 Sep 2022 21:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiISVA1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiISVAT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Sep 2022 17:00:19 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E32B4BA7E
        for <phone-devel@vger.kernel.org>; Mon, 19 Sep 2022 14:00:15 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A2A5C3F5CC;
        Mon, 19 Sep 2022 23:00:10 +0200 (CEST)
Date:   Mon, 19 Sep 2022 23:00:08 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add Qcom PM6125 PMIC, and use in Sony Xperia
 Seine PDX201
Message-ID: <20220919210008.5i5e74bl5gxxfbnh@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
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
References: <20220919204826.215845-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919204826.215845-1-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-09-19 22:48:21, Marijn Suijten wrote:
> This series adds initial support for the PM6125 PMIC, and its power key
> handling and thermal monitoring capabilities are configured for Sony's
> PDX201 (Xperia 10II).
> 
> One patch for pm660 is included to fix a node address mismatch with its
> reg field.
> 
> Changes since v2:
> - Rebased on v6.0-rc6 to drop dependent DT patches;
> - Dropped iio patch which has already been picked into Jonathan's tree;
> - Added qcom,pm6125 compatible in new yaml-ified SPMI-PMIC dt-bindings.

And

    - Renamed `pm6125_gpio: gpios@c000` node to `gpio`;

of course, as requested by Krzysztof.

- Marijn

> 
> v2: https://lore.kernel.org/linux-arm-msm/20220805135729.1037079-1-marijn.suijten@somainline.org/T/#u
> 
> Changes since v1:
> - Dropped both pinctrl patches that have already been applied;
> - Add -us suffix to qcom,hw-settle-time properties on ADC TM5 nodes
>   (this suffix is not present on regular ADC5/VADC nodes);
> - Add -state suffix to pm6125_gpio pinctrl nodes;
> - Use PMIC_GPIO_FUNC_NORMAL instead of the string-literal "normal";
> - Removed #address-cells and #size-cells from empty pmic@1 node;
> - Removed ADC5_AMUX_THM3 / ADC5_GPIO2_100K_PU channels from the ADC5
>   patch, these are unused on my board and hence untested.
> 
> v1: https://lore.kernel.org/phone-devel/20220511220613.1015472-1-marijn.suijten@somainline.org/T/#u
> 
> Marijn Suijten (5):
>   dt-bindings: mfd: qcom-spmi-pmic: Add pm6125 compatible
>   arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
>   arm64: dts: qcom: Add PM6125 PMIC
>   arm64: dts: qcom: sm6125-seine: Include PM6125 and configure PON
>   arm64: dts: qcom: sm6125-seine: Configure additional trinket
>     thermistors
> 
>  .../bindings/mfd/qcom,spmi-pmic.yaml          |   1 +
>  arch/arm64/boot/dts/qcom/pm6125.dtsi          | 154 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm660.dtsi           |   2 +-
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 162 +++++++++++++++++-
>  4 files changed, 317 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm6125.dtsi
> 
> --
> 2.37.3
> 
