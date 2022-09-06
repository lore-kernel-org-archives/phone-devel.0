Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E114ECAAA1
	for <phone-devel@archiver.kernel.org>; Tue,  6 Sep 2022 08:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiIFIeG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbiIFIeF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 6 Sep 2022 04:34:05 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE93FF75
        for <phone-devel@vger.kernel.org>; Tue,  6 Sep 2022 01:34:02 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x10so11485061ljq.4
        for <phone-devel@vger.kernel.org>; Tue, 06 Sep 2022 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MoaaiE0rKLAl2TzTI2nwsEuqohvEs2vQN4l+SMWi66s=;
        b=nNsSlwZ91EYCBo+CS0owGfQxSD9xUPrNwSXiaO3lGvxtYMrXjolYseUjT+HfmzgHxL
         /BYnaPeREWN985CV9sxfk3LraVVJd6t8nSyACq90IFCNUU/g2zbfxo3zEvMFgddKgegg
         CsGYhJM4qUpeRp5mUKXR+iR6myqA9VYkaI6ojvRLvNigaBsI74StXndwpz0oew2meQSr
         AFY8HS/t8yMuk336v0WvaxOs7AJrHwd6f+/46DmVRgaT6mtagQpvqagd8Na1qwTOwkuX
         ukHOO13AgUddS4nw02dVksWO1gbG566SW4RjnwP58ALFypmqYuKn1hD2nEMEAmaTVdJB
         9how==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MoaaiE0rKLAl2TzTI2nwsEuqohvEs2vQN4l+SMWi66s=;
        b=13r5XS+6s+K+Gz6GzxwH+9oR3DGirJj53pywUb9nCC8msSn9pNJXwS+tbN6+T9U4i0
         2dPJRQigSCHqvVNVKgSrg5J71CWR5P71UfQzWcAojDESK5HMEztGTHwqGNn7bY0A+REj
         gF5eQqE9UALZVCJ43gT9ibw8JdUiEl3tuaU8agd/8plXugjqsOyLd9DQHVX0FQkPUaxH
         NKpg9m2yQm9aXa2MCT4fvYBp1LRaizWkUZ1eAEu+HiLdBO091aTk1Nx+Zt3/cRwV85bS
         kKv9rH0hJxt5HX/1Zk5/Iau0t5B4s1NNi9TVqBHd8HIALPhebLIQZB0thtcaDShQ00Pk
         2TYg==
X-Gm-Message-State: ACgBeo0tFBxewkpONuI+kDwbqHxXtA8/A5bYWQdjZG6vdkyFmLELqlON
        Emb30mFdwSAT2pQQ6HkYDgFPDw==
X-Google-Smtp-Source: AA6agR4yloSWaCeMraxcXawRrDhzWmVYwu7k6IkSyLx1SV/lgI6MuGr8gVZSnCbMUrnEg7RqAMzXsg==
X-Received: by 2002:a2e:aa18:0:b0:261:e6a7:e08f with SMTP id bf24-20020a2eaa18000000b00261e6a7e08fmr16618945ljb.318.1662453241294;
        Tue, 06 Sep 2022 01:34:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f4b000000b00492ce573726sm1597418lfz.47.2022.09.06.01.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 01:34:00 -0700 (PDT)
Message-ID: <e655cddd-677b-f277-667f-48107671db2a@linaro.org>
Date:   Tue, 6 Sep 2022 10:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: sm4250: Add support for
 oneplus-billie2
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-10-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220903174150.3566935-10-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/09/2022 19:41, Iskren Chernev wrote:
> Add initial support for OnePlus Nord N100, based on SM4250. Currently
> working:
> - boots
> - usb
> - buildin flash storage (UFS)
> - SD card reader
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> Remaining issues from make dtbs_check:
> - rpm-requests: it doesn't like the pm6125-regulators subnode. Every other
>   DTS I checked is written in this way.

Yes, I sent patches for it, already merged, so please rebase on linux-next.

https://lore.kernel.org/all/20220828084341.112146-1-krzysztof.kozlowski@linaro.org/

> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 243 ++++++++++++++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1d86a33de528..b8c2de2932a6 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -133,6 +133,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-polaris.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-shift-axolotl.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> new file mode 100644
> index 000000000000..ea5f626a6749
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm4250.dtsi"
> +
> +/ {
> +	model = "OnePlus Nord N100";
> +	compatible = "oneplus,billie2", "qcom,sm4250";
> +
> +	/* required for bootloader to select correct board */
> +	qcom,msm-id = <0x1a1 0x10000 0x1bc 0x10000>;
> +	qcom,board-id = <0x1000b 0x00>;
> +
> +	aliases {
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "framebuffer0";
> +
> +		framebuffer0: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x5c000000 0 (1600 * 720 * 4)>;
> +			width = <720>;
> +			height = <1600>;
> +			stride = <(720 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	clocks {
> +		xo-board {

These should be overridden by label, not full node path.

> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep-clk {
> +			clock-frequency = <32764>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		mtp_mem: memory@cc300000 {
> +			reg = <0x00 0xcc300000 0x00 0xb00000>;
> +			no-map;
> +		};
> +
> +		param_mem: memory@cc200000 {
> +			reg = <0x00 0xcc200000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		bootloader_log_mem: memory@5fff7000 {
> +			reg = <0x00 0x5fff7000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		ramoops@cbe00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xcbe00000 0x0 0x400000>;
> +			record-size = <0x40000>;
> +			pmsg-size = <0x200000>;
> +			console-size = <0x40000>;
> +			ftrace-size = <0x40000>;
> +		};
> +	};
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&hsusb_phy {
> +	vdd-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l15a>;
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <14 4>;
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply = <&vreg_l22a>;
> +	vqmmc-supply = <&vreg_l5a>;
> +
> +	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	vcc-supply = <&vreg_l24a>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&vreg_l11a>;
> +	vccq2-max-microamp = <600000>;
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vddp-ref-clk-supply = <&vreg_l18a>;
> +	status = "okay";
> +};
> +
> +&rpm_requests {
> +	pm6125-regulators {

Please rebase and test with
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml



Best regards,
Krzysztof
