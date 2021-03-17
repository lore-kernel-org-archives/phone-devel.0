Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10760C433E9
	for <phone-devel@archiver.kernel.org>; Wed, 17 Mar 2021 18:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1F8164F44
	for <phone-devel@archiver.kernel.org>; Wed, 17 Mar 2021 18:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhCQSYC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 17 Mar 2021 14:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbhCQSXa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 17 Mar 2021 14:23:30 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CF7C06174A
        for <phone-devel@vger.kernel.org>; Wed, 17 Mar 2021 11:23:30 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id h3so1842822qvh.8
        for <phone-devel@vger.kernel.org>; Wed, 17 Mar 2021 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tmX1Ahb9V3sePtb5QZrdh2WMnjcseF+r4zrPIY/87P0=;
        b=JudSIsB3tY1OwDRAn7q8hOBmIE6Hjy1qoNBEGRre/XSwoESij+AS6HcIN/hmkNSNu1
         ivMM8k3skN+gbY7zrsbj0nnqggtb5NfaUMzuX5jgjpD4v8G8HoDkWmf84ubJdBIVfg/X
         90NJTN2cL1LDxvUdV+GVil5aWi4rea7wmX28xHNauSOWh69pyoekrFkAyX52D4j+muyL
         q2bnxygDzS/3jhqUuLREHC786k+nIPCdY4W69MLHMbcJQfG/ihi5CbjAYs6GJOO3W0i9
         NQhE4zxErzWw0mjt7D9ORf/XeHWrIX6dHqKw5qnrxOgZrcf5c05LKjTlHFIJYN9OzCbq
         5HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tmX1Ahb9V3sePtb5QZrdh2WMnjcseF+r4zrPIY/87P0=;
        b=L7XoQYDdU633W64RLm8kdigItoZHOr63aDbMq1m6wakwehe9R6zO7SztD0cLJSh6XG
         KqQCnd9erRoixyyETfjX5UWXuDOI+VPEmPfeZKNT0ARb4qd1KsyaKCaaDJBTyzrlT05j
         AR4mSisaQwhQHn2c6YpDrAB/bMcjbRo1EipAK8nLA4KYY7jFQD2PzEbHxP84q2RvxifN
         mFWxuOWioz/uLeOCO3BdkCUYbvQzggaBOzFh14PNWjR79aPUPIfvA9VZIRtRVgaFr7pK
         1sc9nv/6Y643G9xqZq9HzihfX0bszcMbJWovsTGS6YQ6jaC53WVzjl6pnHwogaTodEQt
         0PKw==
X-Gm-Message-State: AOAM530F2HvmqP5oQNX4PW9zG0xswYjy1XnGAHil45rVWyXV4wLmimTo
        QVg1zvRAl0P5Aqu4FEHxElo9TQ==
X-Google-Smtp-Source: ABdhPJy5oMDnLUedtldYvmssFVi0CydnnEM1GUpYPgOHziN330zps7u7+EgaSkhqS4rUZsk5yvDE/Q==
X-Received: by 2002:ad4:4421:: with SMTP id e1mr455578qvt.48.1616005409600;
        Wed, 17 Mar 2021 11:23:29 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id z4sm18535935qkb.94.2021.03.17.11.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 11:23:29 -0700 (PDT)
Subject: Re: [PATCH] thermal: qcom: tsens_v1: Enable sensor 3 on MSM8976
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210225213119.116550-1-konrad.dybcio@somainline.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <f36f63c7-4427-58fa-fed4-c97c5ee47159@linaro.org>
Date:   Wed, 17 Mar 2021 14:23:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225213119.116550-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 2/25/21 4:31 PM, Konrad Dybcio wrote:
> The sensor *is* in fact used and does report temperature.

I can't find any info that says otherwise. So,

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>

Warm Regards
Thara

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   drivers/thermal/qcom/tsens-v1.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 3c19a3800c6d..573e261ccca7 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -380,11 +380,11 @@ static const struct tsens_ops ops_8976 = {
>   	.get_temp	= get_temp_tsens_valid,
>   };
>   
> -/* Valid for both MSM8956 and MSM8976. Sensor ID 3 is unused. */
> +/* Valid for both MSM8956 and MSM8976. */
>   struct tsens_plat_data data_8976 = {
>   	.num_sensors	= 11,
>   	.ops		= &ops_8976,
> -	.hw_ids		= (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},
> +	.hw_ids		= (unsigned int[]){0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
>   	.feat		= &tsens_v1_feat,
>   	.fields		= tsens_v1_regfields,
>   };
> 

-- 
Warm Regards
Thara
