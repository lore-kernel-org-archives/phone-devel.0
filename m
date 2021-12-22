Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E987C433F5
	for <phone-devel@archiver.kernel.org>; Wed, 22 Dec 2021 11:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244511AbhLVLQu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Dec 2021 06:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236636AbhLVLQu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Dec 2021 06:16:50 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F25C061746
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:16:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t26so4179039wrb.4
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2Mo32W8JTFCjLZ+EMibViyk9WSjJAZW9YRzpSwd3f5g=;
        b=b35DmtKSDnjtb6g2XbUSASAX6/7SHGKxQV6uWLwyw6310JQwkUH6R0rej6OFVHPYqt
         ZlWaRtb/LPwD5OCoNnObBuF1A4D63fPud4aldcdHBKDADvVbaTYiJ9sJWrzoahnnbVYU
         Y8XzAbXjaOzt95D42cUtf/pE9Q6KbfEdUa+DxqvkzB7MKSw6kGgcQ9pEAvzKrBBCfqbw
         gAXvD3D4vMOkfGBOl0Rj4gx5Jf3AuheDTAHD81bM2J6XbdJQLxfqu8xhLJMxW1DPaL9g
         N9cqWvydXYjwxv7xi/eiepDHmO5F1zwGNA8W6TXVwUIIzfOlhUsN8NyF+k1QtC2OkhDB
         bjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2Mo32W8JTFCjLZ+EMibViyk9WSjJAZW9YRzpSwd3f5g=;
        b=dAjDa8srXgW4uTorXd9wRjdJdvH5Ku0N0c9lQQ+yBCGbR+OcA1AmgUkYuxDOLNPlVO
         NOWwoDq0UOUZtsuR7GqIASIwXmZ5P42FkYUfKMswUU7xAUSaP3I2ideJiHrnYMHUvtJV
         yWyhiMMAjwb8vCO/q8J8h0XQlsJpemnIqRwDlwPepyHOZoWgQzRN/no5fTcu2fQ67uv+
         Y6KODnhvkfJ6yT+chS5yi5w6Iq87vXWofN56P5gZj6fLwNvonVzyL6o1v1bAny5SRPhI
         szgc3IDUOXRbjYOPQMKrPA1nuTr1KfjQusgbxHCZNTLZGQMMFkj9ge3SMCTs+TtNtyJZ
         HHJQ==
X-Gm-Message-State: AOAM5320Ly1Waqx7VyPgLwNLrTRKZjKgH+ByzcD/U4APK+yvxUAfNT0j
        pYt+S7DR2ZA8OSY+wxVypspD8w==
X-Google-Smtp-Source: ABdhPJzzz4x3+XF/hgP5qqgQREYAHIjOt2datURQjBi/nC8bdYRav/zP4bLMzHZ1FBo2p6vV4L2+9A==
X-Received: by 2002:a05:6000:181b:: with SMTP id m27mr1705042wrh.43.1640171808427;
        Wed, 22 Dec 2021 03:16:48 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id p23sm1446946wms.3.2021.12.22.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:16:48 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:16:46 +0000
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
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Courtney Cavin <courtney.cavin@sonymobile.com>
Subject: Re: [PATCH v3 4/9] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <YcMJHmpheylD+L3l@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-5-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> of 3 and 4 respectively, causing out-of-bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by parsing the
> property separately much like qcom,enabled-strings.
> 
> This also enables more stringent checks on the maximum value when
> qcom,enabled-strings is provided in the DT, by parsing num-strings after
> enabled-strings to allow it to check against (and in a subsequent patch
> override) the length of enabled-strings: it is invalid to set
> num-strings higher than that.
> The DT currently utilizes it to get around an incorrect fixed read of
> four elements from that array (has been addressed in a prior patch) by
> setting a lower num-strings where desired.
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 48 ++++++++++-------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
