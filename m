Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68BC83F20
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243367AbjH3SsE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243042AbjH3KJK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 06:09:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82DA1BB
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 03:09:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5007f3d3235so8559658e87.2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693390145; x=1693994945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbGayIc8QmH3229W77BP5+D0jARgdrG8RYkDkQrYe5Y=;
        b=l/pXmj5Y4iiA15CpbhMZhRCda9HOjjRczLqsESFBAYXnFxBHo3fElpG3N0WqTCCI3A
         BExzz+AWFds44G6hOlZxX6e37OSY8ZRfossgTtmRuYUXgeaN7UIoKIRWw5QKcmTxgrau
         UbSW4CEZ3aj17j9KY6sJJf8/GDbAQsGjaC8hMr1v/gijT6jPaC5X6AOlsAR7CSWrTDO7
         t0QuUNCTAnJGQzEcWF3wdYJqXOK6VPBGDou1Iv4I/LFVm/EvTdAMP+IxnHAw0DgZjZ8M
         vmSA2W7XIjTm+V8mP9ZaFXt+IAy5AFmk9emWvJ5DHuc5aPSMZ3yW0qcg4VxcilmPBm34
         JQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693390145; x=1693994945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbGayIc8QmH3229W77BP5+D0jARgdrG8RYkDkQrYe5Y=;
        b=CKmRygytt9vECINYvoQLNCBz2dRaKEl0e1RMqDaN1OSqGWgMAiJHBM4C4cYEX4uCIK
         AGhZMiSsvWm+jBlAXq95Sgk2HY8Jt3uL652m7nD3I08K9wgrWEc7Xl/sk+h0AchAVT3l
         HJlis2Vr+Ga/p/8p4LWfU7rftC3AEoNPJq3czATaADPdaW8JbJ/vXdOJFLNKvqV6GJsD
         K+8TmQQAwB4btnLIYx46mWsEkOHgN8JgSEM8+G9eF6cf2pwp8L5pItI7HACjLCeZygc7
         wcJC2FbKXSsv0KThIZGf87Ct+k7L9Ah8NNAVyteJSPey4sRmxFD1kybuFYikYbm1gGQw
         3Wbw==
X-Gm-Message-State: AOJu0YyPPpkL/Fx+P8Z8YOlj2bM4khhJCsjbv/m4d0i8yg4b26ayPbe+
        NOIACFkKNG/kJZb1NnrdntZCQQ==
X-Google-Smtp-Source: AGHT+IHy9a+HPDPy7Kt18kV1w/1InlaMSmy6OG+3OrqLDuwTDJYIvmuHAlIjm6BwngBARxzJqrSQeA==
X-Received: by 2002:a19:8c05:0:b0:4fb:821e:2241 with SMTP id o5-20020a198c05000000b004fb821e2241mr1330070lfd.23.1693390144960;
        Wed, 30 Aug 2023 03:09:04 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id z8-20020aa7c648000000b0052a3ad836basm6550370edr.41.2023.08.30.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 03:09:04 -0700 (PDT)
Message-ID: <2704de3f-abf0-0c32-379d-ac83c9e84d9d@linaro.org>
Date:   Wed, 30 Aug 2023 12:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 08/11] soc: qcom: socinfo: Add SoC ID for QCM6490
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-8-5a954519bbad@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830-fp5-initial-v1-8-5a954519bbad@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/08/2023 11:58, Luca Weiss wrote:
> Add SoC ID table entries for Qualcomm QCM6490.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

