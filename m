Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB1FEB64DD
	for <phone-devel@archiver.kernel.org>; Wed,  5 Jul 2023 09:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjGEJrK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjGEJrK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 Jul 2023 05:47:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C2A1713
        for <phone-devel@vger.kernel.org>; Wed,  5 Jul 2023 02:47:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992b2249d82so762601566b.1
        for <phone-devel@vger.kernel.org>; Wed, 05 Jul 2023 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550427; x=1691142427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qZvOCuKtFzTR7vPGrjwngsBt7RydTrhfcDYMvZhiw8=;
        b=eUSy8p0Mg7RhNCBHhmCblXUAWtklwGxj/93vKnJv3r8/jA/k+PrRQHB/n5Y9+pqFWG
         QJ5L36IOr4Edpr+OshV1EEofpxOb9XUsm3e0NTFo00j5lzn/2h3MfPHVpMm6sMQ4s0VO
         6AChbtHcRFLsO08XLTrYDi1ehCZ0HIXucxe6e4fgREiTEN4JwKZXB8xPpMFc+5QdG2M/
         QpINCWSYcL8KnluLbVuIcGECtF/ipK2oQi4HvVAAJG+1ChtRUx4QmSuI/NhADZf53xsV
         PYssiwMzpH93sPPS6BUHOmj8ntbrsTTUNDtD1VQXKAzY/+EMq7vNNcs2Y7fxqmk4Fdtm
         iW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550427; x=1691142427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qZvOCuKtFzTR7vPGrjwngsBt7RydTrhfcDYMvZhiw8=;
        b=Qi2Apa5VjhSTzOihocvxm5uSuVyxB8cpOjQFlitbUE/Cx/XYvW7AwAfiB61YDspB4P
         +dX9Q1j83i8GzPBb8cME9K8oNCyhtMaAbaBx0Yuf0Scgn+gEuzsn96X0uHy+LzRYyxVa
         /djUtTl+iW08xlqlP4wc+UUDLPFUPqB8VkYOcYuIwb03qCMZOD/q7pRkDEr3zsPmJ2w1
         SjmSNXhI9Nv7iFQAgXsebzX75JOtRMHLKyUEMv8scQf6QxlOH0MfwDKnDHNJ70ltz3YI
         th0xZNcTAdGWczGYaLHXfcDqU0QprgJC4plPfgJuqwO0OgHZjIaERet7CZxyQm7i3tnJ
         8X1g==
X-Gm-Message-State: ABy/qLY+5ktsomyZM2Zg+Fz8EzX8f744c/sIGC6HXOWAvPz0guFsKHD6
        VMo6+JtWyQgVIC6de60VNxIUxw==
X-Google-Smtp-Source: ACHHUZ7mGwZf3R998XeLI1YA51tEUsLMBv+Cw6Q6BC5GAYD2s2ZUyWeqERykOe3eIHcokghQRKsdvw==
X-Received: by 2002:a17:907:9859:b0:991:e3c4:c129 with SMTP id jj25-20020a170907985900b00991e3c4c129mr11397957ejc.69.1688550427056;
        Wed, 05 Jul 2023 02:47:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id mh9-20020a170906eb8900b00993a37aebc5sm502987ejb.50.2023.07.05.02.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:47:06 -0700 (PDT)
Message-ID: <fe205e01-c065-adbe-33bf-b2acb1058c27@linaro.org>
Date:   Wed, 5 Jul 2023 11:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/7] dt-bindings: arm: qcom: Document SM7125 and
 xiaomi,joyeuse board
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-4-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-4-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/07/2023 18:31, David Wronek wrote:
> Document the xiaomi,joyeuse board based on the Qualcomm SM7125 SoC.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

