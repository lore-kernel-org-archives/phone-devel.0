Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D204DC77B75
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 15:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjEGPqZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 11:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjEGPqY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 11:46:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898B71569F
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 08:46:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso4103947e87.0
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683474381; x=1686066381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mMFwsP1GokXoco4sLkCwxPmjmgp4XSFXNsi6M35FmU=;
        b=IYkINLBSVEVGugIjcyNMP7aBfhcoUjUGjitpIItA74cMIPi8fojtsw2tMHGDmfTieL
         IWTWDN7nOKD/3DIZ+aEIRsX08rogFIt14T/PgTXaO7rIcRqSl2JL63ja4PmTFUfKSyi1
         wSnf5iGMj+s9iKVzW9oXphBEoBeEyk5DEmP5zEfaNgwtbnBOFOZCg00GDa8bDG3NaoaH
         PNYtPABqTYPkwD4JnIWlPwYa9FzAM0iHDXyCut1/Niwk1XhA5tCFPFC6/YTXR5Pb8YS2
         sAw8mVDZhKmKFOyEW8I2qsR3G2Ua57s3mhAIfmDmLLO5phnkCeAK1I8Xs44LOnWCXiiA
         hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474381; x=1686066381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mMFwsP1GokXoco4sLkCwxPmjmgp4XSFXNsi6M35FmU=;
        b=SutFi0OnZ53JFLcZIdJ1fCa4a6/gU3X0eYj+lPDTBV9un7jgBp2S2d6FwM2qjYr0pi
         aej/PM8QjI0kZDx6hQZxsjKtoyxmAsYJ89ncy6u7fL+HNNBQ9lDdqua9ajyTw1VjWe82
         Cyxeqy81KdtaCDBvfTKxjxVOFnBTAafUCfbKReh5ObYmIyHoUjtPFD00zASocmE3f6dr
         Fp0XZc+O1QFyqZoecWSeWo9RqfmWTIPVRDeCFomiSDW6Coq98dKG6nJtO3geIA/x7al3
         zUs79BzO+154gvIEN+dn31A9i9DziNZma8FP+aC2FvaZ8hWIuLtbiN8qmA/0ioQ7aACo
         B3Cw==
X-Gm-Message-State: AC+VfDyZJX5CuK86H8AjvzAbkPSe4iYmoUAI5cqDRrP900KgF9bdHHfY
        c1rsmYObi7h+Bsl3j2GrF8bvpw==
X-Google-Smtp-Source: ACHHUZ7vuK/HoIkOZmsKcDB3lECKJ/R5wRWeuJVPoopWViuWyaui+5BQ0/4T8ztAifH1r/ukgdscVw==
X-Received: by 2002:a19:ee04:0:b0:4f1:5001:1d9c with SMTP id g4-20020a19ee04000000b004f150011d9cmr1330158lfb.55.1683474380782;
        Sun, 07 May 2023 08:46:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c14-20020ac2530e000000b004e83f386878sm1000134lfh.153.2023.05.07.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 08:46:20 -0700 (PDT)
Message-ID: <cd1cc7ef-e92f-aa57-a8d9-7ac7f1c7ac78@linaro.org>
Date:   Sun, 7 May 2023 18:46:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 3/5] iio: adc: qcom-spmi-adc5: Fall back to
 datasheet_name instead of fwnode name
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
 <20230502-iio-adc-propagate-fw-node-label-v3-3-6be5db6e6b5a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230502-iio-adc-propagate-fw-node-label-v3-3-6be5db6e6b5a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/05/2023 02:17, Marijn Suijten wrote:
> Since the migration to fwnode_get_name in commit 4f47a236a23d ("iio:
> adc: qcom-spmi-adc5: convert to device properties") the resulting
> adc5_channel_prop::channel_name (renamed from datasheet_name in the
> previous patch) - which is propagated into iio_chan_spec::extend_name -
> was containing the DT node name including @xx suffix if a "label"
> property is not present, while adc5_channels::datasheet_name was thus
> far set by the macros but always remained unread.  Put it to use instead
> of using a confusing name containing @xx in sysfs filenames (again, when
> "label" is not set).
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/iio/adc/qcom-spmi-adc5.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

