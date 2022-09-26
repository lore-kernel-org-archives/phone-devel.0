Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49097C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbiIZIpA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbiIZIo5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:44:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5562364F2
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:44:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 10so9725101lfy.5
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AjNBpQiXKyCIczkdcFeT8Sqv3YnomJydcomPufWvUsM=;
        b=FW+lutjF1v1p2CfZpdzEe2gUivlAVRcG9V+bDcNXM6wregXlfJ0uunhsiCMhWEymq3
         XaUFJZ2KvZEPpb/1gFFrDapqGRyqKDoDH1hYU4Rc5oLfIHGYVDnroTUUxZ8wjgFw7WZ0
         9ofT4TvGzVgzXxwXnYpUWLPjvbPiF+udFj9QaQVPnn6PKVI9buT/czh0JmLRS5bgGjL5
         wPmSls5HSMvt6S48zkbrW8Lkc1jGkkt6wyBlczICxBbewhvAuu3VkHysY7DhsZ/pHekx
         WS9ErSZWKld1JhnSU4AMrNb12DCfFfd4s1ActmDEykEL4T+51RTZQ/aNTmO5GgKfWpnN
         15zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AjNBpQiXKyCIczkdcFeT8Sqv3YnomJydcomPufWvUsM=;
        b=KLB9qaiNOrJQ6PuFjmj+u0FD7xtkep/XRoohMGz4tH1Rz22vjwvDG8S0p/6fMRCqK0
         IGTobSdCqjN17HP5a1nKHfAzfFUhGD4lLly7HQwQBiVSS192/VzvKwKPqr4jsujVtHc2
         Qa1X/9S2GE91nVUrCWRbMg01DancRZUO/zlrBPehCDS6L6QrZCwliZEGQftfmGsgbFlG
         Wbvbz249C8ZPqMJqGoDnSNGFKEoeQeplEh7lFb6COGBAIpqPXIaYtxiPXaODwrpNmTbX
         4N5CVKvBuv/7mY5aKtfOeajlcah2HVKlVLmIWSn684JuksRyXPPewkm5rfZz3kKllOrV
         VK+Q==
X-Gm-Message-State: ACrzQf27zugvbAoZkM4YfiCEmbqEpfPZ+mOx+JwpYzC8gZYkomrwEKXc
        zxkkj5KyShoHaOSVjIAvECZoVA==
X-Google-Smtp-Source: AMsMyM7vnFmTj1/BWZJHATJUtK7+0ejBaLnVdRCjRJXJnfy8aE4xn8hlK4C30pX7XiAo9yADNmzWmQ==
X-Received: by 2002:a05:6512:3f90:b0:497:ab3d:5f12 with SMTP id x16-20020a0565123f9000b00497ab3d5f12mr7944923lfa.421.1664181892742;
        Mon, 26 Sep 2022 01:44:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651205c900b004979ec19387sm2457048lfo.305.2022.09.26.01.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:44:18 -0700 (PDT)
Message-ID: <f9caffad-b1b4-539e-9ccf-6b827f34be32@linaro.org>
Date:   Mon, 26 Sep 2022 10:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] ARM: dts: qcom: pmx65: use node name "gpio" for spmi-gpio
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925190622.111505-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925190622.111505-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 21:06, Luca Weiss wrote:
> All other usages of qcom,spmi-gpio use the gpio@ node name, and this is
> also validated by the dt binding check. Fix it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

