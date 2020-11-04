Return-Path: <SRS0=s4wV=EK=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E68C388F7
	for <phone-devel@archiver.kernel.org>; Wed,  4 Nov 2020 11:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3296A221F9
	for <phone-devel@archiver.kernel.org>; Wed,  4 Nov 2020 11:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfysMykN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKDLH5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 4 Nov 2020 06:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729608AbgKDLH4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 4 Nov 2020 06:07:56 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0A6C0613D3
        for <phone-devel@vger.kernel.org>; Wed,  4 Nov 2020 03:07:56 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id n15so21629494wrq.2
        for <phone-devel@vger.kernel.org>; Wed, 04 Nov 2020 03:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aQ70y6nwaGDpVB89YcPazoVFZhvvvPhw+w2IO+1iReE=;
        b=jfysMykNr92UGsxIyN652D9xl/9pnxEADKDct0dfoNO4LiBNV3A/PP9Wd83LRENnX3
         auopbcIq3U8iz7xjlh0FqIBSGUP+eAT3BKoK9btR7rzu6FL+zs+U5xDZaJuMcczeCAhr
         r3xHpNXrgPA8QuyOEw/HwTUl2EXPEEIufGWGsPC7AUiROdCtJGz9p81OzEngd19rj8Ib
         p90yTmQv/nlx4AhOwJ8mor3Ho4Tq39dcAkjY8dMxrDcYTpbgQd0l5pfkGgIvFi01MASC
         /PTksf/V2B4MH/GN/n+sSEWz2uK8+qmgarR/XtML7y/wqxEn19GuaaQjdtZxW77jTvin
         1hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aQ70y6nwaGDpVB89YcPazoVFZhvvvPhw+w2IO+1iReE=;
        b=Q1B+6mJPy3ZqrPO76GwHuOW/X7zP2PSG8iymc7aWNkXAzk1hfj00ARRsjhaeSobyBE
         50yM/OXu3WoP1SbWLE4qv3DgVSsZFcaxuES/ofrvBIHzMGJRWK111DLygiZXxuGN75AZ
         Y8FgWy6S45If/l8JWuG4b+PFWXcaBfHiVRJJ1iStMTxpZd55e35J+FHX/Y9bnlvpZY75
         u2FjBkt3JNIfSpkfG8CpX2qLeIhU9hO9/htn0URMvxDFtRT9QkEgQhbCko+Yu7uwZHiz
         6nDrgrWJ+k0b97qTHdW9PZp3kJISOO2XI2CuR2JP1yTUx25x2pxnxposOQivrDwhfPj0
         QDPA==
X-Gm-Message-State: AOAM532bRzpo7o0zrlC0tzT+K42woWdy88hmBro6IYr2Gn8qGm8iq7Pu
        5sRfO5XFBefq1CtNUER04ItsyA==
X-Google-Smtp-Source: ABdhPJxcshakygaS5pG5d0dSFGQuQu935SeJv+/o49do1BVAVtfmVD7fWuIEWoa1UUrK19pvhwCoRQ==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr29585926wrr.380.1604488075362;
        Wed, 04 Nov 2020 03:07:55 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id t7sm1889308wrx.42.2020.11.04.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 03:07:54 -0800 (PST)
Date:   Wed, 4 Nov 2020 11:07:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     kholk11@gmail.com
Cc:     broonie@kernel.org, lgirdwood@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] mfd: qcom-spmi-pmic: Add support for PM660/PM660L
Message-ID: <20201104110752.GB4488@dell>
References: <20200926125549.13191-1-kholk11@gmail.com>
 <20200926125549.13191-7-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200926125549.13191-7-kholk11@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, 26 Sep 2020, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add the subtype and compatible strings for PM660 and PM660L,
> found in various SoCs, including SDM630, SDM636, SDM660 and
> SDA variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/mfd/qcom-spmi-pmic.c | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
