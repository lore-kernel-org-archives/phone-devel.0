Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2109C4332F
	for <phone-devel@archiver.kernel.org>; Fri, 23 Dec 2022 11:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235995AbiLWL54 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 23 Dec 2022 06:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236240AbiLWL5f (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 23 Dec 2022 06:57:35 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A302A513
        for <phone-devel@vger.kernel.org>; Fri, 23 Dec 2022 03:57:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y25so6821740lfa.9
        for <phone-devel@vger.kernel.org>; Fri, 23 Dec 2022 03:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1MqNfvQnxK7WcVE1mQ7e/hxZyGccdrLjMvUlPIFUiY=;
        b=UkVK/LZIxZTiBR+BkqfpY8inJh68syPmg+Qh/SNoFMvBoWDelXFgGHFR/AKNQdqvGy
         8OIQfMaYFVHKl9CE6vlgSB+YleBy2utSLt8YPnIEtHPq2vBw2NdOY6GnELVLrmR5iqyg
         nlPWX3Kcjz+KWb0l4qsCyKD8pIB6RD21fekAI2EZCm1RX0G+rwmp5kiLm9PngmJYDJmy
         3nYfccZqyth1lIgOprWNZdep1EEKXh3+zjSCi01jcvLsVlcbZQm30pmKLrLqVtuNF2E2
         iW8Ek75LHYAmNw5mlHn1p7klLcaV2xhpA7o89vwT3js+eIlBGLdUavN/4ImwoC5MsYfM
         BF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1MqNfvQnxK7WcVE1mQ7e/hxZyGccdrLjMvUlPIFUiY=;
        b=hknq/uHSXuc7Wb04eDVQVfUwOsmy0zgim6vf7Y0uV+13olz5zDtUxoG/utN4rbAyOG
         V/0FwKrv0i/3Faer/7ZEyJiBK4GXklgevz2m03N7QvnrAsAZbwLEUBycHaJ/2p+pftes
         LxeXfIn2XWR7v/LJZ/Zjfm8pTmHk8HpIRncKduEmBmcZJTnmzDRCHzIvwj8Wmoz9mdBC
         ZYz8xxWDsofofHxoDjO+S+OvpJkWn8FsOpztP4S4snEZeNFVcCUUa7qrthUWgbgen9Qi
         lFpdMplRVbpj5BLAsRXkzyno7p+VPXGGnAt5uNcBCBiYlpXrqVC0TkJo2ZdKgvEV59Xt
         gCBQ==
X-Gm-Message-State: AFqh2kp8yLULDGOZMBn0SQfpxiPmwjILG55bceT2dtTnkYYZgJ188VM9
        2rctEosBgwuVROz6SYU75GC6Cw==
X-Google-Smtp-Source: AMrXdXvhfZ21xGg5smJtbdtUhsDxNI/aFVZnQvlVSHDHUVBUqKrNwp7Aq1tl1GaHeLp1Q6Fk5vebDw==
X-Received: by 2002:a05:6512:b25:b0:4b4:b8fc:4ac5 with SMTP id w37-20020a0565120b2500b004b4b8fc4ac5mr2878465lfu.3.1671796644486;
        Fri, 23 Dec 2022 03:57:24 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id o1-20020ac25e21000000b004979db5aa5bsm502211lfg.223.2022.12.23.03.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 03:57:24 -0800 (PST)
Message-ID: <0238b9e4-206c-398f-8336-71f712bef538@linaro.org>
Date:   Fri, 23 Dec 2022 12:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm6125-seine: Configure PM6125
 regulators
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221222203636.250190-1-marijn.suijten@somainline.org>
 <20221222203636.250190-2-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221222203636.250190-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.12.2022 21:36, Marijn Suijten wrote:
> Configure PM6125 regulators based on availability and voltages defined
> downstream, to allow powering up (and/or keeping powered) other hardware
> blocks going forward.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 4e7c12863d28..4f825c55692b 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -276,6 +276,145 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&rpm_requests {
> +	regulators-0 {
> +		compatible = "qcom,rpm-pm6125-regulators";
> +
> +		vdd_l2_l3_l4-supply = <&pm6125_l7>;
> +		vdd_l5_l15_l19_l20_l21_l22-supply = <&pm6125_l10>;
> +
> +		/*
> +		 * S3/S4 is VDD_CX
> +		 * S5 is VDD_MX/WCSS_MX
> +		 */
> +
> +		pm6125_s6: s6 {
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <1422000>;
> +		};
> +
> +		pm6125_l1: l1 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1256000>;
> +		};
> +
> +		pm6125_l2: l2 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1056000>;
> +		};
> +
> +		pm6125_l3: l3 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1064000>;
> +		};
> +
> +		pm6125_l4: l4 {
> +			regulator-min-microvolt = <872000>;
> +			regulator-max-microvolt = <976000>;
> +		};
> +
> +		pm6125_l5: l5 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <3104000>;
> +		};
> +
> +		pm6125_l6: l6 {
> +			regulator-min-microvolt = <576000>;
> +			regulator-max-microvolt = <656000>;
> +		};
> +
> +		pm6125_l7: l7 {
> +			regulator-min-microvolt = <872000>;
> +			regulator-max-microvolt = <976000>;
> +		};
> +
> +		pm6125_l8: l8 {
> +			regulator-min-microvolt = <400000>;
> +			regulator-max-microvolt = <728000>;
> +		};
> +
> +		pm6125_l9: l9 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1896000>;
> +		};
> +
> +		pm6125_l10: l10 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1896000>;
> +		};
> +
> +		pm6125_l11: l11 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1952000>;
> +		};
> +
> +		pm6125_l12: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1996000>;
> +		};
> +
> +		pm6125_l13: l13 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1832000>;
> +		};
> +
> +		pm6125_l14: l14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +		};
> +
> +		pm6125_l15: l15 {
> +			regulator-min-microvolt = <3104000>;
> +			regulator-max-microvolt = <3232000>;
> +		};
> +
> +		pm6125_l16: l16 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +		};
> +
> +		pm6125_l17: l17 {
> +			regulator-min-microvolt = <1248000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		pm6125_l18: l18 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1264000>;
> +		};
> +
> +		pm6125_l19: l19 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <2952000>;
> +		};
> +
> +		pm6125_l20: l20 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <2952000>;
> +		};
> +
> +		pm6125_l21: l21 {
> +			regulator-min-microvolt = <2600000>;
> +			regulator-max-microvolt = <2856000>;
> +		};
> +
> +		pm6125_l22: l22 {
> +			regulator-min-microvolt = <2944000>;
> +			regulator-max-microvolt = <3304000>;
> +		};
> +
> +		pm6125_l23: l23 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3400000>;
> +		};
> +
> +		pm6125_l24: l24 {
> +			regulator-min-microvolt = <2944000>;
> +			regulator-max-microvolt = <3304000>;
> +		};
> +	};
> +};
> +
>  &sdc2_off_state {
>  	sd-cd-pins {
>  		pins = "gpio98";
