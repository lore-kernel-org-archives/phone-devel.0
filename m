Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17C7CE79DE
	for <phone-devel@archiver.kernel.org>; Wed, 20 Sep 2023 14:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbjITOsO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 20 Sep 2023 10:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236673AbjITOsD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 20 Sep 2023 10:48:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3D9E4B
        for <phone-devel@vger.kernel.org>; Wed, 20 Sep 2023 07:47:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50300141a64so7489420e87.0
        for <phone-devel@vger.kernel.org>; Wed, 20 Sep 2023 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695221252; x=1695826052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cF+h5j15Rca2B8Ac70UcdcDuVaOzRHd+CtHU3r+VSA=;
        b=aab4BhcJPtrXm+QA7o67bXkoyOT7nNdsdAdQ3mooNefjfXQM6/nYyotQ2zv2FdfeMX
         9AEVwFhRWZhA1SCspHH4cd19x5PDA9fhJ3/hPj85pA+A/qIf3vramc0UF1X95ttjtV2u
         wnjpszXZsnWWM0CUeWdZcb/lhIR2Zf8cGghlg6nxsTjiKutnjPlM/izY8SUSab/wRJPE
         2StPYkRxpLL+pVk1Af+pbnG7BCSAgtqCz7RTxVOgzCFJecrJqUyjePJxBe6Ff4o60rH+
         py5WWu9vstXk3s5PmGjMMpp4+PIkmTSaUmyduNjrXDWWOn4LEBa1sJSOCVi+NeZaWP5k
         crWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695221252; x=1695826052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cF+h5j15Rca2B8Ac70UcdcDuVaOzRHd+CtHU3r+VSA=;
        b=Z3LrpbH1LHyhdY6opWNX1EpX+18wgAhewPlQvDFXakDz70Rut5yZlKqBhRScYejL1V
         /I0dySZaq7kh2/jfgT4mfAeZxjFdRQQtk2tW4A5tJHr3PwzJYKeucneaLoN3aMunp6FC
         dO39xY279KMh4PrCVBX9zR8K63M1S9vnE8tFNbHxoGUaszzEZWgGRbiXthf39KTDS1lG
         MKhGNAWSK0XjoMyiQY7xju2+BXMYQCIMQnKOlvOsXWjHjh86IdLFtSY82F328l6Jak/b
         eyubjiJ3uxnQUfRtVxknMqVZBUUXXM05OEpTc1TX77Or0eQZQTJkls/WNm3b+ikdnuLG
         /hbQ==
X-Gm-Message-State: AOJu0Yz7K/jv9id5HSgQSTZSJX1dYAK0/TLpgOqieNyfTrWr0+dtwvlT
        H7NKzWCXyGjLhdmEmS3GyUB9sw==
X-Google-Smtp-Source: AGHT+IEC4UKJzn8HINvDR186oQwvlaGU0qyeL+doNP5/QKlVeseSI6jPj0WZSM0ZMJt4ddKdxluT0Q==
X-Received: by 2002:a05:6512:513:b0:4fe:c98:789a with SMTP id o19-20020a056512051300b004fe0c98789amr2514259lfb.37.1695221252005;
        Wed, 20 Sep 2023 07:47:32 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id bo6-20020a0564020b2600b0052284228e3bsm9092882edb.8.2023.09.20.07.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 07:47:31 -0700 (PDT)
Message-ID: <44a00fc6-d700-4713-34f0-36b172d8cb90@linaro.org>
Date:   Wed, 20 Sep 2023 16:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20230916134147.163764-1-lukas.walter@aceart.de>
 <20230916134147.163764-2-lukas.walter@aceart.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230916134147.163764-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 9/16/23 15:41, Lukas Walter wrote:
> This dts adds support for Huawei Honor 5X / GR5 (2016) smartphone
> released in 2015.
> 
> Add device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI (internal and external storage)
> - WCNSS (BT/WIFI)
> - Sensors (accelerometer, proximity and gyroscope)
> - Vibrator
> - Touchscreen
> 
> Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
Beyond the signoff question from Krzysztof, this looks really good.
Some comments below.

[...]

> +
> +	reserved-memory {
> +		reserved@84a00000 {
> +			reg = <0x0 0x84a00000 0x0 0x1600000>;
> +			no-map;
> +		};
Do we know what this is for?


> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&gpio_hall_sensor_default>;
> +		pinctrl-names = "default";
> +
> +		label = "GPIO Hall Effect Sensor";
I think we can have both hall sensor and V+ under gpio-keys

And then I am not sure how useful the label is for the container
node, maybe you or somebody else can tell me whether it's used
anywhere
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
Should this not be a wakeup-source btw?

> +		};
> +	};
> +
[...]

> +		/*
> +		 * NOTE: vdd is not directly supplied by pm8916_l16, it seems to be a
> +		 * fixed regulator that is automatically enabled by pm8916_l16.
That sounds reasonable, many boards have such circuits

Konrad
