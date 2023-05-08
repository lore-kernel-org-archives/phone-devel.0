Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CF8C77B7F
	for <phone-devel@archiver.kernel.org>; Mon,  8 May 2023 07:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbjEHH1B (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 May 2023 03:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbjEHH0x (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 May 2023 03:26:53 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979D24206
        for <phone-devel@vger.kernel.org>; Mon,  8 May 2023 00:26:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f2510b2b98so489430e87.3
        for <phone-devel@vger.kernel.org>; Mon, 08 May 2023 00:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683530810; x=1686122810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFLTzjYHc2Wy3NEyiiA6VvE9neb0Ehp30pb4IjLGMHs=;
        b=wruiOd/65aWLE5iIGAms0g5iLixlraLq+GDsKNGd/sNtiPR/9MfqubZCdb0cnWj04T
         5uJT+W99aiG5/RBhlM7UNmSzl3els2hmcIwb7ft08OUd1CT/TjfADuk4fFUkHvLT50VS
         7oGbWswa/I9w9zqjAQz4QfSniKkFWOc56G+9yWysaa1qo+Te59iwxN6Nrp6MQhSGyMZq
         8apBHG7gPFCyzpQREeKPI4G0IxBHnjB/wd6MCOcv9o90QueSz2he4JprJBt2lQO4cq87
         9t9eyrnxiacFpy6vfJy/hBC0cL2Ia8F+SMVG5yoqgHWOTgQfXWziLzKum+np4WXXDzR+
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683530810; x=1686122810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFLTzjYHc2Wy3NEyiiA6VvE9neb0Ehp30pb4IjLGMHs=;
        b=Hyt1qYq9T+9MWHXO/cS5eyzSJioIgLmNYhFe8DYBgexKUihkifMkG66uOInnqc/ob4
         8bFNkHHqWiiBxTm3Cm8RAKKfBPgyvMFKRzKsr+J0pPOIML2IA6c2xLU0onNeIGeXjP3k
         nQuPZnDovYlsmNYZRLMrvHEcHn/XwLP37S4NU5xDBBHPf1t8TKmq/KQpW5yDAR2jrK4s
         wh83iZViWoUredeRAZr4O3gwPPR9PWgs/LFP/XSKQB9i1ID8VucHY5r/0ab8v+wb6DLj
         doqyH/5AntHtSV+ZWzTuAnMj6xMZ7x9jywYf6jwc7g7+FZ9/VzGdKobHVpYOjPbzvOV0
         UYJA==
X-Gm-Message-State: AC+VfDyAtwywqSbNwFZTdE2Q/60LIpTPnCKQt2VkC4oA+CWzCaaihF2r
        v1vbr0M1M4oNaiGoftCTK7SJQgIe2mgThZ7C1QI=
X-Google-Smtp-Source: ACHHUZ5owctDJw6gtd5X+hv8xl+nhtwxwTQ1jcUgyseC+4hSXZ4GviWouC12390R6JPONcfOrZLh2g==
X-Received: by 2002:a19:ae0d:0:b0:4f1:2236:6d2a with SMTP id f13-20020a19ae0d000000b004f122366d2amr2413021lfc.53.1683530809851;
        Mon, 08 May 2023 00:26:49 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c11-20020ac2414b000000b004f12f5d866fsm1208560lfi.10.2023.05.08.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:26:49 -0700 (PDT)
Message-ID: <8f3db51e-30a0-8550-3775-c49c6c25cac4@linaro.org>
Date:   Mon, 8 May 2023 09:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-1-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-1-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> Since we're using these two macros to read a value from a register, we
> need to use the FIELD_GET instead of the FIELD_PREP macro, otherwise
> we're getting wrong values.
> 
> So instead of:
> 
>   [    3.111779] ocmem fdd00000.sram: 2 ports, 1 regions, 512 macros, not interleaved
> 
> we now get the correct value of:
> 
>   [    3.129672] ocmem fdd00000.sram: 2 ports, 1 regions, 2 macros, not interleaved
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/ocmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index 199fe9872035..c3e78411c637 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -76,8 +76,8 @@ struct ocmem {
>  #define OCMEM_REG_GFX_MPU_START			0x00001004
>  #define OCMEM_REG_GFX_MPU_END			0x00001008
>  
> -#define OCMEM_HW_PROFILE_NUM_PORTS(val)		FIELD_PREP(0x0000000f, (val))
> -#define OCMEM_HW_PROFILE_NUM_MACROS(val)	FIELD_PREP(0x00003f00, (val))
> +#define OCMEM_HW_PROFILE_NUM_PORTS(val)		FIELD_GET(0x0000000f, (val))
> +#define OCMEM_HW_PROFILE_NUM_MACROS(val)	FIELD_GET(0x00003f00, (val))
>  
>  #define OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE	0x00010000
>  #define OCMEM_HW_PROFILE_INTERLEAVING		0x00020000
> 
