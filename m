Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6E9C3DA7C
	for <phone-devel@archiver.kernel.org>; Fri, 30 Dec 2022 07:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbiL3HzB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 30 Dec 2022 02:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234706AbiL3Hy6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 30 Dec 2022 02:54:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38E317E1E
        for <phone-devel@vger.kernel.org>; Thu, 29 Dec 2022 23:54:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bf43so30788198lfb.6
        for <phone-devel@vger.kernel.org>; Thu, 29 Dec 2022 23:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7y9/9dqJRPgZvL3rwpxNc7byREOsvmcfrCiAJsoPaaY=;
        b=mOLozdir8QpzzKqdRCjek6mwVKVeE1bQZlxTVvBwFq7laAT8Doge7fy5R+Du/JuyAP
         s2JdpA60y3e7KAOo9kiMQZGCTENqjt8a4LzODcj/bPFQi8qetYOrF6jOSqI9DxGTvTLj
         /mibjuxy57lmczyGuNMucB4a/KviIreDtJKXYqikMAnUYSw9mGl2usI9TYk2PsAyeS+S
         Ne7DfQzn4caFqyINKmdziskFK1ozhLl/ux6CK3IzQ/bt4PmpORJ0bUj+y7fDpyu49cwW
         u/W+v/vhgr+976SDapmNwsn+lg79fzulRBVuqDVb+gPW0BkE26vhn/ucTMcxziPAS4kI
         nSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7y9/9dqJRPgZvL3rwpxNc7byREOsvmcfrCiAJsoPaaY=;
        b=RgPY8jlUQ5bCLB6b2E+TV0JBQkHkS+XTWBvNAX1KjpQMSxGfPMUlpVH3Pr1K7dzmvH
         AdaLR53mJCtgMRu9DgUBkEqJYfVIVlFLVJz1RXoBC8lexn0Aeoim1jE/+Cn6JlVX20v7
         CVpetSLAsbL/1rLOtDi4awhWe11mYDyaAybQc3MQaaX260EjllAr801X8rITrrxbvOvY
         7lEYB/+zOKCfBmYxZoRkXNzbLvDvpzNKxOaPXiNKUnHSMhWKJsX25f+ptV3K6wsmN8y0
         OHVXcee3ltl+YR1Ym0GYbqx867AtaaKN1ZDbev+ufWPKXfRY5lZ3GPeylfu6k4cT50iu
         nPUA==
X-Gm-Message-State: AFqh2kpeIJ2BF5c2i6P+fdMayM2ay6LQ9FbprKDOvx8YRbK+NfYOTP5z
        NgyYszkVT/aWhqS54B5ZbQoCfw==
X-Google-Smtp-Source: AMrXdXt2Xdw3MQFjEugmriAxPXpE2ODwiNibR/Qgt36bOws4pf3FJ9f+luPYT6LlzaLrqbnk5JNTsg==
X-Received: by 2002:a05:6512:3601:b0:4b7:13b:259d with SMTP id f1-20020a056512360100b004b7013b259dmr7853811lfs.48.1672386896122;
        Thu, 29 Dec 2022 23:54:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i22-20020a056512319600b004947984b385sm3353055lfe.87.2022.12.29.23.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 23:54:55 -0800 (PST)
Message-ID: <f04570e1-b8aa-be21-b0d6-9f56440c4158@linaro.org>
Date:   Fri, 30 Dec 2022 08:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] dt-bindings: ufs: qcom: Fix sm8450 bindings
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
 <20221209-dt-binding-ufs-v2-3-dc7a04699579@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v2-3-dc7a04699579@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/12/2022 08:42, Luca Weiss wrote:
> SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
> bindings and the example to match.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

