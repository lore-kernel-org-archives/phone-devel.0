Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63C2ECAAD3
	for <phone-devel@archiver.kernel.org>; Sun, 11 Sep 2022 13:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiIKNaT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 11 Sep 2022 09:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiIKNaS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 11 Sep 2022 09:30:18 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C247F1F625
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 06:30:17 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y29so7610721ljq.7
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hOMzevlGA+ySRg6MqAShDhYxwamFeVoNTxUO70sGCYA=;
        b=MVI1ZwKPIObsIUnUw7rek7ZGDx3WEmnhA97K2A/j76YQKc8pvFV/y5wERHTSvXM7zT
         MK0q2DM/kHevSZ0/dXBbV6J2W3AtG3jRylKnAA2cWqjajuE6oZuQQ9w5TGJ/xOEb0M2Q
         ni5FaoVW2gg/4+rkySSXQvDCXHl9h3J6MBd49SFTduICgPEQy5aWLoA8ItGF1IM+p6s9
         qfwWi8F8kNVkCUrQBcA3KleNegp5DqMkUL8EAUISSf6AtbLIabHS1HFUsftNxEovtb1a
         x+sk77LIPZbbluYIjD9q5WuvMgJB7ooyaQy6SVqECJbLdsF0D0rZHF6qzOwONjMKSSR1
         indg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hOMzevlGA+ySRg6MqAShDhYxwamFeVoNTxUO70sGCYA=;
        b=pxAPV520XHHhPyRhEBzzvYA2n2EEAI1Ge45e/rLIHO5dQjTVFtvFsQ3szXkibXCZ7z
         Ql7QZzFI84tVQOsv4Vp5ZDMZPA04mzsM2cEdAZ4F+N29efm56fwrngpj9fCIKj+khP06
         PrAOv6bdH3/gxoaGkXxG8q3OwZXIo6gG7rgz7d8/4ndWONSfCjymwReDLhNTG0gL+1BD
         U7UsqE4Zz5ygWEdEow00+Y3swJ4qeQACHAf2tGv3isYT3r5N/7iYZ7B5yJOXHvPSSkpk
         5QdEqtd7wOxxqkGxOcW8QG1YPnFqJej8bH0sJApX62JGSqD3Uw435SWFNnaiB60Kh6Lq
         uq5w==
X-Gm-Message-State: ACgBeo24kDMcYT5ArF4v+4T8rAGwcFd+4Kpi60DhQVkiMvNeA//IbGaX
        ycNXUvPipUII6TyTuyysRs00yg==
X-Google-Smtp-Source: AA6agR6OkDk8P2m/lHizzpthR0Wc5lx+UqfLfVLVzJTg/RaBgrb4y1LuFACP4d2sTy7nfTxUQo3wVw==
X-Received: by 2002:a2e:be05:0:b0:25f:d8fb:afbc with SMTP id z5-20020a2ebe05000000b0025fd8fbafbcmr6964092ljq.369.1662903016185;
        Sun, 11 Sep 2022 06:30:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y26-20020a05651c221a00b0026ad1da0dc3sm649853ljq.122.2022.09.11.06.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:30:15 -0700 (PDT)
Message-ID: <a2a15c79-64e3-ac03-9ee6-19dc16475cb8@linaro.org>
Date:   Sun, 11 Sep 2022 15:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 5/9] dt-bindings: mmc: sdhci-msm: Add pinctrl-1
 property
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-6-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-6-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> Most mmc blocks contain two pinctrls, default and sleep. But then
> dt-schema complains about pinctrl-1 not being defined.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
