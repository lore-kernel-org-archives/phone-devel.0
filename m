Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C14FC7EE23
	for <phone-devel@archiver.kernel.org>; Mon,  8 May 2023 11:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbjEHLdv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 May 2023 07:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbjEHLd2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 May 2023 07:33:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB0D37868
        for <phone-devel@vger.kernel.org>; Mon,  8 May 2023 04:32:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f1411e8111so4905281e87.1
        for <phone-devel@vger.kernel.org>; Mon, 08 May 2023 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683545547; x=1686137547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biNcUc6skKfEbdVuV/u6w3vEoW3OrmOcIzAgHDfIjm8=;
        b=gyBVaN4M//EKnmRj0bNXVPVBPJVTDjZnw1UHY4C3jbqN9/18jjJi/G5TWdh6XyhMyR
         v1dGu4f1j03LCqZqne+qlKtYeYAuhq+i8IYjrP1yCb98G/ecsHe258SHAIgElk49kU6A
         tRTL6YDY7bnDgg9HRxN8xfX/C/u+vck9fTKUYzpRRBv1TwhIilX3cHGuL1bVH6vXUvPV
         RmUArPHhwIlE2zNhDolCmDuv2prmQNOqYQOGPfx6Md6J6mJc93of1Nmz8/YfxOzyviFM
         Vmmdqnvoj3zYrr8PjWJQ2Z1oyQWStsgZE35HEJs9X4lb+f8wxttrw80g9vshAs+Ni/+1
         iioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545547; x=1686137547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biNcUc6skKfEbdVuV/u6w3vEoW3OrmOcIzAgHDfIjm8=;
        b=Aem2KUrArgPPUBduMffBpcw9nJd+T8aPVJiuwiRAGlatFN/DV7725nB18ydPbsv6Qz
         CfO/tFTE0MPRvVIvB5yVW/nirfAGu2hchtGhnhSIjvd6MCS1T5PvYJNKRt3gTIpVt+W5
         yBKfOZfo/4m9F9M7kNe9geGFOPKL7RI8+B97Z/MBc1JcjNtClDtNGDtNjPtdiA0SV12X
         ciuwpkl0zM8IulwB/pZlS/TJRzk3vYg7Wqkag2xCJ5Bvh3FkW5dt6AAPMcnzt9NrVECZ
         qfrXm6yYleRh2vHg2Vt/GRSID9Nps78XvSTRLdKSh3d9esc02QSImf8pEvbEg4318VVl
         yNCg==
X-Gm-Message-State: AC+VfDw/BMnI+Yi0hj2T1PeKgfgjnPhPEuwZ+iBq3z4BDsN9ToC5cQCV
        dvvkfvEHMBM3Z1SeTnRTumGOlg==
X-Google-Smtp-Source: ACHHUZ4XvzAD13OcuImAjQPBg1FlQ5kID3RDyKhf20gIUPKXUIbWW95cCNZZv0A3kCiMjqm0kjw9SQ==
X-Received: by 2002:a19:f519:0:b0:4f1:4cdc:ec03 with SMTP id j25-20020a19f519000000b004f14cdcec03mr2356828lfb.18.1683545547106;
        Mon, 08 May 2023 04:32:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w6-20020ac25986000000b004f160559d4asm851538lfn.183.2023.05.08.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:32:26 -0700 (PDT)
Message-ID: <fdb76743-de20-91c5-2edc-19dd5ead33e3@linaro.org>
Date:   Mon, 8 May 2023 14:32:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: Add OXILICX_GDSC for msm8226
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230506-msm8226-oxilicx-v1-1-52e34b94ff22@z3ntu.xyz>
 <cef7b823-451f-e98a-65d3-3e396124071a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cef7b823-451f-e98a-65d3-3e396124071a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/05/2023 10:23, Konrad Dybcio wrote:
> 
> 
> On 6.05.2023 23:20, Luca Weiss wrote:
>> On msm8226 we also have OXILICX_GDSC but we need a slighly different
>> config, with a .cxcs defined for clock but with no parent.
> Hm, on newer (a5xx+) GPUs, CX needs to be turned on first and
> to achieve that, we sometimes define it to be the GX's (also
> implicitly known as "oxili-non-CX" in before-a6xx-times) parent..
> 
> Roughly speaking CX powers the "GPU hardware owned by the broader
> SoC that may not need the GPU core clock to be up" and GX powers
> the "GPU hardware owned strictly by the GPU that needs at least some
> GPU clocks to be enabled"
> 
> Maybe 8974 simply has a bug in the driver that would do the reverse?
> Could you (and perhaps Dmitry on his shiny new 13yo board) test that
> theory, preferably on both SoCs?
> 
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -2431,6 +2431,7 @@ static struct gdsc oxili_gdsc = {
>          .pd = {
>                  .name = "oxili",
>          },
> +       .parent = &oxili_gdsc.pd,
>          .pwrsts = PWRSTS_OFF_ON,
>   };

Are you declaring oxili_gdsc to be a parent of itself?

>   
> @@ -2439,7 +2440,6 @@ static struct gdsc oxilicx_gdsc = {
>          .pd = {
>                  .name = "oxilicx",
>          },
> -       .parent = &oxili_gdsc.pd,
>          .pwrsts = PWRSTS_OFF_ON,
>   };
> 
> Konrad
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>   drivers/clk/qcom/mmcc-msm8974.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>> index 4273fce9a4a4..39ee3953567c 100644
>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>> @@ -2443,6 +2443,16 @@ static struct gdsc oxilicx_gdsc = {
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>> +static struct gdsc oxilicx_gdsc_msm8226 = {
>> +	.gdscr = 0x4034,
>> +	.cxcs = (unsigned int []){ 0x4028 },
>> +	.cxc_count = 1,
>> +	.pd = {
>> +		.name = "oxilicx",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +};
>> +
>>   static struct clk_regmap *mmcc_msm8226_clocks[] = {
>>   	[MMSS_AHB_CLK_SRC] = &mmss_ahb_clk_src.clkr,
>>   	[MMSS_AXI_CLK_SRC] = &mmss_axi_clk_src.clkr,
>> @@ -2533,6 +2543,7 @@ static struct gdsc *mmcc_msm8226_gdscs[] = {
>>   	[MDSS_GDSC] = &mdss_gdsc,
>>   	[CAMSS_JPEG_GDSC] = &camss_jpeg_gdsc,
>>   	[CAMSS_VFE_GDSC] = &camss_vfe_gdsc,
>> +	[OXILICX_GDSC] = &oxilicx_gdsc_msm8226,
>>   };
>>   
>>   static const struct regmap_config mmcc_msm8226_regmap_config = {
>>
>> ---
>> base-commit: dd9e11d6477a52ede9ebe575c83285e79e823889
>> change-id: 20230506-msm8226-oxilicx-7f3f0f8e491d
>>
>> Best regards,

-- 
With best wishes
Dmitry

