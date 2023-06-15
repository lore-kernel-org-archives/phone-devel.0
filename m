Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7B9EB64DA
	for <phone-devel@archiver.kernel.org>; Thu, 15 Jun 2023 18:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjFOSUs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Jun 2023 14:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjFOSUr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Jun 2023 14:20:47 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8BD295B
        for <phone-devel@vger.kernel.org>; Thu, 15 Jun 2023 11:20:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f769c37d26so3057715e87.1
        for <phone-devel@vger.kernel.org>; Thu, 15 Jun 2023 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686853243; x=1689445243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L86ku+7+LZQwdB7LY2vEzyd00L4TaNLzuqM/PGY++fA=;
        b=arTUyMobZK0/1k5hhhUhyJT2jUNGhSGsNAcNWzGam6h3yvKOLLF9B6nFrb2tM3Tmlr
         EudvbD1uHXsiZXGdaIy7mLb6GaJOqiamXP84/gtVzonNxNcVcwHRbopHPKB5Br+HPIho
         gd+Xr+VAfxHPoZQylbhX1Z5XtbV3NwBooyPZ0o/c9i4hxvGOv1d1szjJ0Z+q278peJoB
         MvnsiKMzcY3Nq4amJvcsyQAZtTY3f4LqJVhjZTF9OLRH//j625LClyOgoUXtp1HH8SqK
         At/CS2hxE3jI9A8VX8zIvHC29Njea6523hyBJRUYivUOYY40nC0p3UeyC4ogXm32ZlNg
         gF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853244; x=1689445244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L86ku+7+LZQwdB7LY2vEzyd00L4TaNLzuqM/PGY++fA=;
        b=jb+N2JS4lA7VUnwkzTkkAG7EtQXpX5r98Jctc6xqPnEEamcM31sDwjKwV33YRInjQk
         WtOdzpCdIZ02SHn/MYV3vGkotXeUWlnMpjdld4CADy/ucYI6ElT1etvqh1+EJyY/iWPz
         DliF6jzblMoHLFZb5ZT0ykii4rnEj6M1fwCeTnc75gflWs6/7gg2RExeJL01QsO2sg6k
         XIcWFeg5y7CDwk3pHUf7CXe8Iz3te5hdWqJiUAYOajMzpyB1FZ5lhcqBKB2//CNZLiav
         41ekOfakx6WpiL2fH/At6ZgeVq5XK3PxsCL5uAM4FB/rxdNBzARbjbnEBJFykyI5ONkm
         VxyQ==
X-Gm-Message-State: AC+VfDy161nMFPoK2Uk1AT6/wyCW/n+PMloaSS/eHzY4xwolD8z/rf79
        hORG8gcXXLhpYWHbtyvwzgM2yQ==
X-Google-Smtp-Source: ACHHUZ402ziYL5TvXfixIJ4Rjk5NUObRoP16/IYruQqcuIlOd4fwWY+IubMf34Q80/dG580p0yGxmQ==
X-Received: by 2002:a19:ca58:0:b0:4f4:b592:74ab with SMTP id h24-20020a19ca58000000b004f4b59274abmr8857833lfj.62.1686853243607;
        Thu, 15 Jun 2023 11:20:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v27-20020a056512049b00b004f74160c9cesm1806292lfq.130.2023.06.15.11.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 11:20:43 -0700 (PDT)
Message-ID: <866f1f66-8845-2453-ab9c-d125e23ae758@linaro.org>
Date:   Thu, 15 Jun 2023 20:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974: correct qfprom node size
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
References: <20230130-msm8974-qfprom-v2-1-3839cf41d9ee@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-msm8974-qfprom-v2-1-3839cf41d9ee@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15.06.2023 20:17, Luca Weiss wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> The qfprom actually has size 0x3000, so adjust the reg.
> 
> Note that the non-ECC-corrected qfprom can be found at 0xfc4b8000
> (-0x4000). The current reg points to the ECC-corrected qfprom block
> which should have equivalent values at all offsets compared to the
> non-corrected version.
> 
> [luca@z3ntu.xyz: extract to standalone patch and adjust for review
> comments]
> 
> Fixes: c59ffb519357 ("arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes")
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Not sure of the actual size of the region, maybe Bjorn can help..

Downstream 3.10 suggests 0x60F0, 0x20F0 after adjusting for the ECC offset

Konrad
> Changes in v2:
> - Keep base offset but expand reg from 0x1000 to 0x3000 (Konrad)
> - Link to v1: https://lore.kernel.org/r/20230130-msm8974-qfprom-v1-1-975aa0e5e083@z3ntu.xyz
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7ed0d925a4e9..3156fe25967f 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1194,7 +1194,7 @@ restart@fc4ab000 {
>  
>  		qfprom: qfprom@fc4bc000 {
>  			compatible = "qcom,msm8974-qfprom", "qcom,qfprom";
> -			reg = <0xfc4bc000 0x1000>;
> +			reg = <0xfc4bc000 0x3000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  
> 
> ---
> base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
> change-id: 20230130-msm8974-qfprom-619c0e8f26eb
> 
> Best regards,
