Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A874C6FA83
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 10:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbiIZKKR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbiIZKJ2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 06:09:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4353FA16
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 03:09:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu25so8132586lfb.3
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NiDFW7j0aeL8AhvqVkURIdFDpKhhYD3BHp+Ep7uI1Mo=;
        b=algVzKxCsaBbYi1rNqmaIxikqU8hTcFyl1WhknMAGmvlZ6VEQvu6ryDp+TZim52fef
         Mx/Q+jIeIxBBvDHYpahmL4/JQNC8BQ54jT3bfnsoAz7/7pX8Aggr7Q15Sz86/gBxOoEQ
         F9fqfrO2yTQn+0RrfLzx2JhMrOHhdpkMYwUPnm1G4Q4AXfMtqMU3+7N+OEHkRgJW6d/5
         D+0Qk2BWETD6WwKclB4/XUqx+6O1oXCG+/M38BFmbihssY0tTRkKNia14IxscgxkNsXE
         zaZ9Ap2hxfbCqH3T2DxaRo/+N9x2V8BH8caTwy+RyeRwniia2w/hYK26yrkwTi+2Y8Qv
         DySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NiDFW7j0aeL8AhvqVkURIdFDpKhhYD3BHp+Ep7uI1Mo=;
        b=zCQSlI26q4fGLA0asXNQG07SrhSgjuktSV6Y9V9K8Uu19vseXCPkMks/0CnWyg2aeu
         31zksJyROGIH5fvGkzW0indsRS5bEoqGHSoIPqXs9S1z+bLSGnwrog6h2dFq6wMqNVkU
         fYKUM93x87eJAtkQDugvvNvvGTLsKjSc7B8R2zVKCYQpXAns2BnIm4s1jIetgjbhhSOk
         4+8gno0GP9mW/+/A4MSouEXva8rJ8Bif4/en4CWkHfLgiy/pTeslb1zowmn33VNh2C3i
         tkzYEuHRf2KjzGR/I3JP92EscJXG7aT5crfg0KYnObF7p6fffTowfFysiga+Tu+gnbGE
         OQxw==
X-Gm-Message-State: ACrzQf0SCrhf0OBl9OnPnkVqoG0+pwnTqJi8UnMiIZq85IKMWd6RPMYP
        XvCwaJx9WH/7Q7hLLFdslTPjN/lnlF1O1A==
X-Google-Smtp-Source: AMsMyM6HCOqYbhXlG+PayyewllNWiljEgCvTUTi58rKNFUbrf/36OjEHb9PJnwENTJDUq5/1bbIjCg==
X-Received: by 2002:ac2:4c4d:0:b0:49f:99f0:308f with SMTP id o13-20020ac24c4d000000b0049f99f0308fmr8690149lfk.160.1664186964761;
        Mon, 26 Sep 2022 03:09:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r22-20020ac24d16000000b00499aefcf68esm2477468lfi.292.2022.09.26.03.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:09:24 -0700 (PDT)
Message-ID: <642f9bca-5e9a-4971-3cec-32963bfd88ad@linaro.org>
Date:   Mon, 26 Sep 2022 13:09:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: Align dsi phy-names with
 schema
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220925172443.92900-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 20:24, Luca Weiss wrote:
> Use dsi instead of dsi-phy as required by the binding.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 620900e5ffd5..da247d799492 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1571,7 +1571,7 @@ dsi0: dsi@fd922800 {
>   					      "core_mmss";
>   
>   				phys = <&dsi0_phy>;
> -				phy-names = "dsi-phy";
> +				phy-names = "dsi";

I'd prefer to merge [1] instead

[1] 
https://lore.kernel.org/linux-arm-msm/20220907000105.786265-1-bryan.odonoghue@linaro.org/

>   
>   				status = "disabled";
>   

-- 
With best wishes
Dmitry

