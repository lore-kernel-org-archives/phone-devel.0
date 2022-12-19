Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3106C4332F
	for <phone-devel@archiver.kernel.org>; Mon, 19 Dec 2022 09:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiLSJKj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Dec 2022 04:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbiLSJKD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Dec 2022 04:10:03 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73555DF08
        for <phone-devel@vger.kernel.org>; Mon, 19 Dec 2022 01:09:59 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f16so8368720ljc.8
        for <phone-devel@vger.kernel.org>; Mon, 19 Dec 2022 01:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RQVjAZpZEDfwrYD/tTcNOhnjobio08prwVai5/P43Q=;
        b=XMfMbUzc79O4B0RFzinDgiHm1AWfTPbT1Rhto7td/0djjFOt/lAJ8CiPyhiZefSjZU
         +WMKJb40ReNclaeb43gzWdWWCV12cMHy6GoXNfVP0Sdr4aEpSQoJo4B4GbU0vmGNy7z9
         /gmcZjIXFaAQVhD2T2MCwDUPDk1HLAu5SWwp3uK+MIsL+IQPW0DSn66FfiSfFwl99ULA
         aj9kVaBhs1uIdrPHEOJOV+uidx2HNQjoUETAluE7kJbMujxdgoprJb2vEEgQjfN+zIGB
         f1/ya6cCosOukeVSzxPhwwdLKWj4/M9UgU+5lenbqL6PSvGHO8xm5UsjTzZhM8NqnfGl
         g6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RQVjAZpZEDfwrYD/tTcNOhnjobio08prwVai5/P43Q=;
        b=SERFSWcWoNXcZ3F+8I4GL7UzGsB/bwhl+XvYrMV28OHMUP6IP5mdKLrtR82yGAw66w
         U1wW4vj30kCZdU2o38JZf05n0+3BtWcVNDYI60+Dzz/rIBvx5sloCqXY2YSEFAsvI1y/
         1Tu7OZ3Xo5CNSYXjFjKeGVu/hj0Sc6Obov1p9gwsgyBAooXqpiMGcJWARtUhZRVkiMMI
         kYY7ZsaBifXpcnKAzc16xecOPEi7T50ATj3e0wyqAQQTernP3X0kS2nHzB1p1+7L9UQh
         s3OgjkRd61vrNHBEpJMftPNyoWXcXYCmiUPJj1QFB5YwpOBzpHHNb5lIVd2r+RlQZGm2
         Q7+g==
X-Gm-Message-State: ANoB5pkc+3p7UTEgTI0zOHjGFzF6C6Qeh0us03pMczf/cC2mbTGWhx9b
        v5QTHmFSXs5yKZWSyT6UMR3sMg==
X-Google-Smtp-Source: AA0mqf5EfXZCBaoylRSUyW/qa+q3eZHaBg8V/AaT00MAiNx7UkipD11GvL22iOVI8CSwoieS4Uy00A==
X-Received: by 2002:a2e:9209:0:b0:279:d624:7fba with SMTP id k9-20020a2e9209000000b00279d6247fbamr10227858ljg.23.1671440997860;
        Mon, 19 Dec 2022 01:09:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eb7c8000000b0027997d00fc2sm700409ljo.21.2022.12.19.01.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:09:57 -0800 (PST)
Message-ID: <aab465d2-3305-c51f-2c00-08d5df1a333e@linaro.org>
Date:   Mon, 19 Dec 2022 10:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: gpi: Document SM6125 compatible
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221216231528.1268447-1-marijn.suijten@somainline.org>
 <20221216231528.1268447-2-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216231528.1268447-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/12/2022 00:15, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Document compatibility for this GPI DMA controller on SM6125.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

