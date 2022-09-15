Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F398C6FA8A
	for <phone-devel@archiver.kernel.org>; Thu, 15 Sep 2022 14:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiIOOkl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiIOOkP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Sep 2022 10:40:15 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E801E3C1
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:38:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id g3so10311833wrq.13
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6mZeceF7rfeZc7wJjrZqqoRnOO4JaL00mHNu2FRG14A=;
        b=vygv4IzQcLnnr7H8d8pLsom5/lZ9uzs+1LXwo7J04btfubOfqRNSKwnMvkrcnpjTii
         Weei4djnAVZ754kl7b6ogCd3lOAvaNmLBL8g5rdpzf657zQPdkx9nZf46TtmyQtVtBkD
         2gEwpMQvMAU5C0bq16V+gE2WzYzlAd4CnBNCP+uDXghtF9Tc24zxOgp/QquUfkMcfNJH
         kdy0ZYIcOPFkXhT4ehRR89DR6fzFeXHg80hNsLguczOUNrxV+qWkwOCNEe3IGiI3u6Ih
         p4r1KXU/PPLtEsYD5+3eIJEAIVjFC/KDV95eHQaBOjievWoNFP/7sDRhvQMoXNIpOL1r
         +FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6mZeceF7rfeZc7wJjrZqqoRnOO4JaL00mHNu2FRG14A=;
        b=mxcdj08D+Txpfxeftpb38Ov56FxJDqfH0UZdWSa3Qot9LIpWOuZQjmq4j5aH91n745
         ULIyDuFak87ZDf7r2aOpCEbXrN0IglQeuYpSKK9de3wWHbcTn660oS0trQQHcgzBer7Q
         XkTn07gPQNx4AJIPmoteodtLLXaWLG2LncSur63FARcn9LLtT1y7pTVzmBHpikQzT3Q4
         KzCq9Nb0hueGl81c+ENi6jlM6Nk6fIDMhvqGcWEidxbFMrBhSV1wjHhfwe7iy7/bak1K
         pUzzVsD7M4QO72B3qR/qvXWNo9bL+bnMJq9KDW5QYhf8iv2lxJGgDzo0ku+6w8nntjkL
         YtkA==
X-Gm-Message-State: ACgBeo2Nef9gxU3XDHWVgBnF3yUBFT0qwLaZaTXh6oBtQOT3dG8B0OtV
        VcgIAENotY86aOO/k+53kBWpCQ==
X-Google-Smtp-Source: AA6agR4moNalga88Hitwb5FNf96LKA4F6ZPVlakO5ZVEyEVtBOcJf4hHJ/dslkC/QAR93cJHIAXdWQ==
X-Received: by 2002:adf:db44:0:b0:22a:56eb:927f with SMTP id f4-20020adfdb44000000b0022a56eb927fmr15358975wrj.627.1663252678566;
        Thu, 15 Sep 2022 07:37:58 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
        by smtp.gmail.com with ESMTPSA id q123-20020a1c4381000000b003a84375d0d1sm3060464wma.44.2022.09.15.07.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:37:57 -0700 (PDT)
Message-ID: <aa728ce9-8d70-a497-8062-1320a583f28c@linaro.org>
Date:   Thu, 15 Sep 2022 15:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: sm4250: Add support for
 oneplus-billie2
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-10-iskren.chernev@gmail.com>
 <20220913213007.gdk27nxjzmagbdzn@builder.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913213007.gdk27nxjzmagbdzn@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/09/2022 22:30, Bjorn Andersson wrote:
> On Sat, Sep 10, 2022 at 05:32:13PM +0300, Iskren Chernev wrote:
>> Add initial support for OnePlus Nord N100, based on SM4250. Currently
>> working:
>> - boots
>> - usb
>> - buildin flash storage (UFS)
>> - SD card reader
>>
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>  .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 241 ++++++++++++++++++
>>  2 files changed, 242 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index f4126f7e7640..5d2570b600e0 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -137,6 +137,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-polaris.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-shift-axolotl.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>> new file mode 100644
>> index 000000000000..b9094f1efca0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
> 
> Would it be possible for you to dual license this?
> 
>> +/*
>> + * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sm4250.dtsi"
>> +
>> +/ {
>> +	model = "OnePlus Nord N100";
>> +	compatible = "oneplus,billie2", "qcom,sm4250";
>> +
>> +	/* required for bootloader to select correct board */
>> +	qcom,msm-id = <0x1a1 0x10000 0x1bc 0x10000>;
>> +	qcom,board-id = <0x1000b 0x00>;
>> +
>> +	aliases {
>> +	};
>> +
>> +	chosen {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		stdout-path = "framebuffer0";
>> +
>> +		framebuffer0: framebuffer@9d400000 {
>> +			compatible = "simple-framebuffer";
>> +			reg = <0 0x5c000000 0 (1600 * 720 * 4)>;
>> +			width = <720>;
>> +			height = <1600>;
>> +			stride = <(720 * 4)>;
>> +			format = "a8r8g8b8";
>> +		};
>> +	};
>> +};
>> +
>> +&xo_board {
>> +	clock-frequency = <19200000>;
>> +};
>> +
>> +&sleep_clk {
>> +	clock-frequency = <32764>;
>> +};
>> +
>> +&reserved_memory {
> 
> As the number of nodes grow it would be nice if these were sorted
> alphabetically.
> 
>> +	bootloader_log_mem: memory@5fff7000 {
>> +		reg = <0x00 0x5fff7000 0x00 0x8000>;
>> +		no-map;
>> +	};
>> +
>> +	ramoops@cbe00000 {
>> +		compatible = "ramoops";
>> +		reg = <0x0 0xcbe00000 0x0 0x400000>;
>> +		record-size = <0x40000>;
>> +		pmsg-size = <0x200000>;
>> +		console-size = <0x40000>;
>> +		ftrace-size = <0x40000>;
>> +	};
>> +
>> +	param_mem: memory@cc200000 {
>> +		reg = <0x00 0xcc200000 0x00 0x100000>;
>> +		no-map;
>> +	};
>> +
>> +	mtp_mem: memory@cc300000 {
>> +		reg = <0x00 0xcc300000 0x00 0xb00000>;
>> +		no-map;
>> +	};
>> +};
>> +
>> +&usb3 {
>> +	status = "okay";
>> +};
> [..]
>> +&rpm_requests {
>> +	regulators-0 {
> 
> Is there a reason why you don't call this node pm6125-regulators ?

It's the follow up of:
https://lore.kernel.org/all/20220901093243.134288-1-krzysztof.kozlowski@linaro.org/

Node names should be rather generic, so just regulators.


Best regards,
Krzysztof
