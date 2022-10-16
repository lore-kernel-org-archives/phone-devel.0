Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7EDC433FE
	for <phone-devel@archiver.kernel.org>; Sun, 16 Oct 2022 15:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJPPBp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 16 Oct 2022 11:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiJPPBm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 16 Oct 2022 11:01:42 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C9034735
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 08:01:40 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z18so6147560qvn.6
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Wm7NvqH1ePopXAneqvcSoIIU4C1K/1oJP6GjX0gQlU=;
        b=LJmf2E6dF8jcDbNwqXdPwRL3yPNVesLg6HeAX9cvOk8YIMAvTQTwBTPvu/o2M/yyHJ
         Cj1r5w0ha605YxEmDjThwmdspqYZ+9AvH8MyJJ02DFhWzuz/jk9hL7XsiKeXfkeoRKTR
         lsPX72YQmTBicaXl8j4wmwpE2rPHV1YRo7RwSwuc8BSSj/8LmWWjUPZLdPJFA+K6Hi+U
         ejp+2aL3aEXS0+CGVnqOXOrtw4u3m2a8I2UMGDU6QU6zNny0l8gqilsXmt2zHpVWgYm5
         B5tozI+hjGoTqbCkulMeH2KtRWBGyNtnc5DJGGKOcHiUCaoXgm0YDUC3+4qlOCR481eG
         ub2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wm7NvqH1ePopXAneqvcSoIIU4C1K/1oJP6GjX0gQlU=;
        b=UbfN6sP5XSOW0DgDZ0e2iN5W9SJG+0I+t+5O+2sfDvloPCwGxegojQSqK+sWKS1rwO
         eEJTvqkYCkh6gNpHS2fw9EtAMZUdUER3ePXd3CIscfKQ6j7gi/EwnIY1BYugB2eKVjfr
         /I5wuzLfJ7rhMwUIl/yCa+Aa7z7QFMGClFwIgsI9tyFIstPgP0+jl7darQE/lErN67Ms
         UvCp1a5u9RimrG4D8pt2KHXdq3FkI57VdLcf3D+Yp4vjAj7nnWce5klkLoMR1ABDDVUg
         iplLacblqqvrJ7pEOFvMkR/7lw5WoZG88yqdN15mqUuvcjt5srX2l3UOugOfsSgV9Vze
         +oVg==
X-Gm-Message-State: ACrzQf3YpGVh/f5CtF3pmsb0ieIM6jFJTFhnxtFPbMybu6K1ryF29Cnz
        wjIzDaOFhTuqmtUPVjt1AHdnnyXYKt3vRg==
X-Google-Smtp-Source: AMsMyM4CN1gZt1ekjWKIkjRalQnK+kooXMchoouMVBXeZJ7PEf5KQYbsy21qnjEFPRsLixOF3sfWFQ==
X-Received: by 2002:a0c:9122:0:b0:4b1:80fc:c405 with SMTP id q31-20020a0c9122000000b004b180fcc405mr5381324qvq.120.1665932499824;
        Sun, 16 Oct 2022 08:01:39 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a2a1000b006e6a7c2a269sm7486671qkp.22.2022.10.16.08.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:01:38 -0700 (PDT)
Message-ID: <883386a7-49b7-3465-3d62-76547f10d423@linaro.org>
Date:   Sun, 16 Oct 2022 11:01:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc7280: Fix cpufreq-epss compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <20221016090035.565350-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016090035.565350-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/10/2022 05:00, Luca Weiss wrote:
> The bindings require a SoC-specific compatible to be used next to
> qcom,cpufreq-epss. Add it to make dtbs_check happy.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

