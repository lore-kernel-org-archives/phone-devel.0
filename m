Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A50C76195
	for <phone-devel@archiver.kernel.org>; Mon, 27 Mar 2023 10:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbjC0KMd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 27 Mar 2023 06:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbjC0KMc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 27 Mar 2023 06:12:32 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800CF524A
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 03:12:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c9so236152lfb.1
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/C2K7AVqHJsIM3703QBvpePPFt/BDGgGCogbo4S2LZk=;
        b=WxthYPz1xddExSJCFGmMBWlKOVi7fQatkdUFNt+PD2NkE+/kLZjyCLxDkGJJ2kDHUx
         20Nqjf2ZyjFHwiQPq0x+/W9S0PwYZL0C9hX5eE+A/snI5hmIICi/n+nslh/IkA4JJXsh
         7GJ+k+QYGbesXFGy+avXrQ4cRA/mL5hJ45Iv5MkbHLKpo4KFPSeV9c5gGHMkuHxSr3N5
         D+7GltAEGNSbjJvbY2CsEPfCHlyI30Dd8V6pPT9Gs/vkYac06p5BbqBSS4rogKd4JK7k
         6V6VLyyTH7jD/YYuizij9tV1VmQdZceJjgkAjMC2BWIR8xkja0nvEkWkjJZx20d1E8zX
         9mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/C2K7AVqHJsIM3703QBvpePPFt/BDGgGCogbo4S2LZk=;
        b=7Ddv9PwXTYGpAYV3TKMHSK5Cqc0zRK2JctyZeBTFHCokGGHsNdPUQ7iEcD+zg8h3BR
         kgCCm0waENe3YnKuFYIdMApym7u8EDLFYeVNbcgaunzjI3/pZB6IzmHzB/HZqZIQmH57
         pbXGgMNimXrEvQBhk37EDhMK44+y3cA/DMYyDB4/NKhzpUp4BqB7B4ZktjaTN4GkQqw3
         fGro3EYWTMcBFJz6psNOGXxT3LGOHzVM9lvPeidOEI+E52cQ9pl1PsXQGOt+fBWgHyQn
         9K5vcqXw+qnKBpK2enqaDN4E2sDLlMipFepKcFiR9PvOT5CzKp2t5QWyWq397/3yN2LV
         w32w==
X-Gm-Message-State: AAQBX9d4owpXsYNjP6Nbxq2wLGnN0w6MTmWAzHNC2bt8W1hwJV/Tb9BV
        QcfIob6rUC6VuOQ7gVU+HOlZd/5EIa7dQejJKi4c5IUa
X-Google-Smtp-Source: AKy350aoI3P2M/ZfMH5ucUYBuToxtgKf7V/XGxgJNrkdlksvqd3WgQLgAo/x7NDfMCfDmNlDw5zvMQ==
X-Received: by 2002:ac2:546a:0:b0:4dd:a57e:9960 with SMTP id e10-20020ac2546a000000b004dda57e9960mr3418274lfn.5.1679911949786;
        Mon, 27 Mar 2023 03:12:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b004dc807b904bsm4632413lfk.120.2023.03.27.03.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:12:29 -0700 (PDT)
Message-ID: <e580d40e-c248-40f7-54cd-693d75c613fb@linaro.org>
Date:   Mon, 27 Mar 2023 13:12:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] arm64: dts: msm8953: Provide dsi_phy clocks to gcc
Content-Language: en-GB
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230325112852.18841-1-a39.skl@gmail.com>
 <20230325112852.18841-2-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230325112852.18841-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/03/2023 13:28, Adam Skladowski wrote:
> Provide clocks from dsi_phy to gcc, this will make
> sure we don't fallback to global name lookup.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

