Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5097C4708B
	for <phone-devel@archiver.kernel.org>; Mon, 28 Nov 2022 14:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiK1Ol5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Nov 2022 09:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiK1Olg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Nov 2022 09:41:36 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571B222B14
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 06:41:35 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d3so13405844ljl.1
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4lnKP3fXJhhfhYAB5tHHhf2uf6LSYxLid5Gmw6TDds=;
        b=ipZ6goqQRYRM039KEmlmpe+yXXPb65AXhrDqTOpiHM0io5rTidkJwGFGQNpxMZaqxM
         5tQdAd/KgUE0Rjbz4mJLMg7D4zEE4pav2S6SZnmuYhz8GvDM4ltrKnIHcY+9MyW/P0eX
         PVME1JKPzCCxuRHaSdPNHwQgG4jkoSFBc0sdSSfyo6xsAYAXsVTLBQirtACdbjxMQBmR
         O5x2SJyKMETQun8rl4N6CjeVIRSXLc/chVP52zQWCIusd8tzvLUTYsfBZmZBES/nVkzS
         JIdtqxGWblQ1MTu4FvcXZtj7Ck8rdHvsjru6tiEu1j+fOvdtCNajkATOVkZ0jJD3xdRN
         lXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4lnKP3fXJhhfhYAB5tHHhf2uf6LSYxLid5Gmw6TDds=;
        b=Y/uVjxC7y6qPWdfpN6vI4RQ9kYGSLKT69bsL4UWRkcpITtQDl5g5Z4xffA2XwyS30S
         GqvsgeQOhhL3IKdFF7U+S1VmpVpor/H3+T19/gngiQVKTiCZdnoyPBRaRCR68txgePaC
         TielOeSKrUIWIC/hsn1cD+G7lrfb3mJErVRwARBQuO4iwHKQvNkR0M8zVSkHWzgn7vdn
         8aaOTYyPTF4Qb+rHnBP7uBevKtbRYSnwG8EBnmdLYGbji1GrUOUnhAWLRAH/4CAXyo2i
         cAh+DYkQUTiboQTTDEwMq8ACPGA3nP+ruWBL9renm/riichX1ntiVcoRuCHsjvKH38h/
         IC0g==
X-Gm-Message-State: ANoB5pmALOYfY2fL/dDB5iwrnekNWEs94+m07tbqVYEUQNlVc0uMYBGa
        Fjba35BYfc/p9GmT5Ew+E2ULCg==
X-Google-Smtp-Source: AA0mqf7/b6u6RudEIT37qPuumAQbfUbUQ127rX+UuN8zLFXXD6vVyh4onO0DbgE3eXvQWFtoiMyIFg==
X-Received: by 2002:a2e:2414:0:b0:279:9956:3e5 with SMTP id k20-20020a2e2414000000b00279995603e5mr3595815ljk.34.1669646493682;
        Mon, 28 Nov 2022 06:41:33 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id bj25-20020a2eaa99000000b002770a9ed61bsm1219129ljb.66.2022.11.28.06.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 06:41:33 -0800 (PST)
Message-ID: <a64d31a5-5e55-35b9-57e3-bb4214fe3e28@linaro.org>
Date:   Mon, 28 Nov 2022 15:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Enable ADSP
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221125223400.94515-1-matti.lehtimaki@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221125223400.94515-1-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 25.11.2022 23:34, Matti Lehtimäki wrote:
> Configure the reserved memory for ADSP and enable it.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> index 1c52337af560..859e91c16c61 100644
> --- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -133,7 +133,8 @@ wcnss@d200000 {
>  			no-map;
>  		};
>  
> -		adsp@d900000 {
> +		/delete-node/ adsp@dc00000;
Please delete nodes by referencing the label like so:

/delete-node/ &adsp_region;

Konrad
> +		adsp_region: adsp@d900000 {
>  			reg = <0x0d900000 0x1800000>;
>  			no-map;
>  		};
> @@ -169,6 +170,10 @@ rmtfs@fd80000 {
>  	};
>  };
>  
> +&adsp {
> +	status = "okay";
> +};
> +
>  &blsp1_i2c2 {
>  	status = "okay";
>  
