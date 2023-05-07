Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76E1C7EE24
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 15:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjEGPpx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 11:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjEGPpv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 11:45:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075EC1569F
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 08:45:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ac8cc8829fso23952441fa.3
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683474347; x=1686066347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bThKD9Cm9LXr2YLDr552NMQqfympNUCu9WLX9HUvyQk=;
        b=v7PxAYn+0ucODB1TEfj8Pci5XyGXL0dKqIm831rWrZon6MH6JomhC2KCR5SMl/h+Bz
         jJPE+mWAucoR8sINAuL6Mx2DXl+mEi8GQtHg34f8wds+odvPy3G4sLXgBFawuTydUiiT
         rl3MG29NA8Gd17v8xr9MeCHGJ8GFf3n9OFwyXfxyqmbPrqou0VZ4hvvt+Jjd/tVqu56M
         9sgPTrjUS9wkJaHKACDQvLlDPR4GTNo9b7/PDX+VkSPG38xrqgflWKyoKXgmj2B25ywB
         9GlIun3cNw0UkcqyLNl8vP/+qmQfG3U0J7cVA/O1sn/7Yviu4xz24C5Felo0SO5nrrHK
         4u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474347; x=1686066347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bThKD9Cm9LXr2YLDr552NMQqfympNUCu9WLX9HUvyQk=;
        b=WIxjIlQMMOorvFcRafJdJD2UcsCGJb9tkltxTJrZrMeZao+JacINQ1swTPJjhMQp8K
         11vKH8JhbqAWGHkQCMLKYx102S3AU5CdrB8+33pTdnTDxWw7t0wDWdbAh4L23WNWKYS+
         1/PFxfmgtIH1x+7frlULNMsz7xQkuvuX267+kuNILGmj6vhn7RVaReb4zoAaVAEofQgb
         kThpIT0SYaXDW9Memav4Ao4QrIpeTTDYXx3JielkCMj5G+Qrys+N70LGyGYZmanx+lbZ
         TLZGbt/T+fDJC3WWpjmsgJIiHDMDXYfzDxcmMIZ7MyxMUUmzlyXF7CwtC9DhmfqyVg92
         0d9w==
X-Gm-Message-State: AC+VfDxtxKHbfwedF2x1ubfU1QSNUUMcE+msjxjD/UGtfE4NGfncQJhT
        U0uTJ9igExjdVh8ETJfl8RmX359SmqOkeo5xKA4=
X-Google-Smtp-Source: ACHHUZ4j1Pp8oDApeXeiXwNMTOjH+yYPKR1JOrwncamH3Clz1z6+9Z1B9Z6Ci2O/BhqnlpkyYZ4Irw==
X-Received: by 2002:a2e:6e09:0:b0:2ac:7472:5486 with SMTP id j9-20020a2e6e09000000b002ac74725486mr1893287ljc.17.1683474347236;
        Sun, 07 May 2023 08:45:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l17-20020a05651c10d100b002ab0c9fab23sm845019ljn.79.2023.05.07.08.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 08:45:46 -0700 (PDT)
Message-ID: <56b464d2-082a-b8a6-860f-e58932a926c0@linaro.org>
Date:   Sun, 7 May 2023 18:45:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 2/5] iio: adc: qcom-spmi-adc5: Use driver
 datasheet_name instead of DT label
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
 <20230502-iio-adc-propagate-fw-node-label-v3-2-6be5db6e6b5a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230502-iio-adc-propagate-fw-node-label-v3-2-6be5db6e6b5a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/05/2023 02:17, Marijn Suijten wrote:
> iio_chan_spec::datasheet_name expects a channel/pin name on the hardware
> part, i.e. from its datasheet, instead of a friendly name from DT which
> typically describes the use of said channel.  GPIO channels are commonly
> specialized in QCOM board DTS based on what a - typically thermistor -
> is connected to.
> 
> Also rename adc5_channel_prop::datasheet_name to channel_name to that
> effect.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/iio/adc/qcom-spmi-adc5.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

