Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12805C433F5
	for <phone-devel@archiver.kernel.org>; Wed, 22 Dec 2021 11:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240247AbhLVLSk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Dec 2021 06:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240372AbhLVLSj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Dec 2021 06:18:39 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F244C061401
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:18:39 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id e5so4194944wrc.5
        for <phone-devel@vger.kernel.org>; Wed, 22 Dec 2021 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BTFrGRijmyqVtwNX+eYj7uLDLDEXDa8YjLzuMRD+fi4=;
        b=n1wWbc5/GBac4/7gX+mStLNdXD+9ZndYLSDI5tNU/kz1pFG6iO/9vDLjbq3DvBMd7w
         XDwjYdZrCF3T5s1L15XEHfsQe81DDgZNTBJGUXvkDlQdIGA71FSjMEnYgn3gz3LbqQgH
         JgGkm5YZGWh6e0AyCb2sK0g9PiUEL7B7UieKYvrzmgObGqfRvPMPKs0uhSUk9RJWHsCM
         V8dbXY3DQADZK5nusdcU76Fmwe4y5LKKgYmD4niSo6OGjcvhaPt9OJvsuQ3MrIPhmLow
         8ClxdDLz+f99tFS5ABAYB4WeonMu7CrFh5Vp/if6pzBieskOCnPyBORKZDHVlCyGhLLM
         CBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BTFrGRijmyqVtwNX+eYj7uLDLDEXDa8YjLzuMRD+fi4=;
        b=PRi9NeEbM656unKFaJuSl8atirXWOqJkbbLwtfp2cXDGKrwoDcXxtVTB6KzPP1EZbZ
         8sEzHYiDvnEd8kx918yH04CVGSJdyaFRj5i8XjFwb8n1xtsL9cyVBidaQd+OumvbtQh9
         A9pT6ZKtWooGI55KFWcLtkZeAMiWukzA0W3OzOl5amVCxBC0Gtm3Got2QdJ3cePYnxRR
         oVkgvuXwC4ofowhulkv2i/3qK4rGlKB5WoEEAK2F30mx2QAGG7LtGCJm4QK4Wzr/fD7g
         Ewxu27RhvvVzAiqD4X6UiL0kjuPd5Ec3yjChd4LYyMUy1pLDx1ymKy94ebQ9saCykCr/
         DLEA==
X-Gm-Message-State: AOAM532Oyb5onFuQF4SMD8OkT9i7SC30nbzZViOf7R3+8TEu5VmAufHu
        KWuJ/qtafKNJxOnBxUgeruNtZA==
X-Google-Smtp-Source: ABdhPJw38s9cSuuBgFo9+w66UfDHy3rKbuDjgI0szZLbSoZofWuGha24IIq6shTkSBB6qomoMhNtng==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr1750277wrw.353.1640171917614;
        Wed, 22 Dec 2021 03:18:37 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id a198sm1460546wmd.42.2021.12.22.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:18:37 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:18:35 +0000
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
Subject: Re: [PATCH v3 8/9] backlight: qcom-wled: Remove unnecessary double
 whitespace
Message-ID: <YcMJi5Gpx84zaau6@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-9-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-9-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> Remove redundant spaces inside for loop conditions.  No other double
> spaces were found that are not part of indentation with `[^\s]  `.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
