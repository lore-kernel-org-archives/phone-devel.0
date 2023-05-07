Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3858EC77B7D
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 15:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjEGPsN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 11:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjEGPsM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 11:48:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B7B4223
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 08:48:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f00d41df22so24762647e87.1
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683474489; x=1686066489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dvd1wcddDnuI8xDMHy/JBREKoiCmgw2+qPFLe3kD+Sg=;
        b=kPqgPO0uNRT4ln/P6yjXt/YWIChqAu/dBpyVcn9fV1c3TZDmGMfXsJ1G1Y/95+CIkN
         8JaB6Ipky4BWZrsTGvdotbye3LnqrBX0BDzSFMXNl0UEg41EFtkxY65qA4waV8r9YzrN
         ja+NnGW2j1K0OCne9r5fPNqqOBmkfIP4jyz05bW6SV/rGrbagGKuQd/YB5Q7b9DkUrTM
         ICcsEtGBmNIlLIuw5RuOd3+hgmDdBI8gfl8XW5/RrmsEpbdTOS9CBozFpcgXrzhbpOPU
         EquZCNJuBI7kvLafbx5RfZtvgaIVpdn9rj7kNyXUHXs2AUN3MtpKtKHQ28K6pw2unpd5
         I6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474489; x=1686066489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvd1wcddDnuI8xDMHy/JBREKoiCmgw2+qPFLe3kD+Sg=;
        b=INrB1PRgSqnpGJ60a/tH13DtK7yrI8jaUoQjsksAggUx58zMGJ1rQ9DWwoa94Da+Fr
         GtSrmFDEmhyigRRv5GBjL99czhFBZgahre5DqrJka2wXbfc/ron5sgzJg7uQepELkWoC
         ZK2kkWDhi96kiVWTA9+EpsWonkx4s/JphIln79SZjBbRjknjCBYmSc7jb7xds8krPnkq
         xqNN9hI+mDuzLAnfSCgNbxms7gnjGsOXCQFlMaIzwfWHMoV9ujub3WSEnUnEART/VG+/
         7zxXmF4mBLVzWStNf+Vcfe1IGmxNMfPOat25UaHhG6at8rmHRtQ/ntMjiLrRBeGtpwoA
         40eg==
X-Gm-Message-State: AC+VfDxegwhRX75+1RukFBZu72Co4UlPFsZHv4uY9+Y2wJlgagjEPoPa
        o9mOQa/1yA0i46d8lHaYR+GzOQ==
X-Google-Smtp-Source: ACHHUZ5OQ5tsRZMNgmjb1yUX5x0EN64JfrmwXl9OXuRV+QiEwE1vlP14Rp4K5Z2azPwAMwTiWuLYig==
X-Received: by 2002:ac2:5215:0:b0:4ef:d567:4854 with SMTP id a21-20020ac25215000000b004efd5674854mr1811635lfl.11.1683474488883;
        Sun, 07 May 2023 08:48:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u17-20020ac243d1000000b004b40c1f1c70sm1014163lfl.212.2023.05.07.08.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 08:48:08 -0700 (PDT)
Message-ID: <de242c1a-9717-ad79-2ed5-7b73cf66f5e2@linaro.org>
Date:   Sun, 7 May 2023 18:48:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 4/5] iio: adc: qcom-spmi-adc5: Remove
 unnecessary datasheet_name NULL check
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
 <20230502-iio-adc-propagate-fw-node-label-v3-4-6be5db6e6b5a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230502-iio-adc-propagate-fw-node-label-v3-4-6be5db6e6b5a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/05/2023 02:17, Marijn Suijten wrote:
> datasheet_name is statically filled by a macro for every channel, and is
> nor should ever be set to NULL.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/iio/adc/qcom-spmi-adc5.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

