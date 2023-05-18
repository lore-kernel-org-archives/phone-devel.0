Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B727FC7EE22
	for <phone-devel@archiver.kernel.org>; Thu, 18 May 2023 10:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbjERKpB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 May 2023 06:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjERKo4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 May 2023 06:44:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7FE1997
        for <phone-devel@vger.kernel.org>; Thu, 18 May 2023 03:44:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so2174046e87.2
        for <phone-devel@vger.kernel.org>; Thu, 18 May 2023 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684406693; x=1686998693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCGStx9g5JG1kB8zFftBk32aBir6PoC6mFtgEzyZU0s=;
        b=Y48HA0iOmjU8hAIV/V0BKae1TpftE+1j3scL7OxsfxxuXYhTWhheVWqOFb8+RUrzPB
         hpHxeljof6FIR9yrmhT3ny7tpc7Or68iiS0gnxRMTNvnS71KZ/4CWc+Mm2WDGV8pfM9g
         1ztielbQ8LIfdxxlxm2gW93cIEHsYd8nCi0KOhFdWSmCvJK+Uy8SLx2hhCvTDJPyOZs4
         kxna6w4eB6BT6kyeBKQNR6seMIloVibRUk6bfz9wPLVaFwNsS+XqDB23rcD2Y+TYJZqw
         MpLtxV/+rfkHyXqs4AGpJty4rV6428ZOnIVbpMuCXxDYikunJf6Rmg27qxTV+iplEPZ3
         qabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684406693; x=1686998693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCGStx9g5JG1kB8zFftBk32aBir6PoC6mFtgEzyZU0s=;
        b=DfAR96yyZcm9gYD7mniisqAb4Pl61v1jlccZB2TclKQfG1/AtTq3H7mJgen6izrT2a
         HZf8Du4J10r2xh27IuZ4VNiEsbnO2wRnzhXp+K3pa6+SPCTXFTZOvvqrLhJm8Y5Y7I24
         5FEIyduEK8t0x6dtZDB+TP2LnKDyOyGQRExd2oFwRfli5pnibJ0BaSU5vfAOQ87PqIpM
         dgsgJYyCiLCZ6hlNvexbgzNjKHyb7RkAgph49QrlZQ0w01EQQhjsZhKH3kmUhdbFK0d5
         fC9IN1URQwB3FLt302l8yZSH3w1XGFQDgpVCpvwzShBm2/RRdzW6+j5koT2Id+fvauTV
         RseQ==
X-Gm-Message-State: AC+VfDyEDkviLuWV2bSoHztMd5JwqSnsjvWHee/A5Up/DrmukUngabfG
        SwZD+sHki5Byws5uEdtScokdAA==
X-Google-Smtp-Source: ACHHUZ4u4OZfOM7Ene4i2lALuClLD58G/+HPFj+5lrl+ySTSq8Be17IvLMS/gRDu3qUNY5Gd2Sa04A==
X-Received: by 2002:a05:6512:48f:b0:4f2:5c2a:19ba with SMTP id v15-20020a056512048f00b004f25c2a19bamr1047611lfq.46.1684406693346;
        Thu, 18 May 2023 03:44:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l26-20020a19c21a000000b004db3e330dcesm204242lfc.178.2023.05.18.03.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 03:44:52 -0700 (PDT)
Message-ID: <f785b434-2df4-c55d-2ea8-a039cd14c61c@linaro.org>
Date:   Thu, 18 May 2023 12:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845-shift-axolotl: enable
 flash LEDs
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com
References: <20230518061328.146847-1-me@dylanvanassche.be>
 <20230518061328.146847-4-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230518061328.146847-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 18.05.2023 08:13, Dylan Van Assche wrote:
> The SHIFT6mq (axolotl) is an SDM845-based smartphone with 2 flash LEDs.
> One LED is white, the other one is yellow. Define both LEDs in the DTS
> so they can be used as flash or torch and enable the flash LED
> controller to control them in PMI8998.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 0ad891348e0c..e7fc0c3cae58 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -554,6 +554,28 @@ led@5 {
>  	};
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <180000>;
> +		flash-max-microamp = <1000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +
> +	led-1 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_YELLOW>;
> +		led-sources = <2>;
> +		led-max-microamp = <180000>;
> +		flash-max-microamp = <1000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +};
> +
>  &qup_uart9_rx {
>  	drive-strength = <2>;
>  	bias-pull-up;
