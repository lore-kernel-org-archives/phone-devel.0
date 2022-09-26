Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDA3C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbiIZI4b (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbiIZI42 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:56:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E013DBC7
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:56:26 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id ay36so4019687wmb.0
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=LivMufJfxLpe4WS1qV8qZqQ4CFkVL3CKwRAqAJHi1Es=;
        b=MRgp3u3JMORAFJM1sdZCZ+fpbuvN/7UVQgKaoUDWgnopUmx0KzboYH4qBgaa586Mde
         xjhaIqpQuYs6QeA3esTVl9PVqvdZ5WWnp8gzolizgYe/R3mJfJYbDVEzq/HN5SIGHWqs
         ZWrlxyCysl9mkx+q0cGFTdlKtPWJE7gXl4F/u/rVlQ5MSmjOpkRdxoMG6UfV7cUXScjJ
         /RpTRHqNag6vzFDFWtUM/WPB6ahMzKhSB9FOD52qmzoHJY74vIWpvcExI3Xn9t+YH4t5
         61KB3VEE0zuIzig4eUNlE1jHmWXdiVHefncrl5Qm9cTQ/jUJbWpkEbgbVXKJ7a3afli9
         lPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=LivMufJfxLpe4WS1qV8qZqQ4CFkVL3CKwRAqAJHi1Es=;
        b=RrKUfHUh0KC3qj9drh3lVpKmX5juO8oKuTe0W6AzayFdbWMnkGGJt4p1O6m5OuLJew
         R752VKk8SYyjUAprj/gXzYwcaOWvHXRw7cPYHCRFGmKVEcZ9vgO0qgUov5Hv/SUfQ6EN
         VrenVe/+ioStnFYsnityT0jvNZb1BwMc4RROwuD5Xsz4x0mvsArBEVafe5E5JtkNiJJO
         u0HbncgJWebn8S7VDNevomolWBl5fFIq13uC/jz8iTbS+fcGPv+rDYWEYcabTw2ozIRo
         zGH0hfzkZmxB6/MNZKsVpoD5HE9+ujItxP1n+RVlNGWE97omCVXtxnxVQZH8oaFOKbuI
         /whg==
X-Gm-Message-State: ACrzQf1bENmiJFBYr2oTeEboykE/FSLOIJ4AoIWg8kS5NZ0InuDRzw1N
        W0uJxwfz5ZxmJIXpP9cmLoqIrA==
X-Google-Smtp-Source: AMsMyM4Y59b0CEMYEx8UROytR1dUIY3XCcqskebtJQmrX/B7U6CuFkbooGLEL9GFVFs90Z58A0aXLQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c709:4322 with SMTP id g11-20020a05600c310b00b003b4c7094322mr20567216wmo.141.1664182584628;
        Mon, 26 Sep 2022 01:56:24 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id r14-20020a0560001b8e00b0022afcc11f65sm13731379wru.47.2022.09.26.01.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:56:24 -0700 (PDT)
Message-ID: <199190a8-611a-7940-0109-a5a509b3dc87@linaro.org>
Date:   Mon, 26 Sep 2022 10:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: fix regulators node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925210229.128462-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 23:02, Luca Weiss wrote:
> Adjust the node name to match bindings and fix the validation warning.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8226.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index 9b7d9d04ded6..be8c8032a3b1 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -98,7 +98,7 @@ pm8226_1: pm8226@1 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		pm8226_spmi_regulators: pm8226-regulators {
> +		pm8226_spmi_regulators: regulators {
>   			compatible = "qcom,pm8226-regulators";
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
