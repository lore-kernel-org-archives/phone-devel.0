Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749A5C4332F
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 21:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiK0VIc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 16:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiK0VIa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 16:08:30 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C49C5F69
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:08:29 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h5so6869339ljk.11
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=pT3HaFu9cU9HMEhxgVzzS7f3D9TufxB0wrRxVR4oPrjfGuYiUi+4/6mcpcOSse1eaC
         xoDxfgVwzFTuLBFGFgVZv2XHMra60/MOXFaLbuDLNubuzXIYXnhyCCsIwYq+zitwYm4D
         9OBny9/3h1bktFRE62+9yJi+xNIiobPcMz1UNYYE6bkrDEtkFKZXvlbeRlsIBRSSsihM
         Iyaa5YpfOCghq1RplmOmbPJJwJNcBdYMakWOv7V4MwrvcHpd224Spb1z8ZKnxRFFHZWr
         zA9PouRyFSSJtot2u+VbUAAZtoHjPCJ9+GPIfE9oKHr7UhHnlF0mS0Px8sFFuaf3VGlS
         Ivwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=OLVKgWFflrRhfZbfawBUObuXWNeWJOdk0X49vJeOu1VujEl022t0zPTJPBlMrXaq3b
         rGJxsnkoiY4vDplo3N0Nk38v7AB0VHkhDH13tXkxVwzx3g0U5ql8DGrSCE9qcZZvZHTD
         g7JOTt3Pjhr8rp0m2qJWfCHy7NNN65KlrJzXy8CRTck/105Y5SRyutxp2XFHkmbyadLr
         qPoA2aZbOx3Nexno6jf5QmVQ5kQem/dy5Uhulw5xLbNeHwARkcNIWciCCANrOcoI6ky1
         CV9VqT4hZLcAv3vFmNZswvBaguPqzQ7KCqEUT4j+cjDf588vZ0tBm5LCaZmWGS/CbNh+
         2mgQ==
X-Gm-Message-State: ANoB5plCYvt3cR6rDuakLsitinkso3Dn226p2UvXoEmbyHdCoF11wppq
        Nk8OEfDmcVR/SnNZbT0IvteLEQ==
X-Google-Smtp-Source: AA0mqf7t8v/MRSZQOjDsyj59nBL5nfeomU+AHen/BKd0CVSqEQo7q6UPSAw4lqfDnteG4CxMN5v1OA==
X-Received: by 2002:a2e:8e33:0:b0:277:1d5b:74b with SMTP id r19-20020a2e8e33000000b002771d5b074bmr9151666ljk.522.1669583307357;
        Sun, 27 Nov 2022 13:08:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b004979db5aa5bsm1414367lfr.223.2022.11.27.13.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:08:26 -0800 (PST)
Message-ID: <292eca02-e59a-88af-8823-f14440ffe592@linaro.org>
Date:   Sun, 27 Nov 2022 22:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: Add OnePlus One
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Julian Goldsmith <julian@juliangoldsmith.com>,
        Oleg Chernovskiy <kanedias@keemail.me>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221127181835.806410-1-luca@z3ntu.xyz>
 <20221127181835.806410-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127181835.806410-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/11/2022 19:18, Luca Weiss wrote:
> From: Julian Goldsmith <julian@juliangoldsmith.com>
> 
> OnePlus One is a smartphone launched in 2014 and is based on the
> Snapdragon 801 SoC (-AC variant).
> 

Thank you for your patch. There is something to discuss/improve.
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&gcc {
> +	compatible = "qcom,gcc-msm8974pro-ac";
> +};
> +
> +&otg {
> +	phys = <&usb_hs1_phy>;
> +	phy-select = <&tcsr 0xb000 0>;
> +	extcon = <&smbb>, <&usb_id>;
> +	vbus-supply = <&chg_otg>;
> +
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +
> +	status = "okay";
> +
> +	ulpi {
> +		phy@a {
> +			status = "okay";

Override by label (usb_hs1_phy). If the labels are named similarly, e.g.
usb_oth and usb_hs1_phy, then they will appear next to each other during
override/extend.

Best regards,
Krzysztof

