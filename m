Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0755CC32771
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbiIZIpb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234502AbiIZIpW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:45:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C0E1A067
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:45:12 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id s14so9139466wro.0
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=wru066xEzc+yDp0Wh2VmO92ATDf3awpDqY3F6EM6KHE=;
        b=z4AQ2YTpHQIdgt6DaG7nA1vQp9tWEyx9VstZNWb3BLkysZ8Scto04YR+3vpfyxIdS4
         JOwnIJBO8ZU1zNPWXL8za1S4LbRGmbFVo/m6N62aV5rV9TiG/mEkKnUy41cCQ+2Ddzj8
         euzfDznf7SbTyYCXTgsIKFmD1o6yuxgZXJ7e0KnEz2Y6vP9M75jX6aN1unBcbK/vFhNX
         klH+ujLMfXVk6gX3auCJ48fS0xHqN1Lud6y5hhJAyJrFbxbR6eDxmXN0Mw6WXFcOmBDM
         Nb4jDnbOYUmj0PaHlGzL3Q8VTSgH5fBL1vOd53kD9XrbR6Lf5vfSmSW/gZ4JavNHTFSg
         7kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=wru066xEzc+yDp0Wh2VmO92ATDf3awpDqY3F6EM6KHE=;
        b=xQFxU4I0nmU1oR3eUNYsvisPnAMLC1k7m06gT+144MrNsYGaAw/bYnk4V7SpCBE/f4
         gFtW4hfxI66h65BkqxoDdZ9aqSNXmKI2Mu/AeQr8bVsXSjORMrEUh5WCSa/KLkMZ2eCn
         jdFEFfsdsxdGpdQzRTKrELqE9ZfYNglQTes9DAF0/U+k+jwdu6r65JGFEwV/reZQEsqQ
         AeJK023au/nYsYQoEWPkTPbX7G+HIVEMm2yk2SMb2oTmJTtGBYxyif+qbSjBp+gci3va
         HkYC8LldkR/fwM86XKvtObVLDp1LQWFBVkz/ZaU33Zze/rgvNq42tLGmFOHiMf5mmQ5L
         cBBQ==
X-Gm-Message-State: ACrzQf1CIork6S3yEcATUk6hvmKj1qTlMsT+2nq9M2m8rYJMFDn8xL5r
        YdaQHc9SEZ6mSrvisQujv3bltg==
X-Google-Smtp-Source: AMsMyM7pc4igtys+TU9PsicXs+pW4AkVbYGPEfKJGtg9qqoLLvQD3ot1RP6qWhj2D40cWgXy9PlHeA==
X-Received: by 2002:a05:6000:1365:b0:22a:2ee9:4363 with SMTP id q5-20020a056000136500b0022a2ee94363mr12717507wrz.393.1664181912146;
        Mon, 26 Sep 2022 01:45:12 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d4a44000000b002238ea5750csm15863408wrs.72.2022.09.26.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:45:11 -0700 (PDT)
Message-ID: <331da0ba-1829-7711-7261-220f6d9df0b8@linaro.org>
Date:   Mon, 26 Sep 2022 10:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: apq8084: add tsens interrupt
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161317.76356-1-luca@z3ntu.xyz>
 <20220925161317.76356-2-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925161317.76356-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 18:13, Luca Weiss wrote:
> Add the interrupt for tsens, based on the information from downstream
> msm-3.4 dts.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-apq8084.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index defc0602d750..593672f827ed 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -264,6 +264,8 @@ tsens: thermal-sensor@fc4a8000 {
>   			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>   			nvmem-cell-names = "calib", "calib_backup";
>   			#qcom,sensors = <11>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow";
>   			#thermal-sensor-cells = <1>;
>   		};
>   		timer@f9020000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
