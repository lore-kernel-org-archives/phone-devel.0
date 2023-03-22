Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB3EC6FD1F
	for <phone-devel@archiver.kernel.org>; Wed, 22 Mar 2023 18:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjCVSRe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Mar 2023 14:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjCVSRV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Mar 2023 14:17:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4F669221
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 11:17:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id br6so24540653lfb.11
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679509028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoSgdG7s3bKShQTqpe8jwToyGISfP/FYdPIOGIYWSIs=;
        b=cml2JibZCzPY+EbZLOBMdGOTFwhLyqofnZcu4ceHHpd5qy0aQhGcMwPClJ5laVnYP8
         Ztny+a5DCjy7XSdbVF36W507KgsdDB2QN+crWFaOdAyEsC+T7ZPTXI9ZXBYza7JpxQuJ
         ODMsllx/NgGT4iL1l+Up/7vfGgfwf2Ek0+WTZ7D/yZAs+7fQJgrfNJQS9MC8ESlyOpKI
         9Y1BX7o5vvjQHxch+lR2aCQlRp7Q0BVvFDK4t8e0RLEizfhJDcwZQD3+sAugP28DJ9Ju
         mei41YCFhdgJVFwAfC4W+wmcEJ0zLZ5J0MtwuzapSsU3cjPej6zd8M/U84ZwIku0jHdU
         dFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoSgdG7s3bKShQTqpe8jwToyGISfP/FYdPIOGIYWSIs=;
        b=LbmXnCbXFJzVSvHEpJVcgKIWID9jgOM9bv7Sp1YJKXitnYZWyYpESJSZsNIku2vmIc
         e8vpID5xUS9HWg4eX/yfs8nlPcYR4ySMqFOc/tW8U5C+cciZUuWFBS0gzxZculNaEZkr
         SRDnkgMvIGxNeGggpUubeiFR/NWV/vLWBOi+QzzPWrtb63FMPg/rroAFsR4u5Mq6eKF1
         ZKuaNwff/wJ/5NqAJ5/wUXETlZ2/2mCKrFvuUziwv/5CIw6D7CtJepIEsob4PUn+T9rB
         TdDGrGakGwP5XBJqDVSxYG/9LVv+kO+pHfaPcn6ciNT52bsbpMMJ9mk2OXEza2X31oz+
         hN5w==
X-Gm-Message-State: AO0yUKXKtA9rfSLgodwg8YsxbmVFTky2p2aSpn2axg02449xibtUHyaS
        VkoESD8u1BBDOP4HP7NCMfnw8g==
X-Google-Smtp-Source: AK7set9gcHwS3CbS8sTOjY1chtfRDx4b6/cr3XOyM62LU1vSg/59jzPcR+VXh09W9uhxGf1IA9hfRQ==
X-Received: by 2002:ac2:5601:0:b0:4dd:cbf3:e981 with SMTP id v1-20020ac25601000000b004ddcbf3e981mr1874224lfd.28.1679509028215;
        Wed, 22 Mar 2023 11:17:08 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm2648592lfe.47.2023.03.22.11.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:17:07 -0700 (PDT)
Message-ID: <0fd181f0-029f-54d2-e335-668e73011648@linaro.org>
Date:   Wed, 22 Mar 2023 19:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8250-xiaomi-elish-boe: Add
 Xiaomi Mi Pad 5 Pro BOE variant
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
 <20230322171555.2154-3-lujianhua000@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230322171555.2154-3-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.03.2023 18:15, Jianhua Lu wrote:
> Add support for the Xiaomi Mi Pad 5 Pro BOE variant. The BOE variant
> uses BOE Technology panel.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
Squash with [1/4]

Konrad

> Changes in v2:
>   - Get rid of sm8250-xiaomi-elish.dtb
> 
>  arch/arm64/boot/dts/qcom/Makefile              |  1 +
>  .../boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 8d2b3c57a4a8..808f46947661 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> new file mode 100644
> index 000000000000..8b2ae39950ff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
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
> +	model = "Xiaomi Mi Pad 5 Pro (BOE)";
> +	compatible = "xiaomi,elish", "qcom,sm8250";
> +};
> +
> +&display_panel {
> +	compatible = "xiaomi,elish-boe-nt36523";
> +	status = "okay";
> +};
