Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A268ECAAD3
	for <phone-devel@archiver.kernel.org>; Sun,  4 Sep 2022 19:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbiIDTPr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 4 Sep 2022 15:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiIDTPq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 4 Sep 2022 15:15:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0CB2AC46
        for <phone-devel@vger.kernel.org>; Sun,  4 Sep 2022 12:15:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g7so10358519lfe.11
        for <phone-devel@vger.kernel.org>; Sun, 04 Sep 2022 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yxLVewTHSv4Xq6/5Z/Fr5zJXfSu3q0A9v6Ujj4sysNo=;
        b=gY7oQffKOe8RLllBIFsceNq0mOknLJBf/z9s8U52PVRc5LJse3DXKRBtSfkYwEEM6A
         mEzXk63I3xm0C8ZZcbbqdwrlhFY4DcmejpdHugVGE4n8DETSxa56NC8xN0rhKknCZ6Cz
         Hh6ucgNB5VnEAJjLLLlCvWPFYRT9X0gHd/TnYsAx1L7mEPnpUDJHvEy58coAla2yGZsO
         c2mAkNQywRzRx0WMBX7xNWE+kdU9j9kk1vl6j3+Rs/qNLb1EuLfjMv0ZQPWfpCm743RZ
         jj0rFNSHMCSWeljZbTxf4qGS9cf9xMWIeFkVmGTlr6nlB6hstfFtcO6Ja2XbPe3Ijy2D
         gLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yxLVewTHSv4Xq6/5Z/Fr5zJXfSu3q0A9v6Ujj4sysNo=;
        b=60msNsyZxD5hePaXIQJO9pdqIvzRGA4+W4oUtyJ15Ge10foy/Fn7vJDYqnTYLQErhw
         tfi4RB8d+t/KhPlasYAISjD0RfVOEJwt1EqWvHlcV9qD667pNrhZSJdvOnYqryRAw7CT
         eLqw4vl1UmT0wLuKjMxecGpyJ06OK20N006KU3KnuzoIEpErUeG4UrASJ/mmCc3AGV7b
         gF0vlVGrdOSWdEqzC231DroGlQCCtSw2Nkac3VsyjgF6jNBIWwnjzx4ZVtcBrQqCCZII
         nNK8OoAbC7jTF5kNuiwN7SeWbHoGxyW9USwTyKbN7mJ7uTcD5c3pSbwOW9GG9InjnFDG
         iBvQ==
X-Gm-Message-State: ACgBeo1Y0D24ZT2ec9ITDOZOGQKEZBi+5ujQMJZGKAjmo1ZSdgFG2gX0
        OF4BlSIzyilbnUkk0FBxG8uzJw==
X-Google-Smtp-Source: AA6agR76U4ZjwwGZKGOS/A6eRNqmnQgw14s80bPnLr3eF672TCAKb8bB7e9alAhcpm059HJ4F7/IIQ==
X-Received: by 2002:a05:6512:1315:b0:492:cbc8:e10d with SMTP id x21-20020a056512131500b00492cbc8e10dmr14598407lfu.41.1662318943152;
        Sun, 04 Sep 2022 12:15:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a27-20020a05651c031b00b00263630ab29dsm1093876ljp.118.2022.09.04.12.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 12:15:42 -0700 (PDT)
Message-ID: <8c845d02-c63f-9b1c-25af-10fe705717a2@linaro.org>
Date:   Sun, 4 Sep 2022 22:15:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/9] dt-bindings: nvmem: Add SoC compatible for sm6115
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-4-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220903174150.3566935-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/09/2022 20:41, Iskren Chernev wrote:
> Document SoC compatible for sm6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
