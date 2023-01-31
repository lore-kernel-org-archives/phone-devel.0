Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C3AC636CD
	for <phone-devel@archiver.kernel.org>; Tue, 31 Jan 2023 17:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjAaRcP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbjAaRcM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 31 Jan 2023 12:32:12 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34A956EC6
        for <phone-devel@vger.kernel.org>; Tue, 31 Jan 2023 09:32:09 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id m14so14474702wrg.13
        for <phone-devel@vger.kernel.org>; Tue, 31 Jan 2023 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CuHKps70Th0JGwhWBmGqTShgEX6rGAigmrTuj9OLyU=;
        b=q5rHNABBlkdhViPW0OuYkpf6eOtoWTpfUk7Ka4ALSx978K1Mhc99XVzE9YfJG3JaTT
         Eeh6e6ZMxaXJn4cIU+KnxSQG5O4ek7y6gmv3BrjQCLPIqpo5g/fE6y81H9de/UsNE38v
         YksWjO8LSaOb1GQjTdFg6tvdjvDml897KbL1fs+XwpL+gTZCdORr8RMQwbBSDY6XI5nv
         hpWBhhedi4YdlUCg/i6cvkS+RVkBN6fmKVVtXcQrzhqyYLLeWz4MXhrORZX4NHVil9hc
         BA+OjWESMp0WUR75LZkmNhsT2btJwUWI+Yyg7MjJhI8oZq0SfHS61CTaxRuiuGm628Dc
         A/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CuHKps70Th0JGwhWBmGqTShgEX6rGAigmrTuj9OLyU=;
        b=6TVjHikkI6usdMbnSWFkMTzA3IS4OesADWQUkjHwvtl8Asz1PLInkVg6LN1JTwES92
         xpTC2jYZvRBjU/Exsykc6EzPADSCp0AdQd4BcMaljTEU6XX90qWezQdCZ74zV7ImOy9o
         FWn9pRj70Ty8xyMomF0q8mBEYvMjx9AaHMSfbkgDLz+7HXBERsz67otLLueb/lV4Wepb
         hEDiGzf7pGAZECHgEMVVquDLegLWYi4wzmegAetploDnYgsKpE5HlO5XFNDH9Qig3vSG
         w36OqBFvpWnfmAUKrauwNM4kZ73LDQCXolPvviilb29hGlV8YVj4ojNRziyBp2jyeWQ4
         NHzw==
X-Gm-Message-State: AFqh2krGlBfOGdn4KDpgbCXqiJI2VeWAobB2z6+lsM9WcuVARzqpSH4h
        1LS289Ia6la9Rq0CS1DnEJs/Mw==
X-Google-Smtp-Source: AMrXdXv8k8Tg3vIs2xhUZQj7w1uQ9ulfgatRSOVAT/xBwk1bew0zK3kfBW/5yEUINCGGSH/H+7iinw==
X-Received: by 2002:a5d:6a47:0:b0:2be:64bb:1d84 with SMTP id t7-20020a5d6a47000000b002be64bb1d84mr34046276wrw.24.1675186328393;
        Tue, 31 Jan 2023 09:32:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c13-20020adffb0d000000b002bfd190fd60sm14563771wrr.108.2023.01.31.09.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 09:32:07 -0800 (PST)
Message-ID: <a3fdb1a7-0585-6282-0b84-27c82a35244b@linaro.org>
Date:   Tue, 31 Jan 2023 18:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] dt-bindings: phy: samsung,dp-video-phy: deprecate
 syscon phandle
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        replicant@osuosl.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
 <20230127194057.186458-3-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127194057.186458-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/01/2023 20:40, Krzysztof Kozlowski wrote:
> The DisplayPort phy is actually part of the Power Management Unit system
> controller, thus it should be its child, instead of sibling node with
> syscon phandle.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/phy/samsung,dp-video-phy.yaml        | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Hi Vinod,

It turns out, my previous patch (1/8, which I took via Samsung SoC)
actually depends on these here. Without these here it causes warning.
That 1/8 patch is already in soc tree and will be for v6.3. Will you be
taking these for v6.3? If not, could you Ack and I will take them.

Best regards,
Krzysztof

