Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0422BC4332F
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 15:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLQPU3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiLQPU2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 10:20:28 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9861014039
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 07:20:26 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z4so5022898ljq.6
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 07:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3xo3YDasYRrDyRyPreLFtp1Yw7BHNALzC+h/Lv7dXA=;
        b=MDoB1OhCrRDxQ0Eu1HdOfBcX/kSIzjgCUuKTdCOWrzennYDSusByQHSxad46Asw2tM
         zj4Wp5AX8v8PRE+/mbisRKl6fQH9FJiJdMga4YDzONsygMBe/OzkMuEBYt8H1MoHc9So
         qQfmlSjAvZMmw8tVFW+gy/2K0U06NPVKhIkTlORGR46+rP0EY6RQw5qdHJXg0w8UcuQw
         BDVRwlRjdyihp7A/w6JrFvL3xM4YSdW8N7UoHGrGjzh8gfz7NtmfDZ2h3ZoXsLJdL0wa
         OD2J8jGvJOzggo12qFfB9kafSYShdDRSlPKZzYlLy1w+H91GvvZi4u2Hhawz9Cafy1sw
         GiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3xo3YDasYRrDyRyPreLFtp1Yw7BHNALzC+h/Lv7dXA=;
        b=OrhbI/g6UVAW0SRbeIl7f1z5gjaw4LSEVb+1F0FXS2gk917B/EnVTO2zuWegTPC13F
         zIzB2qxfmuLQ8kRBAOvYJJCR71hoVPBqiJrS/7bzh4NG0Mxnbis+lZ5b1A0eW+RZiD1v
         LDjPxn9nNquUh95R+8RE/oSUj9E6yzMGOOIxCj6hxv80ok0JfpiAqD2oKZTCnoSByLuO
         5ttFMPi8ma9rqUYH/LxuqJPiXVbGak/sqbMNayRvCtImLEdT/4S902Nnme/4vkW0rwSc
         BJYkLE3vMVa4897M8RZAG6937Ex6jCit27pENBMgNHZGXOMVTx/OMmb91xx09Xpyh+sV
         Xijw==
X-Gm-Message-State: AFqh2kpAztNF+QK9VM4HGkygTj7H9Kx8+O/gpWvoMJfCcDFWGDj2175e
        m4W44b+MzP3qzCF0QZ/z4wJfow==
X-Google-Smtp-Source: AMrXdXuoPMteCdBoPdTXfiod2FbdWWM2ANpoY4xs0rF0NUHPwtWwa07t069bY4IAXzPnGrp37DQW6A==
X-Received: by 2002:a05:651c:19a2:b0:27f:2885:4254 with SMTP id bx34-20020a05651c19a200b0027f28854254mr2743980ljb.30.1671290424932;
        Sat, 17 Dec 2022 07:20:24 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05651c231800b0026dc7b59d8esm376154ljb.22.2022.12.17.07.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:20:24 -0800 (PST)
Message-ID: <2a1ff9e6-2401-0ead-781a-ef92965319d9@linaro.org>
Date:   Sat, 17 Dec 2022 16:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6125-seine: Enable GPI DMA 0,
 QUP 0 and I2C SEs
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221216233408.1283581-1-marijn.suijten@somainline.org>
 <20221216233408.1283581-4-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216233408.1283581-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 17.12.2022 00:34, Marijn Suijten wrote:
> Enable I2C Serial Engines 1, 2 and 3 which are known to have hardware
> connected to them, leaving the rest disabled to save on power.  For
> this, only GPI DMA 0 and QUP 0 need to be enabled, as nothing seems to
> be connected to Serial Engines on GPU DMA 1 / QUP 1.  Beyond this
> downstream only defines a UART console available on Serial Engine 4
> which also resides on QUP 0.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 1b9e40d3d269..b1de85d8f1c8 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -141,10 +141,35 @@ active-config0 {
>  	};
>  };
>  
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
>  &hsusb_phy1 {
>  	status = "okay";
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* NXP PN553 NFC @ 28 */
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* Samsung touchscreen @ 48 */
> +};
> +
> +&i2c3 {
> +	clock-frequency = <1000000>;
> +	status = "okay";
> +
> +	/* Cirrus Logic CS35L41 boosted audio amplifier @ 40 */
> +};
> +
>  &pm6125_adc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm &rf_pa1_therm>;
> @@ -246,6 +271,10 @@ &pon_resin {
>  	linux,code = <KEY_VOLUMEUP>;
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>  &sdc2_off_state {
>  	sd-cd-pins {
>  		pins = "gpio98";
