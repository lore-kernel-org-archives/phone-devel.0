Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B93C77B7E
	for <phone-devel@archiver.kernel.org>; Mon, 29 May 2023 12:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjE2M4Z (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 29 May 2023 08:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjE2M4Z (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 29 May 2023 08:56:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DA9CD
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 05:56:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4eed764a10cso3400699e87.0
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685364981; x=1687956981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kMFfJbf4XWQRQofGy/2ExiTeQJT1aHojFUaBWm+VSo=;
        b=BcDC1g2wM+Hky7zS2L1tkWnaCDYLDXZq2kb6pZOERWNUGx4d4jTjMFTHA07E9ApWSs
         w+dyPzzFDF3mjciTlbZNFVMzL/VqivyhhPdPLFa3yzhOHRSao2rqJFFI8bD3+OYBthlK
         cq0H0qxoBbufK5TxSEmJmBpx8zfFHFOi9XoKYMSWvS22GfCJQRLB+Ff4jk+3MSMU5qY4
         slPIAevDm7tgAQ5UqsacisFeDInVrT4+dS8H3vtMsofj414q5j61MyW00wyoYBurH+bv
         y7HCbVbew2INxWhgZ3swJESm6zOzcDUMSK3Ixg87sQZFddSnkj1j3UTgIYdzbaMlDnMK
         aloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685364981; x=1687956981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kMFfJbf4XWQRQofGy/2ExiTeQJT1aHojFUaBWm+VSo=;
        b=VKndWCv98OhUJw0LlNJn2LiK9I4VvxHShTXvkARsi8hbe4XVtwDzVdm3C74R16vaiF
         1/wRh+0iFzoW0Gcajww/Xs5zujsp4tXGg+k22JRaATUFJAhKT32kMF482gDULa88Qyzy
         Qqc5ySTgp3uHwgMiWkxTx24Tq67x1UCVn+uEInMQzAOeYg4KKFd0U9T2Kb9VMIKGnF8w
         I+sWij4nPjhZc6z8uYUcK9xpYjzTfJpVlrXLNCcmmUu5eQsZ22ODl/Tm/SkiefnP70Tr
         yYC93Tn6PidSrRIP47tlDaSTnlNbQystA9fhQBPJTHZwSRc+CFodnU1y2ywxsI1kcYle
         e2jg==
X-Gm-Message-State: AC+VfDxep4iGDQsD/77J1XW7xaNJW5/jUdbYZu/5W0ZUhqz0G4iBl3cD
        uKqdawB65ygpoyeKzpkztuzF3w==
X-Google-Smtp-Source: ACHHUZ5SDvE89GclIQVxV0l3jEskTCdcupX432GYZIWoRyUD9NsdvqkL1Ne2Cb1FwCZlHaWbxFlAnQ==
X-Received: by 2002:a19:750c:0:b0:4eb:18d:91de with SMTP id y12-20020a19750c000000b004eb018d91demr3416851lfe.43.1685364981202;
        Mon, 29 May 2023 05:56:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d12-20020ac241cc000000b004f2529c71c1sm1959695lfi.260.2023.05.29.05.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 05:56:20 -0700 (PDT)
Message-ID: <8bbdc1c3-7caf-c189-9c81-a26efc79c4f0@linaro.org>
Date:   Mon, 29 May 2023 15:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/mdp5: Add MDP5 configuration for
 MSM8226
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 29/05/2023 12:44, Luca Weiss wrote:
> Add the required config for the v1.1 MDP5 found on MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

