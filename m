Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B4EC433EF
	for <phone-devel@archiver.kernel.org>; Fri, 13 May 2022 08:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378192AbiEMIZT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 May 2022 04:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378184AbiEMIZS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 May 2022 04:25:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB442A76A7
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 01:25:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h16so9702703wrb.2
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OLNggPi9wURTmTdFsJ5QHlI60DGgYDQ+f545MdR8tgw=;
        b=IOo2Iby+5VR8ErLhwrU821Fn+W4DVLNUoAN9xuJrocjsqzN8VwB1dwga+fSelG318+
         AqVAuNNVPV4Su802VSyGYu3/0JZLdTkuLxQH7y11xBqqwOYyUskn37OgrUMAKHyfinc0
         87UTWIQnadZt5WoQAYUHbUCgLSvnFDPh/a6Z/xJh0tRyh9UhsAu2rWgViktCm/Q5qyNJ
         NetdPnPRUWvpOgj+Uu1JGNTUh+S6JGqjCp0gj+hv7aA8dDIw94M755iWpN9Kb3fgPyXy
         E06pAqYseC8jCn2Hi+fO2vy+rgZwEkfMsutKNf6TOMaNOGbIi4Rxrg9QgKiSnhr1+yw7
         zYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OLNggPi9wURTmTdFsJ5QHlI60DGgYDQ+f545MdR8tgw=;
        b=frfu+6ROmWomarA/yIbuyXOfjSxm7E2an3A2Qb1BvsrNyvPDiGgASQCyzk9IB4gCe7
         kxOprP7EcScRuC1veuClJarj8sgj7+Szjo8tnUtNJqKIO6xqLo691GWDONuMiTBxhtjB
         TzlZ4Vf3TPt6gHBKedCaMjo07BMJDc1kR8QwMbZzgIPf68rva76XslwvYsUgWGAVyps8
         LKxA9XobUG7BivBd9dvESvSBvDN8rNH2RvEebnIVy7cDn2L3TBgxN2hZsOPrEzP5gsEV
         i+sPJ+ef+wHBEWOXPYVNtiQedQyHDUMKBWILFcUny6bFcj9/XNZdHaFDA3OOfLEdyis7
         fxRw==
X-Gm-Message-State: AOAM530DMZuoEiDGQrvROYbABDK5R+h5cITONfmyL9MIVevL25DiLJnA
        U6WvKOXfgwc0WCwQ2CrcI5t2XQ==
X-Google-Smtp-Source: ABdhPJzd4EUvFDocNzZ4P3/PAak/wGCKo5cLOmr0KT/Z0wzfclPL1LJJU+cIzeg2kp5UgiuN/yysEQ==
X-Received: by 2002:a05:6000:1d89:b0:205:e6d5:c571 with SMTP id bk9-20020a0560001d8900b00205e6d5c571mr2866654wrb.594.1652430315683;
        Fri, 13 May 2022 01:25:15 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b00394832af31csm5464619wms.0.2022.05.13.01.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:25:15 -0700 (PDT)
Message-ID: <dfe8f305-f864-35fb-c05d-310f6b01376b@linaro.org>
Date:   Fri, 13 May 2022 10:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm6125-seine: Configure additional
 trinket thermistors
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-8-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511220613.1015472-8-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/05/2022 00:06, Marijn Suijten wrote:
> +
> +&pm6125_gpio {
> +	camera_flash_therm: camera-flash-therm {

Align with dtschema please:

https://lore.kernel.org/all/20220507194913.261121-6-krzysztof.kozlowski@linaro.org/

> +		pins = "gpio3";
> +		function = "normal";

I think there are macros for the function

> +		bias-high-impedance;
> +	};
> +
> +	emmc_ufs_therm: emmc-ufs-therm {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-high-impedance;
> +	};
> +
> +	rf_pa1_therm: rf-pa1-therm {
> +		pins = "gpio7";
> +		function = "normal";
> +		bias-high-impedance;



Best regards,
Krzysztof
