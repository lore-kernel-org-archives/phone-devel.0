Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8565C43381
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 17:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8549A23B4B
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 17:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbhANR6f (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 12:58:35 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:51809 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbhANR61 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 12:58:27 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1958C1F534;
        Thu, 14 Jan 2021 18:57:45 +0100 (CET)
Subject: Re: [PATCH 1/3] phy: qcom-qusb2: Allow specifying default clock
 scheme
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
References: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
 <YACE+uWidV6xzAwC@builder.lan>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <28bb9e1e-909a-1559-af62-bc99b6e960ec@somainline.org>
Date:   Thu, 14 Jan 2021 18:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YACE+uWidV6xzAwC@builder.lan>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Il 14/01/21 18:52, Bjorn Andersson ha scritto:
> On Thu 14 Jan 11:47 CST 2021, AngeloGioacchino Del Regno wrote:
> 
>> The TCSR's PHY_CLK_SCHEME register is not available on all SoC
>> models, but some may still use a differential reference clock.
>>
>> In preparation for these SoCs, add a se_clk_scheme_default
>> configuration entry and declare it to true for all currently
>> supported SoCs (retaining the previous defaults.
>>
>> This patch brings no functional changes.
>>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 

Thanks!! :)

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index 109792203baf..8fcfea2a8f1f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -245,6 +245,9 @@ struct qusb2_phy_cfg {
>>   
>>   	/* true if PHY has PLL_CORE_INPUT_OVERRIDE register to reset PLL */
>>   	bool has_pll_override;
>> +
>> +	/* true if PHY default clk scheme is single-ended */
>> +	bool se_clk_scheme_default;
>>   };
>>   
>>   static const struct qusb2_phy_cfg msm8996_phy_cfg = {
>> @@ -253,6 +256,7 @@ static const struct qusb2_phy_cfg msm8996_phy_cfg = {
>>   	.regs		= msm8996_regs_layout,
>>   
>>   	.has_pll_test	= true,
>> +	.se_clk_scheme_default = true,
>>   	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
>>   	.mask_core_ready = PLL_LOCKED,
>>   	.autoresume_en	 = BIT(3),
>> @@ -266,6 +270,7 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
>>   	.disable_ctrl   = POWER_DOWN,
>>   	.mask_core_ready = CORE_READY_STATUS,
>>   	.has_pll_override = true,
>> +	.se_clk_scheme_default = true,
>>   	.autoresume_en   = BIT(0),
>>   	.update_tune1_with_efuse = true,
>>   };
>> @@ -279,6 +284,7 @@ static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
>>   			   POWER_DOWN),
>>   	.mask_core_ready = CORE_READY_STATUS,
>>   	.has_pll_override = true,
>> +	.se_clk_scheme_default = true,
>>   	.autoresume_en	  = BIT(0),
>>   	.update_tune1_with_efuse = true,
>>   };
>> @@ -701,8 +707,13 @@ static int qusb2_phy_init(struct phy *phy)
>>   	/* Required to get phy pll lock successfully */
>>   	usleep_range(150, 160);
>>   
>> -	/* Default is single-ended clock on msm8996 */
>> -	qphy->has_se_clk_scheme = true;
>> +	/*
>> +	 * Not all the SoCs have got a readable TCSR_PHY_CLK_SCHEME
>> +	 * register in the TCSR so, if there's none, use the default
>> +	 * value hardcoded in the configuration.
>> +	 */
>> +	qphy->has_se_clk_scheme = cfg->se_clk_scheme_default;
>> +
>>   	/*
>>   	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
>>   	 * clock scheme is selected. If yes, then disable differential
>> -- 
>> 2.29.2
>>

