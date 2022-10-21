Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31CFC4332F
	for <phone-devel@archiver.kernel.org>; Fri, 21 Oct 2022 14:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiJUOh2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Oct 2022 10:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbiJUOh1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Oct 2022 10:37:27 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C39227EADE
        for <phone-devel@vger.kernel.org>; Fri, 21 Oct 2022 07:37:26 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id a18so2161194qko.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Oct 2022 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnAuXgvIvjZM6WLlEA5bBmzqAbuBhz2iZ+0vd24tkXg=;
        b=OLnv9Em0nWvgkrStFbWKMOgNqSKpsdAUcd46NECG8XYcLsgOoxt/h1WbmgNQTg2cG9
         MxlrnsCGshcGpwmVe9rMd0iumdRejWYJvOcfXMcOs99RvYggkmmirc17Jpli1MqYiFOw
         rRV8qPRfCxnFyGkfTRRmpljzD1bTrecjmESY22AvUxQ0CujgzxTGZC81T6oEn+38FavE
         xWSoQZIbrHD/j18HhsbcFNr5H/HzeY5rle//zNczMaP0CMzj3yz+zqG4wWiXEwA0AO/+
         fqTuNgTlUXs7GD07wcn7GFLTbTjfBJJXQ/Bef26mLYaSSb094UpOg/SDj8wploly6Q2j
         KIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnAuXgvIvjZM6WLlEA5bBmzqAbuBhz2iZ+0vd24tkXg=;
        b=7tT3toT6v7CE2kt69N0+CtcozYzv/5b95ropN1CO3PGf396hEFZySc2u5VYwkihWf2
         eb+BSecCX/eYZOFaK6SzMuuGk5QnJUfM2gQWN2lVei28f/c0ZfT4+gXmBpsSwJ+7trAj
         v2L99zTC9Hj1TWt4byzy6AorgBCzGfqFwtQs/xix89g8nETThGkik/hDa7do9d3rxKRV
         WnU+0Htrb1mIcd+U8s197TErqz+NWtwq2ppmOxjktmu3HBxBOfKRPPKOh5bFeoOuz88+
         bmZaYib3O1veyKi48hN/rDfrPyGkVgRJ3OgooWjmfVgkbWiTHZMvb+xsKn4z6pvvEhD+
         un3w==
X-Gm-Message-State: ACrzQf0zbQwWbmSy1G/IJ+JgvWsq+3TqgMaypM6jf6JaER7heq6txM3w
        wNh1fGaALwDahCoA+Fn3HkjP/q7tdws37A==
X-Google-Smtp-Source: AMsMyM4dY6h/+9LKb7cQ3wDp/xk87PN7jDNkqRLiDngF99oRzo4pNwjWcVUd2vRoWu98NiUkVloNew==
X-Received: by 2002:a05:620a:3715:b0:6ee:cbcd:3e8e with SMTP id de21-20020a05620a371500b006eecbcd3e8emr14046274qkb.98.1666363035184;
        Fri, 21 Oct 2022 07:37:15 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id w6-20020a05620a444600b006b5c061844fsm9742381qkp.49.2022.10.21.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 07:37:14 -0700 (PDT)
Message-ID: <711fa34e-ef5b-8b4d-5496-1820d540df7e@linaro.org>
Date:   Fri, 21 Oct 2022 10:37:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: add oneplus3(t) devices
Content-Language: en-US
To:     Harry Austen <hpausten@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221021142242.129276-1-hpausten@protonmail.com>
 <20221021142242.129276-4-hpausten@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021142242.129276-4-hpausten@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 21/10/2022 10:24, Harry Austen wrote:
> Add compatible strings for the OnePlus 3 and 3T phones which utilise the
> Qualcomm MSM8996 SoC.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

