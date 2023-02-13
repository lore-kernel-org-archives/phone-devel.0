Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D820C636CC
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 14:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjBMOks (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjBMOkq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 09:40:46 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4BC93CE
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:40:44 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id sa10so32354425ejc.9
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBayqw74PPvQCx2HJiiYQZDL5HXV2Ozwx8vKgVmuZRs=;
        b=qlhybUUjcgP92wOVOEsL8uC9F6J/KLndphTynsijnjtSfCgU+VTPeKkib3wKq+FBSh
         hpLh/EkIcKu1bUM/o5joK4otQIDxCOUMlUThj/sDn8W+XnK5VLHc0oXLA7/BDm7Ss5ty
         Po58OAoyJdYr0sASipn0/TfUyBXsQ1FYXTVrAAGzvd5E02/a/Exz3I6+W/VnSPSAtqCT
         EKpRwKrKyitNYiH84ML4u9qG401sMcic1aRM8oxrmKY7RMeimkERPQrhWQBl1y3GhxSC
         0JHmK153CSzBh6DKTk69WZ50E7Rdf3WmLsQZ+xXkEVK2pwxf9qHKlghie4Z1i1dqxNGm
         CC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBayqw74PPvQCx2HJiiYQZDL5HXV2Ozwx8vKgVmuZRs=;
        b=0GPRGOtiF8Ju+4SY7lm129vVZtLru4gt0CTfeBBueox6/hJsbXiIpiEAeQLNVMQl7c
         gzLCtvcnWYWzcHdalBonrPovEYRGsxkly+nZlwQhsR919aPcqzTf+ujr1WOuzsT6YpvF
         znA3/KNbi74Gk0zrJQyKm1qOMIK/BFvDS210igENdqTEDKRQGeloBEsWbRQcfinRidjs
         myuq8zPLKHeQqWXntEnEuCefn5v84QPjPpRB2Q/HE64hCCxXEVnx7XP7P46Bpf51zCut
         PEM1cn/lNz02NRH6KUmaMmt0gShmo4oNIwOqw7yC4hjJGz0Wm5VscM3NEeIMDTKoVuwF
         xPIA==
X-Gm-Message-State: AO0yUKVWtTapTUFX3noYZZEWM3YdSUGLygyZak70bWU/JB1CyN5+C4Ya
        bX13OLzLWmHcQR0Mit35LIj1T8TuwOqnWodK
X-Google-Smtp-Source: AK7set9tx3xgc/kdgdq2vLHkUJ9hI7Db1NOLUCnZqYjelQSQagQp4bPgdFVtWnRoiOS8B9Yhl30n5w==
X-Received: by 2002:a17:907:7e94:b0:85d:dd20:60a4 with SMTP id qb20-20020a1709077e9400b0085ddd2060a4mr34744336ejc.40.1676299243518;
        Mon, 13 Feb 2023 06:40:43 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id ot11-20020a170906cccb00b008775b8a5a5fsm6834465ejb.198.2023.02.13.06.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:40:43 -0800 (PST)
Message-ID: <f25f9854-8faf-7469-19bd-5ff998cdb97d@linaro.org>
Date:   Mon, 13 Feb 2023 15:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: enable
 remaining i2c busses
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
 <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 13.02.2023 14:26, Luca Weiss wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Any reason you've not enabled GPI DMA yet?

Konrad
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 86114dd2c0c4..d0f08b42592f 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -359,10 +359,31 @@ &cdsp {
>  	status = "okay";
>  };
>  
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* ST21NFCD NFC @ 8 */
> +	/* VL53L3 ToF @ 29 */
> +	/* AW88264A amplifier @ 34 */
> +	/* AW88264A amplifier @ 35 */
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* HX83112A touchscreen @ 48 */
> +};
> +
>  &i2c10 {
>  	clock-frequency = <400000>;
>  	status = "okay";
>  
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* PX8618 @ 26 */
> +	/* SMB1395 PMIC @ 34 */
> +
>  	haptics@5a {
>  		compatible = "awinic,aw8695";
>  		reg = <0x5a>;
> @@ -495,6 +516,10 @@ adc-chan@644 {
>  	};
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> 
