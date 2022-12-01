Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C49C4321E
	for <phone-devel@archiver.kernel.org>; Thu,  1 Dec 2022 16:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbiLAQZA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Dec 2022 11:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbiLAQY7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Dec 2022 11:24:59 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AD49C62E
        for <phone-devel@vger.kernel.org>; Thu,  1 Dec 2022 08:24:58 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id h10so2437404ljk.11
        for <phone-devel@vger.kernel.org>; Thu, 01 Dec 2022 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUJLWqnpX5EtxylfXtIvJ2JoGjMsp0Ewf03O7h3Mw7E=;
        b=q1qBdEOuifgwoTQwC8ra/XUSA+Os11hjcC7zh5RcmeCU87uBp15cnXJSgcnzGtC7Gp
         Aiome8QI1D8AO1EeAnHllmcOaUp0vFS16aXntv55q+um1wOuOTIxfGPwrZR7gIlvvNzU
         ejeb7aBaiHU/DTr0jFaYrVKVy3Vf4XLShUn1k+79U0PnoCeUp7KQFyLcauO2WJTarK22
         p1Z5VL/BEF0QJP1h7D7JoM0gpdZWc16IgaduTOETQFE4X7+mEvoVfCnkUNZwbOlBKe+r
         MwLYXk2FTYQf8eERgyCX6ZUJpPHlvrgAwwUJQn/I4vYEvBLeLKXmTRx1wVzoYde4NzSZ
         78ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUJLWqnpX5EtxylfXtIvJ2JoGjMsp0Ewf03O7h3Mw7E=;
        b=tJXFGYXid/vD0m7rYaCuWa1G9xs78wdSdtnudwXJVrY8JxeljmXWJFl/3m3MkhF1IC
         sor+uhhL2Dd739efD0ZrEeCGeeSGhwaxq9AJ0X4kQA7808ggDZ5OfqV5zifPFX9CdRmi
         8h7EwiQSox9tAzN9N3a4tyTqVlY/iXAoiPH/z7YucjNqGwmCwg4/DrFyBUMlV5DJmioP
         pcJxMgpO/rojxKPRr0atRrxI2qVUY0j9JDn5RUbkQW7OVmLGiURKEWKBDxqgQTRO1o81
         5x/hB+Ozjwc2BzBlFLpn80I6UKgDDSLE0+1QbOxJWhIzgkLu/1St9I7P/JxYXwGYW8p8
         b56g==
X-Gm-Message-State: ANoB5pkipXHUHicTzoAva2vTuGbzXJ8/pGiOBModtujEHY/SQ6KB2har
        xWIL7d9w38gn6qc6CLrFcduIXA==
X-Google-Smtp-Source: AA0mqf4DGRDZAfrMMHGpQ3FJcfjPi3EPx1RMiQffi9kh34tPix+0BHzPIAMqgx6fA6EDHaIDChzLTg==
X-Received: by 2002:a2e:2ac4:0:b0:279:9a7b:c8fc with SMTP id q187-20020a2e2ac4000000b002799a7bc8fcmr7816166ljq.169.1669911896414;
        Thu, 01 Dec 2022 08:24:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p1-20020ac24ec1000000b004991437990esm704929lfr.11.2022.12.01.08.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:24:55 -0800 (PST)
Message-ID: <7d6625c5-6e91-94de-0785-fea82c26e157@linaro.org>
Date:   Thu, 1 Dec 2022 17:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/9] dt-bindings: remoteproc: qcom: wcnss: Convert to YAML
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220511161602.117772-1-sireeshkodali1@gmail.com>
 <20220511161602.117772-5-sireeshkodali1@gmail.com>
 <e8a86b3e-7a2f-3434-52d8-6a827b720f92@linaro.org>
 <COQM7MGKFRUI.25DOQ1AAQLLY7@skynet-linux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <COQM7MGKFRUI.25DOQ1AAQLLY7@skynet-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/12/2022 17:17, Sireesh Kodali wrote:
> On Thu Dec 1, 2022 at 6:52 PM IST, Krzysztof Kozlowski wrote:
>> On 11/05/2022 18:15, Sireesh Kodali wrote:
>>> Convert the dt-bindings from txt to YAML. This is in preparation for
>>> including the relevant bindings for the MSM8953 platform's wcnss pil.
>>>
>>> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
>>> ---
>>>  .../bindings/remoteproc/qcom,wcnss-pil.txt    | 177 --------------
>>>  .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 228 ++++++++++++++++++
>>>  2 files changed, 228 insertions(+), 177 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
>>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
>>>
>>
>> Half year passed, so I wonder if these series are abandoned or shall we
>> expect v2?
>>
> 
> This series was split into sub-series to make upstreaming easier. Links
> to the sub-series:
> WCNSS: https://lkml.org/lkml/2022/9/30/1502
> ADSP: https://lkml.org/lkml/2022/10/13/5


I see, thanks. I wonder why they were not picked up... The ADSP was sent
more than a month ago.

Best regards,
Krzysztof

