Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C302DC433EF
	for <phone-devel@archiver.kernel.org>; Tue,  8 Feb 2022 09:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354194AbiBHJYY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Feb 2022 04:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240196AbiBHJYX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Feb 2022 04:24:23 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06346C03FEC3
        for <phone-devel@vger.kernel.org>; Tue,  8 Feb 2022 01:24:22 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso1131941wms.4
        for <phone-devel@vger.kernel.org>; Tue, 08 Feb 2022 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
        b=OjSkWWAHIdktAsoxsPi8byPQ2FeJ3bEHJsUZ77uP4OKAnFUO5xzu8gJgEUWd9BJvBz
         aO9juV01Jl+Jg51nPtatv0IZ7mhfSBtVI2MgFLAD7hRQhDhCKaCghTlC7XJOB4AytX2/
         UAC8qQsvDpuYIsar6dqeLQttRFVBOCGRSP/kOjCVp0iPeQVX5eWrBKnmGyMClgEKMPaQ
         uRN+U37PNeVifs+mA5ddKOWgc4VOK+8xIYZhqyAJQgcBY5ZQN+1I5Ajxr+QzVIjxBQax
         q7lAMPJoX4Cm4+OenG6xR9SaqiNfcTMbrnGzlg7YTuXhm7VnbLDUwDnsqIjtdsDoePeS
         agyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
        b=sJ24CmFgAppg2VWx3eQcJIbvAwGOnMLGuzm+jZBFdWGOPYHh4dgkHHQ4YdfvxBbhYw
         jbMMRhQOSCNFGA3Pyelxm+hxKLHo/ZJJHzong/eU2r4+r2qXvDCuvjNHRWdubgY1SYK5
         toK5jekrg1FFeaYPs2wSQuf9AOtPFh3Z86Tfs3bJivth9gsqlRkdkCDBB17lLO6j90RD
         HInLocYANWJRTsA5l973zxv14//5U+3i/pzrWmEo86rLqh3yafn8l9fBXbdvbDbW5g7X
         amnnO39MRq0dxmQQrtupbTBTBLJpuvdrrqew96HzHzWxMPzaCiUgbzFTunBY+nVW7RpU
         SsjQ==
X-Gm-Message-State: AOAM532me4YEqLlraRn5RZam63MzZ9Y+p0qC3PjixHcy7j7rhK9WKHum
        NgqtKAet7HLPtCSEGwkRwSM1AA==
X-Google-Smtp-Source: ABdhPJyETs0h54mjP52R9i4urCVEkYxAlnNZHIWK+XSjvKFVpOSKSwgint1uilZINo2Imx/EJawJvw==
X-Received: by 2002:a05:600c:4e90:: with SMTP id f16mr274231wmq.175.1644312260622;
        Tue, 08 Feb 2022 01:24:20 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j46sm27994wrj.58.2022.02.08.01.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:24:19 -0800 (PST)
Date:   Tue, 8 Feb 2022 09:24:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: qcom-wled: Add PM6150L compatible
Message-ID: <YgI2wXYHjrcsF40f@google.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-3-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229170358.2457006-3-luca.weiss@fairphone.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 29 Dec 2021, Luca Weiss wrote:

> PM6150L contains WLED of version 5. Add support ofr it to the driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
