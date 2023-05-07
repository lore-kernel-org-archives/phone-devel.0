Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E734CC77B7D
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 15:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjEGPnW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 11:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjEGPnV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 11:43:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A85F13844
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 08:43:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4eff50911bfso3983085e87.2
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683474198; x=1686066198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fr2hGT93hwoVDFpT4bMl3C3u2Y9uTIfICyFQ19Ymcs=;
        b=S4WbRtV/yws6OmSwy5J3YrByyqF/zD6ZZDGyBEas1XKrBvApLMbaPxjJlMoJ1oaHBx
         Sapx8GwmWrL+PhI+Lix2ULUzGA6fdoU4mvtDAf5IXapt6OzxOr27f3U5n6KgpBh3ZYU7
         YK2QNN54DLFYzfnMukK8DVZawKvfXXo7n1eTr1ptdPelLgD4NkSIwzM5rgd7HTkd7rdn
         E+KS9QSWimQRcmlqzPlTnI+iCv+gMRytUVB9u4gyP7calKjL/N93rM2G5bZX9Sg6WX4G
         YZdHBPYBNJesiYI5NYr6DTcF/qPda9P3amyiM2scY81cJKuzvVwjbaBTyd0EWJ5tDSxf
         gtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474198; x=1686066198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fr2hGT93hwoVDFpT4bMl3C3u2Y9uTIfICyFQ19Ymcs=;
        b=daZPsrfuYQLqffnflLTJjBJhJjWOFyCY4hDBOR1XcY8PL77ZWoeHbJPkF/ewZxY1e/
         zgFEPssvzIr8ZYWGTIVEkd+B5lWqtjhZxld/SkOdJ7H5ZUjOfJ8IZXZrXQnGg8iYK3bH
         z5NVeIZqteaqwjPqPva1uTYDrGqVy+HEfdNfG97ttMLqI5qFIf7InELR46gxJ/qWygeg
         GBfR3v0xYUviV4pJPiUtac67Xq6Y8hKmvFgLU9SSO77teMyRvZlj/LNlWDrlKt1NLVox
         PdbZLsFnIDhPYZZPKNlH8usy9awSyKNzyYQKHTdGjWY+yqLjW8GShE0A9H+kvz67e3pA
         v2pA==
X-Gm-Message-State: AC+VfDzp9ohZ97sYf1PDWUAXSnk6vtj25emzBmXJjyEsX5hVadzcY2eh
        P+2YPwr2rcX+ZWB8Cjk9wRhQ8I7JWs+3v7wziE0=
X-Google-Smtp-Source: ACHHUZ7JwMKlF16an5fKAAhKtWGc3XJ/p+7XO2tbUyGsNJ3hOPNiI2RbyXln+FYT7cYlhi/hsXylDg==
X-Received: by 2002:ac2:568d:0:b0:4ef:f4ef:a1cc with SMTP id 13-20020ac2568d000000b004eff4efa1ccmr2026719lfr.14.1683474197789;
        Sun, 07 May 2023 08:43:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25fc2000000b004b55ddeb7e3sm1012158lfg.309.2023.05.07.08.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 08:43:17 -0700 (PDT)
Message-ID: <55538c42-b348-71ab-4aff-7cccfb14f8ab@linaro.org>
Date:   Sun, 7 May 2023 18:43:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 5/5] iio: adc: qcom-spmi-vadc: Propagate fw node
 label to userspace
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230502-iio-adc-propagate-fw-node-label-v3-0-6be5db6e6b5a@somainline.org>
 <20230502-iio-adc-propagate-fw-node-label-v3-5-6be5db6e6b5a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230502-iio-adc-propagate-fw-node-label-v3-5-6be5db6e6b5a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/05/2023 02:17, Marijn Suijten wrote:
> Set the read_label() callback to return a friendly name provided in DT
> (firmware), in order to make in_{therm,voltage}X_label attributes show
> up in sysfs for userspace to consume a channel name.  This is
> particularly useful for custom thermistors being attached to otherwise
> generically named GPIOs, where the name is known by the board DT.
> 
> If the channel name isn't set in DT, use the datasheet_name hardcoded in
> the driver instead.
> 
> Note that this doesn't fall back to fwnode_get_name() as that provides
> suboptimally readable names, with an @xx address suffix from board DT.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/iio/adc/qcom-spmi-vadc.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

