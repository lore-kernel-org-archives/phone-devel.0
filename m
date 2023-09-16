Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D419C2BA1B
	for <phone-devel@archiver.kernel.org>; Sat, 16 Sep 2023 20:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjIPUkI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Sep 2023 16:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239521AbjIPUkE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Sep 2023 16:40:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1EFCF0
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 13:39:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ad8a822508so396476366b.0
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694896796; x=1695501596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lR5T6ibwSrvheSebyD3OBI+eNynqOjBxcgSy01mbWmU=;
        b=RANesbT4XnnLodCcUhyl9ouw15NrfbkPBrqtdTe0bBXcYXGlN4SdWvuxDmYb/2ac6p
         s+hxa2G/IXyCzsrGnfnIMFvsl9aslJQi5nDyAGODhSi+25BZHmZ3v3uqnyOFgE+Je+PY
         sU1Yv5W9zoIC1zoqd4JTC0DiWt8U7odsjwDHzrK4AT6OAc6CfEdBZrcPT5K/vQfk1Qq0
         0nw7bxq/Yy+ffIKu5BBVXNJM+wSOClPzmvL2uVGlKawzwM+BjpH9ZFzmbtavA1qivjoy
         Kl/3AP3uKk3nQti0ICAmuUjscz4Sws7ILQEX6le9Km4Yk++mV1jWGdWNzYVUWa0JjNHv
         CsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694896796; x=1695501596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lR5T6ibwSrvheSebyD3OBI+eNynqOjBxcgSy01mbWmU=;
        b=hoKuJ8GTqxQ0E4EIVdXZtrbjPtFHgTQVY2vrOa2EZgLH8gFrRLb9nkyCGlvAy2R3ja
         vo0Bt9pNqhaDusJyWmaDnFRSjQ7D9Fy/JWGsSrVB+0SjEtmIEGGrcHaw2qujftmCj3AI
         Cm62aDCDoJnkMZqPNzGgShnfuo8HoYGtDVruVIhVzgpem3FM+VJ4DH03s2m4AVnHpBdl
         xIutdFdGmMJlCUk3vdIifDtY0aWR9bGz+7t2q2z5xiKhx8mNtUBOsPD1xIu39a6/piNe
         1aS2wGmGhBC8fPBFVzQHbOvsfXguD57e+L1COOnoOMJ47LjVgZG1VYWG1Fe4Qs4eLk92
         aFTg==
X-Gm-Message-State: AOJu0YykkXOE8HnlD586JxzrRuUGSe4x8+xlwKTFpLYwOoeb0rmewOb/
        w8w4nwLqgpFMhlGxkcczMDEp6g==
X-Google-Smtp-Source: AGHT+IG0agA43aj2FABBUW8LcSlXyrYgJOmlotEOtAspWlPfaHsL2EVQAPzuRlrdQpY6P2iyOjGKUQ==
X-Received: by 2002:a17:906:73cb:b0:9a9:f3df:80cd with SMTP id n11-20020a17090673cb00b009a9f3df80cdmr4420148ejl.72.1694896795733;
        Sat, 16 Sep 2023 13:39:55 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id bj26-20020a170906b05a00b00997e99a662bsm4058272ejb.20.2023.09.16.13.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 13:39:55 -0700 (PDT)
Message-ID: <bd833cee-2349-368d-93a4-9465ebc8a0e9@linaro.org>
Date:   Sat, 16 Sep 2023 22:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20230916134147.163764-1-lukas.walter@aceart.de>
 <20230916134147.163764-2-lukas.walter@aceart.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230916134147.163764-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/09/2023 15:41, Lukas Walter wrote:
> This dts adds support for Huawei Honor 5X / GR5 (2016) smartphone
> released in 2015.
> 
> Add device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI (internal and external storage)
> - WCNSS (BT/WIFI)
> - Sensors (accelerometer, proximity and gyroscope)
> - Vibrator
> - Touchscreen
> 
> Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>

Order of SoB is unusual. Who did what here?

Best regards,
Krzysztof

