Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1611C6FD1F
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 12:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjCYMIN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 08:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbjCYMIK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 08:08:10 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C281DBE2
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 05:08:09 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x20so4260031ljq.9
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679746087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrB9b88U0h+qwt/THj6bEYac8jJtD2V/B+CqKc3E+oc=;
        b=oXxa1rTManxlzoFbdkuPS19JV97ZHVrIu4gKS5lWrKjZVg/oUL0XBesH3Yqa1wMGu+
         C2/5l1dCJYyIOpU9RmuY2G5ibpem3gwt9QPgCl92TdQWzBU2sAt2j5AU0j7nPRqHRyqe
         XP8NeVz1hQ56wpHF2AQgz56UntQkCjXmJz6wPHSFDWiQOAiqBRpaSe4p/YHy/xgZtHDN
         lYSqHcCTPInEt4m7PshgOt9HfzKUy6her5NO30acbR2Gt2e1x7xH3VicGzFP/ZYqVSEd
         cIufDceDalCFwvSFc6lXaK8a4Y3WzganlocKkXgHhe1CeW9hiFHUds7DcbQ/okYCTTiC
         xS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrB9b88U0h+qwt/THj6bEYac8jJtD2V/B+CqKc3E+oc=;
        b=Bvtw5kloMWU6/ipJKSBhZgq9ioYf+V/mePMNdxWYLHf1Y8DBX9KVe+XfdHUhPcLmtV
         dEQQbC7lMz6OxOTCh8Qu1zzX3PNZW6/ZvLsFdfp8rF4LHhKMC0z2Ri3a8xCVb7eMMWhr
         hFZUU60OA65RO6jw3GJ5OD0dLboArf5gSYOV0L8TveIp7IJ0gWrwGHLKLh+VXbqTJMPx
         kfZuPgm2EZFklEgCXD74CmxR5ALCiKd7iAq5yA/TpR5A18if8Dq727+FOAyyhPj//uOW
         LLOqiOV/zybhtEbpjBhSZ+KlmRUnTswWnuJpVP8Jkw5Hlmub2rqapJR+ubhankAj5Fc4
         GFUQ==
X-Gm-Message-State: AAQBX9cAL3G5a2CYjQju+utdiYlxHpdeCw0TG0/D/ByaIJa3pELNaBxR
        VGbhVfj8ehPpA78ZMkpgEXnyVQ==
X-Google-Smtp-Source: AKy350ZHPkspQ8jAARW91n+j92RdBtsfoXpoACwO244WO/pUiV9aIBT2RBltE88Hf4Eqn3iosTmnPA==
X-Received: by 2002:a2e:988a:0:b0:29b:d235:2c50 with SMTP id b10-20020a2e988a000000b0029bd2352c50mr1932193ljj.25.1679746087430;
        Sat, 25 Mar 2023 05:08:07 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w7-20020ac24427000000b004db4f2f08f7sm3796784lfl.28.2023.03.25.05.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:08:07 -0700 (PDT)
Message-ID: <5123fe11-2f94-faea-073a-41f93e23b76a@linaro.org>
Date:   Sat, 25 Mar 2023 13:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/4] arm64: dts: msm8953: Drop unsupported dwc3 flag
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230325112852.18841-1-a39.skl@gmail.com>
 <20230325112852.18841-3-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230325112852.18841-3-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 25.03.2023 12:28, Adam Skladowski wrote:
> Property phy_mode according to binding checker does not exist,
> drop it.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

grepping for it in drivers/ also returns nothing

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 5dd10c35ee0d..0a1bf1058cbf 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -977,7 +977,6 @@ usb3_dwc3: usb@7000000 {
>  				snps,hird-threshold = /bits/ 8 <0x00>;
>  
>  				maximum-speed = "high-speed";
> -				phy_mode = "utmi";
>  			};
>  		};
>  
