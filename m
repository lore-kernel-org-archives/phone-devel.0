Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CE4C19F2A
	for <phone-devel@archiver.kernel.org>; Thu, 11 Aug 2022 10:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbiHKKz1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 11 Aug 2022 06:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbiHKKz0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 11 Aug 2022 06:55:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055EB4E61F
        for <phone-devel@vger.kernel.org>; Thu, 11 Aug 2022 03:55:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v3so20990246wrp.0
        for <phone-devel@vger.kernel.org>; Thu, 11 Aug 2022 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ExWCBl9fGhDCvIPcALkvbkYwWxvYBhGNNpEf1C/2uYM=;
        b=MjCrpIJwRF3mtM8eZrwAkvOwP1K2yUavT0ot02kC7xWyEhWIwwEuN09UkT4uOVGkmP
         a2jH3WW7Fdn8pqLkX3o8cZsFNACShqPDC0WbBxTau00kHhOr0xzqIjpoYW5fIVzcGZFr
         jwN3h062jn8nP8xZlqS9on6EwQ0I2SqUFlVrgyKLxyWnym8o5/xaLzfgb64lI1iVPCII
         Lu8Od7qDn8rw+ZKe4SKFk57RatY4xYCSI630ZHxBMwUQfTmCpZqnE6TVNQG1lqa5SDto
         ywwAlvvrekK7TRoKpVHSXZ9MWC5NWH6kPl858eJYqsWTk2zrLlCcOFHekAd8+OeVQAwi
         RIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ExWCBl9fGhDCvIPcALkvbkYwWxvYBhGNNpEf1C/2uYM=;
        b=IufJMW1waqH7WXyBLjr52Pw5IDe1ellBN9O8r3aJef7Ea7gQegqM5ZWUYtQzOX3wgL
         TEsx+eSBVsue0FNf2e2SPNIw79O1JpivZUsjoH4t07pD4/2wW1wy6mDXLoTpiu1JIY0p
         2iILV67W5AZOSipuCkQui1MM/pDDq6qvmmSqqLfaQA8GFTAd2NOqsBzhUhRw3Y+fyrWa
         zbZKAHJeiNNUqccMir4pnZEsHUk34d7+vuJo2rx/H4db3ZMAfu5apcbTmtHj81PIfpfo
         JX1ICi15ohxMKXni6TA1Zw1YnyclWClEuMUMi+wnY31gec4lP9Du+X51sow5rc6R6iun
         R8fQ==
X-Gm-Message-State: ACgBeo0Kv8065nrkXCuAHRKkxHSnnoEovyZmzT12h/4erBMBthCqK1FJ
        DN92Xyuh/glOoNIZeYGEEkhffQ==
X-Google-Smtp-Source: AA6agR47HAxdt2d6bM0ytPKlu0xhF0jZ7swMy/rEsF1Fkq2mVzRpN2f4mlNPs/ALYeLNgRFmBWU31w==
X-Received: by 2002:a5d:6da8:0:b0:221:7db8:de0a with SMTP id u8-20020a5d6da8000000b002217db8de0amr15358016wrs.405.1660215323573;
        Thu, 11 Aug 2022 03:55:23 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c2ca700b003a4f08495b7sm5973089wmc.34.2022.08.11.03.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 03:55:23 -0700 (PDT)
Message-ID: <03ba7601-12dd-befc-eab1-14c3e9931519@linaro.org>
Date:   Thu, 11 Aug 2022 11:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] thermal: qcom: tsens-v0_1: Fix MSM8939 fourth sensor
 hw_id
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        mchen@squareup.com
References: <20220811105014.7194-1-vincent.knecht@mailoo.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220811105014.7194-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/08/2022 11:50, Vincent Knecht wrote:
> Reading temperature from this sensor fails with 'Invalid argument'.
> 
> Looking at old vendor dts [1], its hw_id should be 3 instead of 4.
> Change this hw_id accordingly.
> 
> [1] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/master/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L511
> 
> Fixes: 332bc8ebab2c ("thermal: qcom: tsens-v0_1: Add support for MSM8939")
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Fixes reading GPU temperature on msm8939 idol3 with current WIP dtsi
> ---
>   drivers/thermal/qcom/tsens-v0_1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
> index f136cb350238..327f37202c69 100644
> --- a/drivers/thermal/qcom/tsens-v0_1.c
> +++ b/drivers/thermal/qcom/tsens-v0_1.c
> @@ -604,7 +604,7 @@ static const struct tsens_ops ops_8939 = {
>   struct tsens_plat_data data_8939 = {
>   	.num_sensors	= 10,
>   	.ops		= &ops_8939,
> -	.hw_ids		= (unsigned int []){ 0, 1, 2, 4, 5, 6, 7, 8, 9, 10 },
> +	.hw_ids		= (unsigned int []){ 0, 1, 2, 3, 5, 6, 7, 8, 9, 10 },
>   
>   	.feat		= &tsens_v0_1_feat,
>   	.fields	= tsens_v0_1_regfields,

ACK we have this change in our shipping 4.19 kernel

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
