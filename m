Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B4C2BB41
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 09:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbiHPJbh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbiHPJae (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 05:30:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B529039B99
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:52:04 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s9so9852089ljs.6
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Zo8H3uzErLP1wNsnlXwUezo5M3r0n38M91eeu4OULT8=;
        b=jYUghN9OlERJWRrLTTvraX96AytkJohc0st+7N7n7OB4ZSPw8KZwEmt2cFt0sxN3Tk
         PGpXWGU/W/VXC2vX9FtohU70nERi3HQZPDO5ttWiI+7lZuCvZiNJ8KkssrR55EBvxTvN
         WyumD4f2peQ9blnK5oI0sH9qiHpPEQXlG0YKYhkbTRy3lkPgZhq7aFhIr+S8BA5YAQI1
         BQ7ie9FMwQ7JCMwe1Rgb/uGycDcD72o+idkASf6Yxl/sz/zUvkKik3IEvp1bIRhzAzOl
         pLfa9syB+HQCp5lGEVj1hJfg2FNfAq6GBQt4eek0mX77L/9olL5guGe+TeR24sozxguA
         O3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Zo8H3uzErLP1wNsnlXwUezo5M3r0n38M91eeu4OULT8=;
        b=JyM2ncFd/Sgm6p7JqUB4PhfNkk3IVf+4xfr/tGpWz+qXTXicFRuf539koJJ8y2/wq9
         vNv8GgujGf3INLSvti1IbAkCTwJdOZH75bHRHJ3uaVpy6j62uaLZjSTrvx6Vtp01dM49
         utx0CMKcBWwn8jYqtD5OW5QavggQzXLDywtdWhuUoAxdSE9eD05dtVkuSQVPI4aQPu8Z
         ZZSiNFuq97XZ1lbTqE5XPL9ECLUbvpk0EWMkNQTQnIGpYyAyHddAgMJDDcN+b2BAeznx
         x2MAfo6OQbMVW2RJ8GlcmAwjccLo3mjclONJ84sLZBgoMb4/LSyzIybEXXVvVl8gu6r5
         oZOg==
X-Gm-Message-State: ACgBeo0w1CExvRcIdsdJhI5PIybAfzyRjgz21E6iL3eoUHztZfu3KRbw
        Oy5NLba/fIQ/nPTWqKoBMx/NJQ==
X-Google-Smtp-Source: AA6agR6+SnVBnZcM+MorC2B6pGea+5Cy8dza4nJPUFRgbZ+cRDJR1xIU0DuzrV6wJ5MeUlQmtuJ8xA==
X-Received: by 2002:a05:651c:2212:b0:25e:cc38:a1dc with SMTP id y18-20020a05651c221200b0025ecc38a1dcmr6509948ljq.359.1660636323001;
        Tue, 16 Aug 2022 00:52:03 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id p4-20020a19f004000000b0048a98b7bad3sm1302318lfc.197.2022.08.16.00.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:52:02 -0700 (PDT)
Message-ID: <a11bc22e-a10e-7d15-72d2-6af1d4790695@linaro.org>
Date:   Tue, 16 Aug 2022 10:52:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add initial support for
 Pine64 PinePhone Pro
Content-Language: en-US
To:     Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de
Cc:     martijn@brixit.nl, ayufan@ayufan.eu, megi@xff.cz,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220815123004.252014-1-tom@tom-fitzhenry.me.uk>
 <20220815123004.252014-3-tom@tom-fitzhenry.me.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815123004.252014-3-tom@tom-fitzhenry.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/08/2022 15:30, Tom Fitzhenry wrote:
> +
> +/dts-v1/;
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include "rk3399.dtsi"
> +#include "rk3399-opp.dtsi"
> +
> +/ {
> +	model = "Pine64 PinePhonePro";
> +	compatible = "pine64,pinephone-pro", "rockchip,rk3399";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &sdio0;
> +		mmc1 = &sdmmc;
> +		mmc2 = &sdhci;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwrbtn_pin>;
> +
> +		power {

Still wrong. Do not ignore comments and test your DTS with dtbs_check.

Best regards,
Krzysztof
