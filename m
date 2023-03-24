Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E6CC76195
	for <phone-devel@archiver.kernel.org>; Fri, 24 Mar 2023 08:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjCXIuC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 24 Mar 2023 04:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjCXIuB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 24 Mar 2023 04:50:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D1F18AB1
        for <phone-devel@vger.kernel.org>; Fri, 24 Mar 2023 01:49:58 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w9so5004421edc.3
        for <phone-devel@vger.kernel.org>; Fri, 24 Mar 2023 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679647797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjhqcYRQohKWjL8txB/9vIdc1uHfeuQUOI0lOTwNUNg=;
        b=J2SXK8WAFr9syAWNxzP9UEGgumD280cRNlVZyCO+9N7iFHr1B73zA9cUvLewnou//P
         gFsyTvm6qUhFJTtw+qbOB1cHscEMO1v9t4G0+yKeeDToJgYJ4fh49v39Jk9xnLZpqT9p
         vf9EqCHsSIkqeDAf57+YAE+LLg0Cmdb20JvAyFGj/nalNvz5L9C+sWaMfsi2s8FKC6Kt
         nxJhLSPdvHUoftvneqrjoaXmwpx5heHOu3xIwGQU64r4iLVlpv7DIPZnVk7tiUX1Ht41
         QCygOrlMj4BlB4Fo5/vsr95M8ICYt+t8SaBkjR9Hvu7tXUPoFWXW8uv41rxN8Ew1k1Uy
         /N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjhqcYRQohKWjL8txB/9vIdc1uHfeuQUOI0lOTwNUNg=;
        b=YRp7ucqrcvCtOamoxg0nLS2WkgahTB8Bkm4978PZMX70iDc95extEWhVxqvKGz81pD
         Xth99xYEOADvrrNxBUBcCHKw6BYaqgGcQ3JT1WHDFfCdGgl5sRalRKN+1gEpPzYucqEf
         zWVW3K3VmXaMi9PqbEXOH5xYtQPcjE/wqRwNQZ7bCkB5bmKVdDQt6DWYLSmSGFmAyBcD
         4KNypAoO3d/U52Yx5Te66rolQDYv3efE2savhyGhz1xeCLjlRpNZOszyH6hhZlnluVik
         hYkJ4+vHQV9a3s21/shNPGaJrhcwXMxlabSm9VD1giN74igWTx+TBSd455wCTLNjOfff
         V/vA==
X-Gm-Message-State: AAQBX9eYPU8ih7yG+dQQ5aTnbozD2LQT4E9g+g+Gs/u9tK6/vZnuPepR
        MjZ5TLeIDIEb2hgTTFqPjsVhWQ==
X-Google-Smtp-Source: AKy350Y+LY978FHmR3PiWftX2mZjZLU8WMQ1HS43y2EM2peLkGLhVhwK0ndpXL1vW0ugIcOfXsNRJw==
X-Received: by 2002:a05:6402:10d8:b0:4fb:2296:30b3 with SMTP id p24-20020a05640210d800b004fb229630b3mr2327474edu.15.1679647797427;
        Fri, 24 Mar 2023 01:49:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373? ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id x2-20020a50ba82000000b004fb30fc1dabsm10186429ede.96.2023.03.24.01.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:49:57 -0700 (PDT)
Message-ID: <cc26c4a6-a498-ebb8-1fe2-548b6a9ca58e@linaro.org>
Date:   Fri, 24 Mar 2023 09:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/6] dt-bindings: ufs: qcom: Add SM6125 compatible
 string
Content-Language: en-US
To:     Lux Aliaga <they@mint.lgbt>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
References: <20230306170817.3806-1-they@mint.lgbt>
 <20230306170817.3806-2-they@mint.lgbt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306170817.3806-2-they@mint.lgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 06/03/2023 18:08, Lux Aliaga wrote:
> Document the compatible for UFS found on the SM6125.
> 
> Signed-off-by: Lux Aliaga <they@mint.lgbt>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I have trouble understanding why this patch was not applied... I don't
know, maybe it should not be send with other patches.

Or maybe Rob can pick it up?

Best regards,
Krzysztof

