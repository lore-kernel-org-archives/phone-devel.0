Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D797C001E0
	for <phone-devel@archiver.kernel.org>; Wed,  5 Jul 2023 09:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjGEJtH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjGEJtG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 Jul 2023 05:49:06 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247781712
        for <phone-devel@vger.kernel.org>; Wed,  5 Jul 2023 02:49:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9924ac01f98so792184066b.1
        for <phone-devel@vger.kernel.org>; Wed, 05 Jul 2023 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550542; x=1691142542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0hymjdKc3LsDVZbTn71V/iWvkbZjVQzkC0ykYCrDKA=;
        b=yAI+yvX50cia2w9g3lMHPgK1Gj8OjNFJSebhnkV/MYd6/+cOKoXjNTbDKMyAU8SATj
         YGSwBZUzVqYnNhZ8moPIiSUE50iEZOGh45nlzpgnlzu0Hzl6U/qF0sUrBVfah4MzC51d
         M78rLVgYEdGjqmGgMJ7BXB3glgWDvDPQe3GVJKbGU6BS7Znls1D02PsZNK3N/IPV30uN
         jYGpHwl7mu/H6ypDxCFF9NI5/e0K/1J16CYBp46cMl5ZSX+KVceX9ewajZqQyVfRJ2iU
         ZraZ2nTu2DEeUawCgomituhKmvRfBH5iZMn3zNcA55MQVoKqcL2DWx9A8l9MkT480CUf
         OQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550542; x=1691142542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0hymjdKc3LsDVZbTn71V/iWvkbZjVQzkC0ykYCrDKA=;
        b=IdYxCXF7jCR45ptXCs79rcTsbOSaQK/MzvgjntsrhWkWmUT67XqkCsaFcphm56GzuV
         iO1KJpGwvB+p6/wW46xV+VOnNTww0tjy15Ckl9SBSTLzxDm5IfgYs9MceCOTLdd/4/1P
         cwAoLgPVftSnmh92cE3voAUHLkOYzaeG/21HvLCg3ntiQBNTN2NTTmStKpx1Bi9kh2Re
         uj2gRqHdEG1kepkqStUph9Znjse1dkFkEw+uVNFS65yDT80dmaLtt8WZbHDqvgYZduyo
         uZVx9XZwJ35G1vOOe6b/9Yoexr5q+mKbl6hFtfcbG3CGGT+n/q/xqVxaUiUi1aS8DeJM
         DgEA==
X-Gm-Message-State: ABy/qLbqsatxJdp+UdB1APFKUOsz1jSgGtGOa1WBP8LcoMJ0xiiLtk7v
        spxvLhsu3ZeJe4c1iRv04Vg87A==
X-Google-Smtp-Source: APBJJlHizyjKeH7/oYcU4+EGoyZ6s2G1hWWl7OQFBPr94hAtXsAhkUwUDD4PlFbie+q6czFqVk7J3w==
X-Received: by 2002:a17:906:114e:b0:966:5a6c:752d with SMTP id i14-20020a170906114e00b009665a6c752dmr11681724eja.20.1688550542639;
        Wed, 05 Jul 2023 02:49:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906088500b0098963eb0c3dsm14325556eje.26.2023.07.05.02.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:49:02 -0700 (PDT)
Message-ID: <f888e7e2-9a7d-4525-78a3-cfdecdc8a918@linaro.org>
Date:   Wed, 5 Jul 2023 11:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        map220v <map220v300@gmail.com>
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-6-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-6-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/07/2023 18:31, David Wronek wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add the PARENT_ENABLE flag to prevent the clock from getting stuck at
> boot.

What does it mean that "clock getting stuck at boot"? How a clock can stuck?

> 
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
> Signed-off-by: map220v <map220v300@gmail.com>

Same concerns as for other patches with this. Look:
https://github.com/map220v/sm7125-mainline/commit/e754e5725cb596049df2437d7c857e4d232e87fb

No SoB.

> Signed-off-by: David Wronek <davidwronek@gmail.com>

Fixes must be either first in series or better sent separately. There is
no reason for them to be in this patchset in the first place, because
they are not related.

Best regards,
Krzysztof

