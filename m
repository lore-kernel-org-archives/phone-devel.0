Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913F1C433FE
	for <phone-devel@archiver.kernel.org>; Wed, 22 Dec 2021 11:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244482AbhLVLPy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Dec 2021 06:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240196AbhLVLPw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Dec 2021 06:15:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735F1C061747
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:15:52 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id q16so4165685wrg.7
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
        b=JuDGpd4Hf730Hy1xkZzdm7Jm917/6CwrXFdCWLv4thxaPaEAifEYweXoJTV2dVFxiq
         5xNyIY8uwWCzHqo0fIzTfrz0TCDGF/U3IMQMKFidXd7Wya1wS/CDmt9LGkmKh9VOdxwg
         mJABWKYoU0c636DwooyIxlIV1WtLmeZtbP7evZqI20Ft33qK8PHZFj/UWPobzGv+fL6j
         eJ1MR6XCqEs61xqgDGX08pWrOy9fzmd3qJ/tz8fZ5a86CY4EoTFamlTp0O7xsPvU2RVv
         M5W+bMyn1VJxWuoY5gA8vqSqAuUF/dmwjl+6S7X8vOkqg6XTljUe/M6I4lBeR79ZS6G0
         mt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
        b=ahQwlzSlK1lh0fkG71aAH6bfUm9P81Xj04YjQVnA1xLu3pX5TXwiUaVcUWbkv+mXu7
         lKw9aM8z+1oiyFv+R5juPQXx6t3rGWa5fEnWbldeGob4G4y5RrscpQgLKGwZCupEXy7N
         egnJYzlp1wS2qytKcU0zy9/EfRQqlU4N2cSJq4hNjwqT2q8WB3WWNuFdcTmbX+P8xFDA
         q9TPTKF45DVWEeOrO+BdicIIrbEZb/f6mrgYk1inKwS2/38S/8r/emsrWbrRj8+xjQu6
         1MFROjOlQjB4w+6uAA8Vc90DcwUBT9D4YBWkVOVjOd3m+/ipkIH89F0ti6Fw5Iz2m9De
         8vig==
X-Gm-Message-State: AOAM532Xx+SN0Y0HZQaFicuChAaqmtfASsTLT7yExG/gxMtIxBt5hlwW
        uuQl+ubC21qDThb9Om1PIFcPQA==
X-Google-Smtp-Source: ABdhPJyaGzs1v4cpza6jVqOa8pif0o1C0RknC0vja0TI23nk6gWPNt71MTTcv4gmRcsLQ98s4nzF8A==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr1755010wre.622.1640171751048;
        Wed, 22 Dec 2021 03:15:51 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id 14sm1801429wry.23.2021.12.22.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:15:50 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:15:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 2/9] backlight: qcom-wled: Pass number of elements to
 read to read_u32_array
Message-ID: <YcMI5Oq3jOIFQvKc@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-3-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-3-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> of_property_read_u32_array takes the number of elements to read as last
> argument. This does not always need to be 4 (sizeof(u32)) but should
> instead be the size of the array in DT as read just above with
> of_property_count_elems_of_size.
> 
> To not make such an error go unnoticed again the driver now bails
> accordingly when of_property_read_u32_array returns an error.
> Surprisingly the indentation of newlined arguments is lining up again
> after prepending `rc = `.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
