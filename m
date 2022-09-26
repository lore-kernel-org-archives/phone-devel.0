Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502A9C07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbiIZIrj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbiIZIrf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:47:35 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC8D240B7
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:47:31 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t14so9044775wrx.8
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=1qsxSS/b8K0Q3liA/3pFa0lcJCv3yoWfkwLmCBH7Ckw=;
        b=QaTzccpGEo16URJr5RvOnW0RjzPXDxGYOc/YFA2zvKaGZPyEutUIClm0quWPWHPdSK
         hXsb2gXgyJRjroV688C8cuO0CiFI6hKv4lt69c4jSzqknBZnZO5m6hq1s1EGrl2O4R0O
         axowaC1FOO1TjPONOojW3BFTYhEbTa4PNvSgMbkrbccOIwkDhMtdCDiep5y1l0fnu1Cp
         zj+pnlruHpnDNS5LlVll6Zs+8grKnCGE5igCpxBTbyrnvRZ3TtBI9ZZG4HBIp+/h4CnZ
         aXtFzzKQvVP/7UxQexL0MaLduaHRVqSmj/ugtbjukVJa9gTrfOVn+z3nWR6hPsrPBEkW
         blVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=1qsxSS/b8K0Q3liA/3pFa0lcJCv3yoWfkwLmCBH7Ckw=;
        b=8CE7P6f0Bksy8pX7skVzzf+eGJyjABtx4n1cAXfOwA0o87Yrstu98XiaXNQELQYN/l
         nIZECBIGSi32uwpYZLyjSry9enEG5IGyDQf3qrDMDgCArjtG8ETKnmNUt//n7A6gsNbk
         Iper7SJ4unlaSWzS+kjeGhl/zcQjJ8S+XSY30bUj+M/kUAv2XUJ1TYqJTFGbsV9ExnJY
         XmGTJwV7sAbhnOts/KwtxdZpZvk+jh+NBmfahvkYGnD8/A0DQH2dnjNML6itaNbwnJQX
         qU6XLPTZe/FX8Uze5cEO9rCn+C5XzAKvpulbcLkuuCOGEibQm876rFNQkl040CyZRxqY
         X4RA==
X-Gm-Message-State: ACrzQf3bsW5Q55uhBCuMCGiIy+U5oJnVR58cJOZu7K91vYVqlBf1eNXI
        1V/ADNCbmH0Ji6TY7EU0w0my7A==
X-Google-Smtp-Source: AMsMyM5DoOHwDcOYXB6TqK1uaw/i/faGY/RyUGU367Gmdd8MEq+YOuBPhlgbd4Kd/RLFFkAzOYSx4w==
X-Received: by 2002:a05:6000:78e:b0:22a:7e99:da93 with SMTP id bu14-20020a056000078e00b0022a7e99da93mr12509779wrb.20.1664182049790;
        Mon, 26 Sep 2022 01:47:29 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003b4931eb435sm11343442wmc.26.2022.09.26.01.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:47:29 -0700 (PDT)
Message-ID: <f21b7016-4f99-8e5d-aab9-7c1fc59f813e@linaro.org>
Date:   Mon, 26 Sep 2022 10:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: Align dsi phy-names with
 schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925172443.92900-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 19:24, Luca Weiss wrote:
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
>   
>   				status = "disabled";
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
