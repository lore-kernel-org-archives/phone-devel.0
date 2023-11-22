Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A84C61D97
	for <phone-devel@archiver.kernel.org>; Wed, 22 Nov 2023 20:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbjKVURo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Nov 2023 15:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjKVURn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Nov 2023 15:17:43 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E471B5
        for <phone-devel@vger.kernel.org>; Wed, 22 Nov 2023 12:17:39 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66d0760cd20so2000016d6.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Nov 2023 12:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700684258; x=1701289058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfuhOg7fLREVYMm9dTzTXqALWreH+h6p9+qLhzePyFY=;
        b=mCt1Ud86u/P9z2hfz+yptcH1KYFlAVMJTiESZqHdsmI1s5KJMue65vlEIif8MwRwOF
         Fc9spZOCFU3TPJ3H7ZsDCS9adqAapWB0BdxfDjyvy2su3LokaH6BODgMnX0D0DAMwF0y
         iJD6nrATC0sjCYI/FXcl+ZxeiVXXHq+pyVeRvaz+JJbu78Jd4AZzPff8ILgDp/v4Wf3v
         PHqEZSGvWRrGyqs8tsoGTwZpzVpAUveIoJeFjsBwarvDNHqq5O1OPACBfYlc7iH52kZj
         kLPhPdU5rOvX4kKs97Ie+PbXOuAub9UTGJ2tvj90hnjWTfBX1czu+1pvbGwBe/x7FEJd
         MthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684258; x=1701289058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfuhOg7fLREVYMm9dTzTXqALWreH+h6p9+qLhzePyFY=;
        b=bqDQunHqGDTh1msstv+YteqaIn4ITQecv5dB2j/fgAqrW4wcLpeKJ61AWLAPim/Vla
         WowqjjmRXfWaJ6R1okgvG5W3vV/hSmuKA2cQiDoDkFAouo1RV1FrtAhGNC3XskcoGjs0
         3PbrVs2qJxzAN+ZxlJ813buVtGcPi/mr9luYYkSzuS7zoZJEygcgtF0lp73gVw4VbtRD
         dPkiRgPk3pNEmZlV/8U1wu5HMVsdbyFudu09wSM+rPu/d+d3oP1gJ09+eVGIujkRc3kI
         f9jdxvzeVxts3gWsU1wzpmaXCYLSjnXpZ3v6WIlr4ze9gmlPv+PpRRLhtUlmpZZ52dFK
         Gj7A==
X-Gm-Message-State: AOJu0YyHNso0UThMB3fmSfJasjO+KWGQDxYO9GY/hGnyLzIG8M9eFVBJ
        jVHdRNqjzSASgng/bHmVOH7xPQ==
X-Google-Smtp-Source: AGHT+IEjLt0uBVJ+8ZR+C83Sz4GO+jKzSD8w4cQPLFvOELzntBpQJthrUn4s2ydIV5pepIe4jVNvkw==
X-Received: by 2002:a0c:f705:0:b0:670:5242:a6a1 with SMTP id w5-20020a0cf705000000b006705242a6a1mr821580qvn.31.1700684258532;
        Wed, 22 Nov 2023 12:17:38 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y4-20020a0cd984000000b00679d90922c8sm59479qvj.131.2023.11.22.12.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:17:38 -0800 (PST)
Message-ID: <d35b9250-eddb-4436-8daf-066ec84cf55f@linaro.org>
Date:   Wed, 22 Nov 2023 21:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: sm8350-lemonade(p): New devices
Content-Language: en-US
To:     Nia Espera <nespera@igalia.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob <Me@orbit.sh>, Clayton Craft <clayton@igalia.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231111-nia-sm8350-for-upstream-v4-0-3a638b02eea5@igalia.com>
 <20231111-nia-sm8350-for-upstream-v4-6-3a638b02eea5@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111-nia-sm8350-for-upstream-v4-6-3a638b02eea5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 11/11/23 23:07, Nia Espera wrote:
> Device tree files for OnePlus 9 and 9 Pro. Details of supported features
> mentioned in the cover letter for this patch series, but for
> accessibility also repeated here:
> 
> - USB OTG
> - UFS
> - Framebuffer display
> - Touchscreen (for lemonade)
> - Power & volume down keys
> - Battery reading
> - Modem, IPA, and remoteproc bringup
> 
> Steps to get booting:
> 
> - Wipe dtbo partition
> - Flash vbmeta with disabled verity bit
> - Flash kernel and initfs to boot partition with CLI args pd_ignore_unused
> and clk_ignore_unused as v1 bootimg
> - Flash rootfs to some other partition (probably super or userdata)
Thanks for including this info here

> +&pmk8350_vadc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio1_adc_default>, <&gpio3_adc_default>;
> +
> +	/* pmk8350-ref-gnd */
I fail to see the benefit in having this both here and in the label

> +	channel@0 {
> +		reg = <0x00>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pmk8350_ref_gnd";
> +	};
> +
[...]

> +&tlmm {
> +	gpio-reserved-ranges = <52 8>;
Would you know what these are connected to?

[...]

> +&mpss {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rf_cable_ant0_active>;
patch-wide:

property-n
property-names

Konrad
