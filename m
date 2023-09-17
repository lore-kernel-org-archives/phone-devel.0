Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECADC46CA1
	for <phone-devel@archiver.kernel.org>; Sun, 17 Sep 2023 00:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjIQAWl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Sep 2023 20:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjIQAWg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Sep 2023 20:22:36 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D58CD5
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 17:22:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401b5516104so36219265e9.2
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 17:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694910149; x=1695514949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/mSGd0lQiQIs0ky3gsayu99HBJSZ/MEeeFtzu3vHGM=;
        b=O08KXq1StnZ0mi6ZFrkdQPpCsqRzSl2k5pgdo6ZvS3klDp8F1pkNuthmNssgEyU7s+
         SLKfBuaYk3hZUJ2dKiptJdCOnifj80kFUbnYyePY/MQYtEdJI8w3qujfbfqFRFjQvP1T
         U6FaLkv6A3FwwwiijCpXbAg8u963z9uOEKnyGgJSNtwb44j4O4FdILCdv6HuOl4HyHkb
         uZnIWYyxUpMIJjMgJF3e4+jsL0JY0KVCl+ogEZXzwohWGSoEzDtOVT6n5W2rlnJ8gyqx
         zMibd2KhoTXL8l9uUIWVCNF6Vk+8WnKrwYAz4LswNHurfdnaaHnCUBRQhRV2Vz52jpjs
         62gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694910149; x=1695514949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/mSGd0lQiQIs0ky3gsayu99HBJSZ/MEeeFtzu3vHGM=;
        b=bewdHzgUjUzp2j81StOE/H4VwCqS9XWK4BvXbhFvcAiijTuaTIm/1J1Hw92JtaWMIq
         lzmcAW4HCILgt4REp0mlAlnLMLwKKZsg8+RSBHSze0Zb6bKjOievRXE5l1bIBOPoXeYO
         3tfJindE50BBAyYzhFUmntWW7DYrWaOEFCxX1Xrd0YftLX5kG6sqwnjJsUipnn+ropqb
         lWveFKYgP9Uf9hJVg/mu9jZxAFHyi2Dsmb7qOxV9Ga8me+rNpssOFHE/2iBDu15lPAaY
         cqLoar0wZcektyXCuHJnxW4ghANF4cg20vMjMEnfkfvQ6o5XUBd+QkLlKc8T+L9Jozl2
         ttdw==
X-Gm-Message-State: AOJu0YyJGFrL/xSeIRXj4xuypqy/4Dg7Tz0srAUNLLcUgLOuV/6ldciv
        fQjq4TSF1QqcQYyz7XKY0oZf5g==
X-Google-Smtp-Source: AGHT+IF0WUtsBTjNiyn9tDsi9lSymZ3pEuoj5cUAFdJtxACwTRWECoejR/S3RU8WWwYVNbkSljXqEg==
X-Received: by 2002:adf:e78d:0:b0:314:17cc:31d0 with SMTP id n13-20020adfe78d000000b0031417cc31d0mr4482762wrm.34.1694910148573;
        Sat, 16 Sep 2023 17:22:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b0031c5dda3aedsm8412372wrs.95.2023.09.16.17.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 17:22:28 -0700 (PDT)
Message-ID: <3a66a198-5817-4c74-9047-c49e5bcc84c2@linaro.org>
Date:   Sun, 17 Sep 2023 01:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230916134147.163764-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/09/2023 14:41, Lukas Walter wrote:
> + +&wcnss_iris { + compatible = "qcom,wcn3620"; +}; +

Are you sure this is 3620, have you tried wcn3660 and/or wcn3680 ?

---
bod
