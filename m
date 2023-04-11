Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4049C77B71
	for <phone-devel@archiver.kernel.org>; Tue, 11 Apr 2023 05:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjDKF4s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 11 Apr 2023 01:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjDKF4f (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 11 Apr 2023 01:56:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F9440D9
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 22:56:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id xi5so17475748ejb.13
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 22:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681192563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuWGcELmkJJ9H6v4hiFoJ9aS9O/S4iDSa8U1Z3FSqWk=;
        b=mSBugSjYIIU21dzWXZVxrW7D5jwgfpQCx7VIz5BrooQi2P6sqO33aSgyyqhHyspvYx
         uNz+BHtb2n7F0ISccM8VIRfpFJV9nI8U6lVEOyudI6Bw5v+vNkTl6jF0WLppsNKGafc3
         oZ76qFL+jbddmA7QSzXaK/J1mxlmB/9U5805LBHBiroGvCV9jRoyvAP3B9kdUT3Al5Ki
         bkx2NuRGJjIXbs2t5bJk7VF/PhRbvyD2PzY4f5icKR9JowCHd2wzFqByduQ03WoQte/+
         C0W1M49zvmu9vYWb76390e7QblxKW6Fk5LfA1jBcC9x1nTlMT3FoM2B7KKI3kMcKkHGF
         WFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWGcELmkJJ9H6v4hiFoJ9aS9O/S4iDSa8U1Z3FSqWk=;
        b=EUm60fSyiZdE6wcKku2HsDONJAmcG2Aa1HBAuHyvbQ8Ou+4EeUUHwORhSMJGUwYaVa
         3BSE+CQNuzpQXfWE5QDrCxIUA/fCHOZLvQLdxaAi5PsVjfD4cSAoCPEwPh2+nDLpAMK7
         p6ChWsLKxFOT4SlR6hpLdwLhYE7CNlEDpDUEOdUGpOiI5h0PxjgGEEIlhRHIYk6JHTS/
         dkFp+E/N+d84CGxUIjim65xdQmRmno0bA3DOEMcjpuRLCRFb913vttrHtqlBxTl1CvNu
         fDU2c6aQgIYFVsrMpmFbYb+eBZKEh5EoKQ46wrr/2iN/LAzy2ysfDgpIK9BmdH32r+Dz
         SGZg==
X-Gm-Message-State: AAQBX9dEnIz2C78lp9tAKsozT7q+QkzOGM0mbHTEfA8CsqUqEz+Orf66
        gN3i8rfKRnzb6oNR56eqZYxxSQ==
X-Google-Smtp-Source: AKy350Zgh7+AJbj5GNY3YkdS+0PmuubpT+AqluelGe7HYgpQv9YcEZZP+9h5/lpgQ278sEaZKEohiQ==
X-Received: by 2002:a17:906:c206:b0:948:112e:c49a with SMTP id d6-20020a170906c20600b00948112ec49amr10760963ejz.24.1681192563301;
        Mon, 10 Apr 2023 22:56:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id sa30-20020a1709076d1e00b0094c784f64fbsm967957ejc.66.2023.04.10.22.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:56:02 -0700 (PDT)
Message-ID: <87ef069e-eaaf-9ba3-50a1-9d401494e20a@linaro.org>
Date:   Tue, 11 Apr 2023 07:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230410160200.57261-1-joelselvaraj.oss@gmail.com>
 <20230410160200.57261-4-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410160200.57261-4-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 10/04/2023 18:01, Joel Selvaraj wrote:
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patch, we will initially enable support for the focaltech
> touchscreen used in the EBBG variant. This is done in preparation for that.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 5ed975cc6ecb..b580a32fdc3b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -268,6 +268,10 @@ &gmu {
>  	status = "okay";
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  
> @@ -376,6 +380,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  
> @@ -481,6 +489,37 @@ sdc2_card_det_n: sd-card-det-n-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +		input-enable;

input-enable is not valid.

> +	};
> +
> +	ts_reset_default: ts-reset-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +	};
> +
> +	ts_int_sleep: ts-int-sleep-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		input-enable;

input-enable is not valid.

Best regards,
Krzysztof

