Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6400EC4167B
	for <phone-devel@archiver.kernel.org>; Sat, 31 Dec 2022 18:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiLaS4Z (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 31 Dec 2022 13:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiLaS4Y (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 31 Dec 2022 13:56:24 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A3AE9C
        for <phone-devel@vger.kernel.org>; Sat, 31 Dec 2022 10:56:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so36214003lfv.2
        for <phone-devel@vger.kernel.org>; Sat, 31 Dec 2022 10:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=492r+yHdPMIoILRLNSFxtqbe5eiM6CMIAFGWnVFQ6z4=;
        b=DoHcuI1rMdXexe2kY5VzaXWPc4wCEoewmgZDGedv5XM1Vt7Ue8EhfdBPHyPGX+OpHG
         8cisv7vaV9DNF3uZ4/zBhiP9MAGmJQiSDx9RZzs0E65oXOOcJFDzQ7cyHzfOh99jDhkv
         403Ud+Xe/jeoj1X+QVBGmHnPgHYbwPeBSyxyLoglfovbGmrkofH9JVyTLeyrRZkhFeSB
         2p3L2Wrgdg7UCa8vlvG6iyEPz7P4e4aWCiMYraoTxXcA+ngKJsCiMgntpKkrQhx1hQab
         sHfNLHZGmIa8UQWmKDXWi+/XC4cAxMpixyJpriGHZzmFcucTSShVy3cr/gVQyaM2UhC1
         bkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=492r+yHdPMIoILRLNSFxtqbe5eiM6CMIAFGWnVFQ6z4=;
        b=WEOvfZ0yABXrXZp+2+kDDs6hADjfnIppeOk8wsOMqAjV0xkhMjjLCk8kthheq6qEKa
         yHo/l12+0FnNiSQR2EQXNDXmYALKkmpt71wylSf1mR4ms3A1q4AttJS28IUrT/XyenaX
         encRciHX/gZk+kznWGYJ2Fvn7gsDfRzRS2rfafXfpxy/IffJ3ZRq+H2+yBt7R9by+FRV
         V2+GWFA992skYPR4BEmvcCL8NrUWqe0wSC7CY3Ep5y3SwMuFpUIpXbE/dp9Zdb/ciUl9
         bgd2w/wpAgFdJ6gEHvlpyeUAbb4RtPGfymyBC8+dj0GwyPfjqn5CfawS8UosmkihqHys
         tR5w==
X-Gm-Message-State: AFqh2kqaxLQt6V3lsV1wxmS6vI36KlrxnOgBwl6TIyKo10cHuW2Gk9SO
        4tz06u+Z9TjI2wTIeNX8jucD5w==
X-Google-Smtp-Source: AMrXdXu8eL8KxwSARuXzEKBEb1u2dlv6u1JJjlQ8Yg52EBl26UBeSJbZIkU3p1dtStt0qQ3KEMJOHA==
X-Received: by 2002:a05:6512:13a1:b0:4b6:f0ea:4f49 with SMTP id p33-20020a05651213a100b004b6f0ea4f49mr11080983lfa.9.1672512980943;
        Sat, 31 Dec 2022 10:56:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512075300b004b53eb60e3csm3663570lfs.256.2022.12.31.10.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 10:56:20 -0800 (PST)
Message-ID: <55a1f2c5-8ef8-4291-8c95-49abe2637007@linaro.org>
Date:   Sat, 31 Dec 2022 19:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221231170532.77000-1-a39.skl@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/12/2022 18:05, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 

Commit msg is not entirely accurate - this compatible is already used in
the Linux DSI PHY driver.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

