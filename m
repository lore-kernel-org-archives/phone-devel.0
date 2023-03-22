Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A3CC6FD1C
	for <phone-devel@archiver.kernel.org>; Wed, 22 Mar 2023 18:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjCVSSB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Mar 2023 14:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCVSR7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Mar 2023 14:17:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E0969052
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 11:17:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id x20so1558309ljq.9
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679509052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEzaHOoXAhy7Py7zEUOXkN1OxIlV24r6VNZHwM/CBgc=;
        b=hXyBV4H9Ds+DIoTj7YZ86LCFzvef2wpv5a1s8WEH+idX6tiBRYDbOQf8YmRulnTmNr
         GLjFcrwYcsRJI3uqOyUiv0khrcIMe++eomMsdZgiQlbCVNVtV6I8KZNYRumdPjKzv2BS
         xj+ZTcvgR7Cofr1Vd7SfLrL9dijJLlEfTUf6V5tjioZlL+H5BGOznGMoHpe2TblwnXQP
         SwsolKH/PT46mFoCcz1Z0krPJDlGInpULQY67QowOTS+fXli/g9ny6Z/rqFxT4pR7JvU
         ZdTW9P4MW6d13Kez/hRFYCfQ4vy76JppUjCceVusz0cEcxQbnXVSq/e7b97raWyzGAAU
         9ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEzaHOoXAhy7Py7zEUOXkN1OxIlV24r6VNZHwM/CBgc=;
        b=Wfl03U7GAJ49jsvSMMfIpTOs47juK7uI0myD0HiTuY4GNVPK29oUyRaaRSYbp3YtSr
         Fsczgz01zEOqxHoKZK5a1oKKCoSnrjpyC3a/eSbDJRgNSQPskWX6po6/VZf0w6LC+Nek
         PriUmaSDso1Vveqw814Tz8dn4DLf0LxXFAdS2B2kC20cUozX9+/FQdVQEBiPGkLb6ko9
         AGL8Vd7RSDiM9xpdQjtwbcgGp9Jjx6TAmXfkLF5dkOP/5ncmyhh3L/LzzU/yqTVVNvhW
         XeSS0tiocgYtavc1BbRU3p69HyeQDUiZ/8SZ/hZtW70pkGnnsx+pqv1OLLlhZg/77YWb
         LvNA==
X-Gm-Message-State: AO0yUKXOKWMC1ceWHDc/uUR15jpOEhKjtD34m4ctNEnsyxfn8tHAeXkf
        X/yb+YF1qK2xe9obm77zeCPg9g3BCVCfxvESzmQ=
X-Google-Smtp-Source: AK7set/HehCfTXsidBXum81AxzNuLRbdINRXSSnWRmAmL6tioPdxJPspHLb991LYmugfJl3tCAsw4g==
X-Received: by 2002:a2e:944b:0:b0:2a0:f395:cc4c with SMTP id o11-20020a2e944b000000b002a0f395cc4cmr906793ljh.49.1679509052724;
        Wed, 22 Mar 2023 11:17:32 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id t24-20020a2e9d18000000b00295b6bdfdfdsm2678594lji.4.2023.03.22.11.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:17:32 -0700 (PDT)
Message-ID: <3bda06b8-dc36-e986-4ad7-f7e223b8364a@linaro.org>
Date:   Wed, 22 Mar 2023 19:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8250-xiaomi-elish-csot: Add
 Xiaomi Mi Pad 5 Pro CSOT variant
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230322171555.2154-1-lujianhua000@gmail.com>
 <20230322171555.2154-4-lujianhua000@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230322171555.2154-4-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.03.2023 18:15, Jianhua Lu wrote:
> Add support for the Xiaomi Mi Pad 5 Pro CSOT variant. The CSOT variant
> uses China Star Optoelectronics Technology (CSOT) panel.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> No changes in v2
> 
>  arch/arm64/boot/dts/qcom/Makefile              |  1 +
>  .../boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 808f46947661..b755b198cfb7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-csot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
> new file mode 100644
> index 000000000000..a4d5341495cf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Jianhua Lu <lujianhua000@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8250-xiaomi-elish-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi Mi Pad 5 Pro (CSOT)";
> +	compatible = "xiaomi,elish", "qcom,sm8250";
> +};
> +
> +&display_panel {
> +	compatible = "xiaomi,elish-csot-nt36523";
> +	status = "okay";
> +};
