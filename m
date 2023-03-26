Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85128C6FD1C
	for <phone-devel@archiver.kernel.org>; Sun, 26 Mar 2023 08:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjCZI5G (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 26 Mar 2023 04:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjCZI5F (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 26 Mar 2023 04:57:05 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C4E59EF
        for <phone-devel@vger.kernel.org>; Sun, 26 Mar 2023 01:56:58 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w9so24222898edc.3
        for <phone-devel@vger.kernel.org>; Sun, 26 Mar 2023 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679821018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dluC4HDOGibpGXJ73bE6ouywRyXzDyJti+JzH9GsPB8=;
        b=dAX+2c98gBcOgphaLBmDMcUtwqBUbMPrf7tUqDQXI9/on4bdB2o1S2qPR4BB0I8CFp
         JEYxK6mp1T9zqWoYzm8ocoMGwcE+YHudPDWo9hq/GpUxCj+jtB81IDA7uIat6JSGLToo
         Uw9i2QbZhrKgabm0h+cYQukBtUR+PmOgtbqjMC2qu8DMekJe4U4yQT2VFkOd0/LOr9gg
         Fv1+SA1bF6FbMdBmEsc8sjjDG6iBam1koTXzf8cci08ShzIrjX4Q8X4fXbUzued81kGv
         VgsBMpDsqrTLvZ3o2Oi8sDWTaNGDMzNzZeKgKBH+EMkJjmpWxyE36VHABwnGJUCeiWja
         hBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679821018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dluC4HDOGibpGXJ73bE6ouywRyXzDyJti+JzH9GsPB8=;
        b=vGl7gxNDqlCml66COLmzFeiM7/9hJTa4Yhf+jnSNhCnn0FC6okkqrt2tFUMS22XFTq
         WkTrE33KBjyZmdqtfEve9tMPpkMB+arofeLXgglEgXT9eKFHn30+KDEaFMOsegNUabhJ
         XNn1/UHTXxLV+iUJg5bOkpEZ63UBKj+sspdI1ZY0lRfBqIqp3QWx1GZGF1jZ+AID14iL
         eOI0BEhb2oktEcpLpmg+MncueuAJK5lPoUPsvOuyWUnNQKyn/gsMZzLp1kOlF/Fx6wwW
         Z1ShWo3/p41tDUBX7jpTQ1QVdRGqtckryLhoVu345CogHT9xex5i0uhqaxUnVq0xl/VA
         x9ig==
X-Gm-Message-State: AAQBX9e1V7Cj1o/7pPu9UIMQdI8bc6BZF+tNl2Ifi4dATRye6RnG6Hr3
        gUM/Hj96fAd6v9yqpY/44NCgYw==
X-Google-Smtp-Source: AKy350Z1I9N9tKciexN2FNB0mlsriQqOFDimd2Edursh4PjdEtRe+/tqkkO9tL+uF3J+Cye7s6Jrsw==
X-Received: by 2002:a17:906:94c2:b0:932:d2bb:4fd with SMTP id d2-20020a17090694c200b00932d2bb04fdmr8026585ejy.58.1679821018291;
        Sun, 26 Mar 2023 01:56:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6cac:926d:a4f2:aa09? ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709065f8a00b0092595899cfcsm12722754eju.53.2023.03.26.01.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 01:56:57 -0700 (PDT)
Message-ID: <f59377f9-f16d-eb36-230d-430766c93be4@linaro.org>
Date:   Sun, 26 Mar 2023 10:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/4] dts: arm64: qcom: sdm845-oneplus: enable SLPI
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230325135114.21688-1-me@dylanvanassche.be>
 <20230325135114.21688-4-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230325135114.21688-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/03/2023 14:51, Dylan Van Assche wrote:
> Enable the SLPI DSP on the Oneplus 6 phone with a Qualcomm SDM845 SoC.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index b01542d79ae2..a14e6021c934 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -450,6 +450,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&slpi_pas {

Judging by context it does not look like properly ordered. m is before s.

> +	status = "okay";

status is the last property.

> +	firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };

Best regards,
Krzysztof

