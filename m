Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79C0C32771
	for <phone-devel@archiver.kernel.org>; Wed, 28 Sep 2022 07:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbiI1Hg6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 28 Sep 2022 03:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiI1HgV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 28 Sep 2022 03:36:21 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FC2101942
        for <phone-devel@vger.kernel.org>; Wed, 28 Sep 2022 00:35:50 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q17so13367720lji.11
        for <phone-devel@vger.kernel.org>; Wed, 28 Sep 2022 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=60HbfXGFJSq6MviideHNDByyawzs0Eu0qQcu3vNmPOM=;
        b=sQYW7f7s0Nt6yzJNxqkaTDr0cUlTAFn64ggsUvHstWE5DXsu7xjYzZCK9lWGZ3FclG
         MEn6+cP1n2bRnBmVJLzeFikRQ7Uv2X25Ou/iK9i7AVjQS7Hqsf6B3O87ZLPz+TGT28Kp
         KZ5C3zSlIRDEK45POewaLTHSthvIkfwq5rZGvz4BHz5HFFOgYzWiXHHmSg6qisYBRcYY
         ijJqQd+eEAJuClnBm5Of2sWyDe86/ZUogQssXoiorPVLuQksLqCMmLBNm+0qypzw5hp3
         nYZUSrTaZ2aNYaI/w8iYQOYD998gVSdCHtDoslWhYzJqP5Dg46ssCRLIGU1Gf1UT+FK0
         gr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=60HbfXGFJSq6MviideHNDByyawzs0Eu0qQcu3vNmPOM=;
        b=RrGOO2GezWTt249jIJco9gVUhVB+KUW99jW5OkhZYJ9CAOi48B5hsV/cXhfOKA4hCg
         pWfI9A3e4338aiJPfu/aM8bn7w9nLkMP9yCMNN7kfYTQjxEfEm2u/ecwGejIqj1u/FpG
         Xy7fPWJW8+mMERr28Qh8KxSHFOs9tRCJdkgMPD1sIBaxBkmsl83j7AtSnN33/gRwy1px
         7/eUpCvY0ImlbUnGNEwGuUwlaR5q+zIDVTWfol749EKdSkKjlQGraIj4M1ied1z3MOxK
         SqyovvRLQ61avsWo0v8N7d2OEp6pWtIYpBSpQnWI8tgoKuWucnEwKIkq1AnNG5Hq5X/v
         PGiA==
X-Gm-Message-State: ACrzQf0E8CJTkcLpg9lMrPZ+j4DHPQbBckNmrD1p6xLfGkpS0P3Ifjqh
        Uem9X4dhFkA0WhmxdQ/8qFJ3xw==
X-Google-Smtp-Source: AMsMyM5FluMwKmSZsWwo+tEo05mSpr25PpnsouB4+c7Q6Ei197zM0GxTLRB+vlQT+ny70yPRvle/WQ==
X-Received: by 2002:a2e:9b8a:0:b0:26c:3dde:6b2d with SMTP id z10-20020a2e9b8a000000b0026c3dde6b2dmr11410073lji.243.1664350547270;
        Wed, 28 Sep 2022 00:35:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bf34-20020a2eaa22000000b00261eb75fa5dsm370239ljb.41.2022.09.28.00.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:35:46 -0700 (PDT)
Message-ID: <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
Date:   Wed, 28 Sep 2022 09:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: qcom-spmi-pmic: Add pm6125
 compatible
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926190148.283805-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/09/2022 21:01, Marijn Suijten wrote:
> Document support for the pm6125, typically paired with the sm6125 SoC.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

