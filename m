Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B209C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 10 Dec 2022 09:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiLJJdW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 10 Dec 2022 04:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiLJJdV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 10 Dec 2022 04:33:21 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC6411477
        for <phone-devel@vger.kernel.org>; Sat, 10 Dec 2022 01:33:19 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b13so10730111lfo.3
        for <phone-devel@vger.kernel.org>; Sat, 10 Dec 2022 01:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGfrbK5ti76cYm25UBxY9tc7IHas7Pzc/DKbMUVNEU8=;
        b=a7sB7iSPGHTkN4uxjv7f4BpupQpw+i/uQCTC4lS3dlOoScGOfJ3hsYbuOxFxkwxLgw
         6wBN5sHslpVjafLZSWqK0jr+/1QQWPXRDRqhpvciwhROoFXo/vnOeY8cS9eyFJOSY3YA
         1Dyu7uvvRdvRrfPsvCdcfXSC0Fc4ET+7qUKMD1IS0GkYUgpDv38dvSJae5P+YID8XWU5
         IK9eGH5x1C3FwC5k58DQAEktvYXB3tqmbQVQXdpm3lPgT5lThCB6UQen6IuOOEDwxy2x
         8EPokRnwzZmdKolu41nh8lc14/AKPAgNc7thMmrVvkEIIBubsGey1cGPVkw6+1o5aT58
         X5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGfrbK5ti76cYm25UBxY9tc7IHas7Pzc/DKbMUVNEU8=;
        b=TMkBnDbzE8uFyMMBmp83idpr2o+D4k396VBH0bfRbWiyxfQBu9KuEJ9FwrOHyKXOlB
         7zY8hW0B7eP0irD1XfT7uebO1//uCQ1G+7YK0A0d9DF2oeOVZPu5HcMvbjfqyGXKXzxr
         Fp1TcqvKr1423xuuEaZeH3wjOAqjLFtQ24HIMnxB2MLDc7O06oMCqx/JDmmrWa7RzyxI
         qUFvkpgOZdqoRh2/gFao457AUAhmdzA9UxEzkhtiG+PNerJEZ+b5OTsbzGbHGbsfj1Ef
         KYR5HPsnft5j0vA+9M1+GPd0zj5c2LWSruZSvDqa2V17avlCxjf0V3rjUA7KdpgdXHfd
         89+Q==
X-Gm-Message-State: ANoB5pnx3eFYjFnifA073z71Vn2OWnLduwasKqPesk0rBnneTAV1z16k
        RA/VxwhiNe37pireg+a3KHmpPw==
X-Google-Smtp-Source: AA0mqf6KR4ABr+4GpU4gVmc46pmDWurLqqChdv8uG4pnRDQoG6IAVIUbYoOyM3TvDQo9O3Y2+zqoHA==
X-Received: by 2002:ac2:4f04:0:b0:4ac:5aad:3ef8 with SMTP id k4-20020ac24f04000000b004ac5aad3ef8mr2721398lfr.11.1670664798163;
        Sat, 10 Dec 2022 01:33:18 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004ae24559388sm638822lfs.111.2022.12.10.01.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 01:33:17 -0800 (PST)
Message-ID: <8eb9f68d-c36c-15e9-9bde-d436b3ed5925@linaro.org>
Date:   Sat, 10 Dec 2022 10:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: pmi8950: Correct rev_1250v channel
 label to mv
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221209215437.1783067-1-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221209215437.1783067-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 9.12.2022 22:54, Marijn Suijten wrote:
> This was pointed out in review but never followed up on thanks to
> sidetracked discussions about labels vs node names.
> 
> Fixes: 0d97fdf380b4 ("arm64: dts: qcom: Add configuration for PMI8950 peripheral")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> index 32d27e2187e3..8008f02434a9 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> @@ -47,7 +47,7 @@ adc-chan@9 {
>  			adc-chan@a {
>  				reg = <VADC_REF_1250MV>;
>  				qcom,pre-scaling = <1 1>;
> -				label = "ref_1250v";
> +				label = "ref_1250mv";
>  			};
>  
>  			adc-chan@d {
