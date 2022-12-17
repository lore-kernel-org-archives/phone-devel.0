Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9A2C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 14:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiLQO0P (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 09:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiLQO0P (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 09:26:15 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB37063EE
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:26:13 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id c1so7621480lfi.7
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRL2XQLT8eVZZpdgVwn0Zki3+f+2pLPGbkIhlI1LkjA=;
        b=tC67hFSwiMsrj9zcn+nE1Ph/Cgrs4vxfIAwh5b+N9xxeqf81eyyo1KdNfAv2TSNL9Q
         QR4tJtyAbdo/Q63ZvzXcTC44fghldO3fiKaJTTuAG1F6ac6S854vYnlcxhyFqF7hv5Pz
         c83y3IWvhl56DYdsqj/SXYl8UZREWSF1CbsI+YLZ0D0nnLyIuR8kTCvLGxxAwK579Ih5
         Q9i53GqdBkF4I59h7InPoKQ5GxvPelJqC9hS9YkXgYZlFD7WjQFcQxCAJ16UsKCl4f4/
         uaRyPP67GNhoUaMWGwdS2k+yFbybJglUPv7sumxoyKphPTJeEF9ATO9tXkSSB7RgwPh+
         TzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRL2XQLT8eVZZpdgVwn0Zki3+f+2pLPGbkIhlI1LkjA=;
        b=QDw0Q8sC8wuMJbmPWwXFjdAlpIXY/YIOOz3cAHxhHmbWPjHs/RZ2P4qNAPdnw47rH5
         b5oEeiy8Gjv2ugKDQxmIUvlXI3LJTJ/s7V52L90tvc4Ea7sW6pgVVb9OWYvU/aT+d8Gf
         j/TMAX+MZhC+zKU1O4lz7yC3GPnqPvPrhCCD72IgQeGD+hb3ux/+rohcjUK8JFJFZ9UU
         sUmnqBBWdxyYckNrkckuuQ6r5+glYw3w7ot4gm2sC08mALlZh4t5NZ5iXqz/NmNgHRSR
         JK+jpS2tDTBoTOk+HfL2S8v8qGpXHur1kdlKj6mgGRKe9KvA35xaKpnl552mSau5TZsw
         87Xw==
X-Gm-Message-State: ANoB5pmVdNy6cYWTPUGPPznEJ8obv9qNUyrnRnI3pqT8Pak0pCmOLoFs
        CTHyFwo4zUR4mD6zSHkQP7YEog==
X-Google-Smtp-Source: AA0mqf6yRygHcKtKg6i9/zh3YfwdhAcbXz8YfL9Q78fgcSy2AP0CdevTr3DGQ8QdRqaPDCbo5qeWFw==
X-Received: by 2002:a05:6512:32b7:b0:4b5:82f1:7f3d with SMTP id q23-20020a05651232b700b004b582f17f3dmr17078421lfe.58.1671287172283;
        Sat, 17 Dec 2022 06:26:12 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id 23-20020ac25f57000000b00492e5d31201sm526826lfz.7.2022.12.17.06.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:26:11 -0800 (PST)
Message-ID: <292b1bd2-8745-04d1-5d7b-3e201e1ac33b@linaro.org>
Date:   Sat, 17 Dec 2022 15:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm6125: Add apps_smmu with
 streamID to SDHCI 1/2 nodes
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221216215819.1164973-1-marijn.suijten@somainline.org>
 <20221216215819.1164973-4-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216215819.1164973-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 16.12.2022 22:58, Marijn Suijten wrote:
> When enabling the APPS SMMU the mainline driver reconfigures the SMMU
> from its bootloader configuration, loosing the stream mapping for (among
> which) the SDHCI hardware and breaking its ADMA feature.  This feature
> can be disabled with:
> 
>     sdhci.debug_quirks=0x40
> 
> But it is of course desired to have this feature enabled and working
> through the SMMU.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 347665c2067c..f560499cc0ca 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -468,6 +468,7 @@ sdhc_1: mmc@4744000 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&xo_board>;
>  			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x160 0>;
>  
>  			power-domains = <&rpmpd SM6125_VDDCX>;
>  
> @@ -494,6 +495,7 @@ sdhc_2: mmc@4784000 {
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&xo_board>;
>  			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x180 0>;
>  
>  			pinctrl-0 = <&sdc2_on_state>;
>  			pinctrl-1 = <&sdc2_off_state>;
