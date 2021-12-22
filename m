Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CA1C433EF
	for <phone-devel@archiver.kernel.org>; Wed, 22 Dec 2021 11:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244559AbhLVLSS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Dec 2021 06:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240348AbhLVLSR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Dec 2021 06:18:17 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185C1C061746
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:18:17 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l4so1339920wmq.3
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
        b=vuOSX1bxQMEKxQcPN+VUUzKo5/t4x6aE8a4lqBIBg/AfdmqB+6KVo2XrTQoBcSf2tU
         KYJuzyeQqh3/veN33Hl/w1tg5wAKXrHSqexWXadPAvPdIo2fytqpF+9ocXySUdMR3RSa
         MRY/zjG3TljBxAp93rn6PZZhO6CIQlFo7eg8MfpoGY4uLFl8WbhQVQWDCNgMFXMJEXEj
         59Cpgd/Db1D2YmwSp6L3dll3YieiAaOsusYepMXSzdIcvxRt/NSzk4VWzfgi+tPzySeJ
         6nMIr7jC78BS9CfRNHmzaVPCONacS2shsylJV4x54vPtLpx+iIqlcIRIMe/fJbdR7SWF
         PRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
        b=ReDaFffWL5ImzllR9/GQv5xxxxaze/mYvc5/yz0VV6hghmMGS/EaELZccJkhiexkBq
         pRw1yR44zQRdF6Z0ayDQ+bJbH5ZLTxIvU3iwgv6OYJBzpIVUSm8B9Wbs0wKyv5r8rokG
         c7Y7OWUvYVF4Tmsl2V8UYHe3o5E0jU/c7OdeCl7aXVg28ZxCXJbalbakI6Lf/GOKKYTC
         bwvsYOQfnopXgh48UMTdEEqsKgZhDe5om9Y7McTADs/vv+1fsQ+fbg3QK/4dwa5oXeQ6
         7TCliJe7OR7Aqt/aoluZWWcn1AVFYgQ3N8oOC4DWBLju0XQoKNtEsSYbFgJWjMQ/fh4C
         8HYA==
X-Gm-Message-State: AOAM533gW3sIpEkTfh7rz1Yl1uNgEinh+yS2Dvaxh3zZ/6GBhR5OuyNw
        uZpMLVDvEJdBDIQjDIJ8WtkbmDagQmvkdA==
X-Google-Smtp-Source: ABdhPJxTnsCCzl4VAhbNMA9kFEFyPrCJC8S3xlkUnNwpH7/g4OOdhsrsOwbBPBROyn7j9hcnjUPYSQ==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr609179wmh.3.1640171895690;
        Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id h4sm1643585wrf.93.2021.12.22.03.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:18:13 +0000
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
Subject: Re: [PATCH v3 7/9] backlight: qcom-wled: Provide enabled_strings
 default for WLED 4 and 5
Message-ID: <YcMJdZRoOtUrWvkV@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-8-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-8-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> Only WLED 3 sets a sensible default that allows operating this driver
> with just qcom,num-strings in the DT; WLED 4 and 5 require
> qcom,enabled-strings to be provided otherwise enabled_strings remains
> zero-initialized, resulting in every string-specific register write
> (currently only the setup and config functions, brightness follows in a
> future patch) to only configure the zero'th string multiple times.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
