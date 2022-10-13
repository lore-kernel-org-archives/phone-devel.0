Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E538AC4332F
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 13:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiJMNmj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJMNmd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 09:42:33 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DE8115419
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 06:42:30 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id z8so1059223qtv.5
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXjjiElFGFaUrCJj+dRuEG0KTD7h125bNssmscTrZRg=;
        b=xVKPQcWL8F/a6ARO8rNoXrl1cvunKwp4q/r04mHDbbnQtr9Soc4XX8jefFbzZURsSD
         IEGy7hL5u+kvhaEUR56cDLuvicOjhqDRSL1dhx5t0vlUSoNdri3Ftoo39kPVfyDsWXU3
         s8lsFMEapI2xNlFiuuxHq1d5WsfG+T56sz0St8kC/24Ejky+sgvVXLAVaesa6I/jzCR0
         P76ungnM4uVcXNQrO7bJhWHUVMiYtlNk7wpRSI3ScuNT7vw4ZVRRjPm7HhHJbuNbUp3i
         VfABNumm2STNSnY8DYjvlwxgQzFSegMisVuVBRLflJEZXCRM0N93NyM/JkI439CZjUwp
         iThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXjjiElFGFaUrCJj+dRuEG0KTD7h125bNssmscTrZRg=;
        b=h75QA4NDL12SGl9tCI3kgDrXmNnLaRkbMqkrhf/G/4lMPAVvLM0k9Z97Fn7NWKW++B
         jt1O18bVjrUA9JjhJwVSmF1dIBG5DoUQyM0sufIFAFZwRVIiK3ALOBbnx2gsvz6lv7H1
         CA0ukegdiwguE1CxcZD+XyB/9VzdHdDHl0EulJEAESrpj9wFAyQ5XlqSvFT/W6qPy4Lj
         hPLyiI0qFF6yFIHtXY79qZFJkONSFALVYZt063b+g5tBZQVaKyka8YcAz6DshViFBnpU
         W83q1fUuJIuPZ65bCTgd7iRFIOJ/Jx8BzqzyopgYPYlm8r7EmVfHBqvOZBuraiMsrVAA
         z7DQ==
X-Gm-Message-State: ACrzQf3Dcy6v+HkdQozVa9QLhCZm7EB+ULPPU1wqvnhtuWVYbdbHBbcb
        jz19NKp+RBDoKrOfvvrKqgZQuW20S7Byhg==
X-Google-Smtp-Source: AMsMyM4pCP7S/IglP64nQs1ADdFxdYjtGYD6+xf+acQmZNAVjgGjowN2s5+LpUGn6/KnpPpEQKD2bA==
X-Received: by 2002:ae9:e848:0:b0:6ee:92d5:94e4 with SMTP id a69-20020ae9e848000000b006ee92d594e4mr6659213qkg.404.1665668547297;
        Thu, 13 Oct 2022 06:42:27 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id do31-20020a05620a2b1f00b006ea5a9984d1sm16286383qkb.94.2022.10.13.06.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:42:26 -0700 (PDT)
Message-ID: <fc043110-8db5-ede3-3bdb-5e0c3d1d0e26@linaro.org>
Date:   Thu, 13 Oct 2022 09:40:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: remove bogus ufs_variant node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221012215613.32054-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012215613.32054-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/10/2022 17:56, Luca Weiss wrote:
> This ufs_variant node seems to be a remnant from downstream devicetree.
> 
> As it doesn't seem to be used by anything upstream, remove it from the
> dtsi.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

