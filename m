Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF2C61DA4
	for <phone-devel@archiver.kernel.org>; Thu,  9 Feb 2023 14:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjBIOj5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Feb 2023 09:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjBIOjz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Feb 2023 09:39:55 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D115D3DC
        for <phone-devel@vger.kernel.org>; Thu,  9 Feb 2023 06:39:40 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id z13so1586858wmp.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Feb 2023 06:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCojH4hNqxc1P2ct87iuhUs4QYbjLoq0YF+//3KxCts=;
        b=Zc6SoVNDffEDBEH8g+eKBBQaC6iJkjSoCxjFv5P6VIKvERM2a5HlK5a+scUCc4Ok1h
         p7PqRP3wLqmcu93YCiUNFoF6v353pYPe1x+hl4nolaPMzmBnO8apccVo5LlfLWlqDQiH
         hlmBoD6DJbYtylFTC0UC6uR3LbxWjKlFqtgEtKF0V+VWHVPB06pr+BydXCfhA5W/URbA
         Gwpw3YUzCDfvJHhaed7HpZq1g6XnEmf29hzcFBxlvgPntfHCs07kvgP+usDrZgvFC7HR
         H+yXxUTuAqowoX6OYlN/obmEhFo2qDt6bRm0odua8p0KDrbxTFUn4xmXJuodBLSU+CVZ
         3XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCojH4hNqxc1P2ct87iuhUs4QYbjLoq0YF+//3KxCts=;
        b=LWQJj1nZNbHDW6lV7gQPr3dJ9O7Xk4rEZGfp0jo74rI1abVsrDNRKYIEKk1kt3Reys
         2DPZM3SMcOoZbm6m7+VhqMw1uLU7zHtwzXxzYavWUoQyHHwb0Eraz9eh83apbBeY5LZ+
         O1ckZzQHx1nlDL2cGMXIY4Jyx9km0Ab0iURK8Ac1leEFws3tWdcK8du3SHtAqp+gaoN8
         cM5cJwRdThmLfykIkVXBmJHTyntiy4deOsB9i5wWvNQaXNSga71602oqztApInpopWjp
         ZOO68bOJr78QtfWToDRTE4QQNg9iAMwkSEhwJRwyIo0vlykV0QIWuW2kyw/lpSpu6xX+
         YdEA==
X-Gm-Message-State: AO0yUKV8fRHt+IiDFTTiVWFetieqXnFwu0iQt5w5mEGiuWN0D/u8/FaO
        +jK56pj4njSEfP4VGp1ThO1LNQ==
X-Google-Smtp-Source: AK7set9LtmpClrPQfcFeByaC8Sa73pVHrg8KxE8i/xi22r9j55C/m7esYo9HnNNONnwlcbZK7ADqCA==
X-Received: by 2002:a05:600c:44c9:b0:3df:f9e9:7600 with SMTP id f9-20020a05600c44c900b003dff9e97600mr10389317wmo.25.1675953579270;
        Thu, 09 Feb 2023 06:39:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b003dec22de1b1sm2391175wmq.10.2023.02.09.06.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 06:39:38 -0800 (PST)
Message-ID: <29d63a50-bdfe-ef50-c173-cb9e37923758@linaro.org>
Date:   Thu, 9 Feb 2023 15:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: drop mshc aliases
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        m.szyprowski@samsung.com, jenneron@protonmail.com,
        markuss.broks@gmail.com, martin.juecker@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230128133151.29471-1-henrik@grimler.se>
 <20230128133151.29471-2-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128133151.29471-2-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 28/01/2023 14:31, Henrik Grimler wrote:
> They are no longer needed after commit a13e8ef6008d ("mmc: dw_mmc:
> exynos: use common_caps").
> 

Are you sure? That commit explicitly says that the caps should be set
from DT and Exynos DT does not set it everywhere...

plus if alias is missing, then the ctrl_id in dw_mmc.c is 0 and such
caps are applied everywhere - to every DWMMC device.

Best regards,
Krzysztof

