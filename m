Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F299C77B6F
	for <phone-devel@archiver.kernel.org>; Tue, 11 Apr 2023 19:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjDKT70 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 11 Apr 2023 15:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjDKT7Z (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 11 Apr 2023 15:59:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366AF4C1C
        for <phone-devel@vger.kernel.org>; Tue, 11 Apr 2023 12:59:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g19so54878382lfr.9
        for <phone-devel@vger.kernel.org>; Tue, 11 Apr 2023 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681243162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfS7WmYRI6Vf1mOm83+CHCT9NQ7SC/oE1NYul90QgyY=;
        b=djKrnZYTSVGonJkATrMzcwSO7/oFDCs0rfgwcZBdfg2XZdOrti2R8Wr+L8W0+l4Z2y
         zK20+W4b+GU5JLd6MkocmX7M+ATQchs9MvZMCh8Txx2LDtlwaYlOGzD8bDbBjsHDBzL2
         dxQxeczm++aRygrW2dh5eVfNyvYkb0Gfj7iUpAwBzVTTEtWEBONblC4f9NjsAVr/kpze
         +2XYFyTzzGiq8bnuREqpgfWoNLgmjlc7UBwTxer3xM7S4NpNzNWH2ZC84mqGpobzG7lD
         72nkIC6NZmF80iU+CgbdA4kEcXQvn3DqzX9FeoThxIBeC81j53QIAg0xKETEbGgoPu2p
         aR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfS7WmYRI6Vf1mOm83+CHCT9NQ7SC/oE1NYul90QgyY=;
        b=EHRtBZWHR3+vZQursUWBS8ha5hWjnHNUsizKZ7r9MC2r6WVIXHsEfuL9FJtn57YkFm
         8QtPr2qK4vHE7Hxb+qIOUGVI+tWS/vqUQiYLTy9wL/lo2bO5qBS+sXwYAjeQiQo9JFQL
         aGWoQ39xwLk/k1KfzwOUeTxeta2jBxRHuhc8Ptp4ZOgc/7o8S2yS8krQZE40XRiCbl5x
         JumJtsFitSInkgWw1uGqigNUUUz2cgkNFx/DLcsjQDGmNR630k72nGkgfHxzqD541Jfr
         eQA6ksArvVmB8XeiOQCkEHM6JDA6xhUMJCyb7fdQssU6RA7ySbJrCMVfOncxesE5AUMo
         OINA==
X-Gm-Message-State: AAQBX9dE+PBron/TvE+aFtkZQOvVp3MMxzBhrbwg+6moS79FA4NgOkd6
        TiDZBwE20krw+8R43llR91+BqQ==
X-Google-Smtp-Source: AKy350a5BK49mbwbhFfr9inDhWPK6F5PYi9WGcVyGK9C3nPaksVpIUoewTurpeRl0eb4slgUm+PI2g==
X-Received: by 2002:ac2:4f90:0:b0:4ec:9c2e:7edb with SMTP id z16-20020ac24f90000000b004ec9c2e7edbmr340167lfs.42.1681243162287;
        Tue, 11 Apr 2023 12:59:22 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id i12-20020ac2522c000000b004db3e330dcesm2694002lfl.178.2023.04.11.12.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:59:21 -0700 (PDT)
Message-ID: <f7c0cd55-9037-f0aa-a362-b473f413ccf8@linaro.org>
Date:   Tue, 11 Apr 2023 21:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-shift-axolotl: update
 focaltech touchscreen properties
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <20230410160200.57261-6-joelselvaraj.oss@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410160200.57261-6-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10.04.2023 18:02, Joel Selvaraj wrote:
> The touchscreen nodes were added before the driver patches were merged.
> Update the focaltech touchscreen properties to match with the upstreamed
> focaltech driver. Also, the touchscreen used is in axolotl is fts5452
> and not fts8719.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
same comments as 4/5

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index b54e304abf71..96dd4628d9a7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -474,23 +474,22 @@ &i2c5 {
>  	status = "okay";
>  
>  	touchscreen@38 {
> -		compatible = "focaltech,fts8719";
> +		compatible = "focaltech,fts5452";
>  		reg = <0x38>;
> -		wakeup-source;
> +
>  		interrupt-parent = <&tlmm>;
> -		interrupts = <125 0x2>;
> -		vdd-supply = <&vreg_l28a_3p0>;
> -		vcc-i2c-supply = <&vreg_l14a_1p88>;
> +		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l28a_3p0>;
> +		vddio-supply = <&vreg_l14a_1p88>;
>  
>  		pinctrl-names = "default", "suspend";
>  		pinctrl-0 = <&ts_int_active &ts_reset_active>;
>  		pinctrl-1 = <&ts_int_suspend &ts_reset_suspend>;
>  
> -		reset-gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> -		irq-gpio = <&tlmm 125 GPIO_TRANSITORY>;
>  		touchscreen-size-x = <1080>;
>  		touchscreen-size-y = <2160>;
> -		focaltech,max-touch-number = <5>;
>  	};
>  };
>  
