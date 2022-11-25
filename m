Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74BEC4332F
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 08:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiKYIGH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 03:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiKYIGG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 03:06:06 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94196218B5
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 00:06:05 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id a7so4280820ljq.12
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
        b=n/PGbygZuJrtVuapZT8bdM1579wHkSd3l9IVakzRsfx7SFDPCr6+z1phHUMbC7MmGe
         l/nsjSlGVD2z4Ql58NgWsJHRrVUzG7RoeQrjMaqM9UONFICqoyR0Tw+00DDFFZvIO7vg
         U28rpMxn0j2YvgpkiiuJk42Vm4yD+JEts2R5QBOzdtuVU/Vp4lKR5MUzEZNqADHAuxOD
         zS0pIKtB9DCjUE87vlRxcwXBWCI1crkRmWZ1MYhAUFyqP+rPp4m+y4/YLGju2vOSYkJU
         UbhqOzmk8husMENiGNoJibHkxoCo8tl3yVs6dAgP54EOQNJgMF3o6IU2j6VLBVx2QXTu
         aNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
        b=ja8USbXbQnsZX0/aJ9iKjtn9vPCZfXjU4G+SorqP4JvkE8AeyQaHXGY10Oj0CqKPuh
         ztK/bezHjFbv0MDLzmVDFQRcms8KI46jXmtfhDYLFneoBKj3LB0x8WGH5mmvgRFxySA0
         5WsFsixWkJ5XyTR/1taH1CdSalACgIMILFvc4D1E1xE5aw2lEm5N3+hrnNJXptmDkozK
         yIR67ebIUhs0Npbd+aXmy1Iz+M+bEEebrabfjoHRASj/yZ6yrTK8SDOLcqjbkEVwF3pt
         uMqA8+3tSDTFrMMlI1+sdsqY5mSJa0yr2pxnPfxH+ykDAweJ+JkW/5zmb38DhLd22iVU
         IItg==
X-Gm-Message-State: ANoB5plwadiByC2MtiVO+a6lgtyBRRhWvXcDm+hX+UkfhnhYDgEB0BhW
        XQndyftLVOIBcQZxg4PNeFUdpg==
X-Google-Smtp-Source: AA0mqf6VxT1aEXu7weoSccK7/ISZvPA73NLRVTO6wuY9yZQZBdzrp0PjPI71T4AeNAn5MJj15hwsPw==
X-Received: by 2002:a2e:aa94:0:b0:277:871:5712 with SMTP id bj20-20020a2eaa94000000b0027708715712mr11000813ljb.129.1669363563955;
        Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b24-20020a196458000000b004949a8df775sm433304lfj.33.2022.11.25.00.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Message-ID: <8ad024c8-1284-0f72-91a3-2a8d9b5692fe@linaro.org>
Date:   Fri, 25 Nov 2022 09:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: add support for SM6115
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Jason Wang <wangborong@cdjrlc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221124001708.25720-1-a39.skl@gmail.com>
 <20221124001708.25720-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124001708.25720-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 24/11/2022 01:16, Adam Skladowski wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM6115 platform.
> Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
> Lack of dsi phy supply in example is intended
> due to fact on qcm2290, sm6115 and sm6125
> this phy is supplied via power domain, not regulator.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

