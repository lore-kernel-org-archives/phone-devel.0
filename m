Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6897C433EF
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 09:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0DEE613B5
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 09:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhJEJQs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 5 Oct 2021 05:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbhJEJQr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 5 Oct 2021 05:16:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5306C061749
        for <phone-devel@vger.kernel.org>; Tue,  5 Oct 2021 02:14:56 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o20so18054533wro.3
        for <phone-devel@vger.kernel.org>; Tue, 05 Oct 2021 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NdfxKvwbENEe6Qc28QrxcXsenUkhHTp7Cx9+Cb+DWBQ=;
        b=Efqd2Q6eEJAmcWuAAVFU98HgD4okcWec+ZKyewYNsa7dSzFs+zvykWUBTtEzMmfQ2u
         du+rJ6pUDCijqMKMYTgIgMRXbYYkvglg9NHkPbDPvmk0xMPTrFmo90JsXz+prbiQMy0/
         CYC1K5q5Eqv82eA50uOTT9fQokTBTE+C72GdsOP/3dz7A/lvdxLKl5zTHfyVLoiBmh9n
         Cdb81R+PRorVerxid1gu491ZkGFfJYnK/E4Rjtc+vVXe6B92+p8v+OaNfeazhKr3q3Bp
         iVhafOGu5YhMAX5XUJWCUEg6dmD9eJlXM5BFsn4qfP6+v1KNFfMYNSHg/qxnzP3eyGn5
         N5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NdfxKvwbENEe6Qc28QrxcXsenUkhHTp7Cx9+Cb+DWBQ=;
        b=1Q6cUS8auIETR2gRJF6533Yu6NEOkPB1w2rb9VLEQ0ClRwfJTkr1jG9Bxc02tWKHmk
         Pag56T5SueHJ4whDP5E7j5XqgvG6Ri1PVGYBBAbj72tcdvQH31XXVZPgmlpda9rQU9TN
         zWmEqR/IcuKjUYQGVTzBzzLfx1Kfvp0yx6fq1ovvhc8IEF+oB67npLnTwUb7IATFkKnp
         p/4jKh4skMMCGbtRfpiz4ufvtNoYNjxGnp4Ir6CgkY2SytH1NcaH4fDUdnF7NMRwUQhN
         s+bUCCMxOqxS3C7lorRsDY7feGfXPWXpvusqhpY0T1kuF+YXk7vDjgAwlxRbSlT838FL
         ZbRQ==
X-Gm-Message-State: AOAM531VVXgRiWWOUUAcNT1avM2lrae9kUfSMvB4Z7IBB85MF2NOjOj4
        BwRyiLdSWj+nvOdt7WaPdylQzQ==
X-Google-Smtp-Source: ABdhPJxddGuja7rll9i8p+SZfqM/20MrEF8aoH0Y9DCaLDlXhXEhZqI9KnYMjFb95M7v/NbuPP3lUw==
X-Received: by 2002:adf:e604:: with SMTP id p4mr11158789wrm.79.1633425295215;
        Tue, 05 Oct 2021 02:14:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f18sm3590265wrg.3.2021.10.05.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:14:54 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:14:52 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] backlight: qcom-wled: Validate enabled string
 indices in DT
Message-ID: <20211005091452.4ecqhlhrdxdgvs3c@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-5-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Oct 04, 2021 at 09:27:35PM +0200, Marijn Suijten wrote:
> The strings passed in DT may possibly cause out-of-bounds register
> accesses and should be validated before use.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")

The first half of this patch actually fixes patch 1 from this patch set.
It would be better to move that code there.


Daniel.


> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 29910e603c42..27e8949c7922 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1526,6 +1526,12 @@ static int wled_configure(struct wled *wled)
>  						     "qcom,enabled-strings",
>  						     sizeof(u32));
>  	if (string_len > 0) {
> +		if (string_len > wled->max_string_count) {
> +			dev_err(dev, "Cannot have more than %d strings\n",
> +				wled->max_string_count);
> +			return -EINVAL;
> +		}
> +
>  		rc = of_property_read_u32_array(dev->of_node,
>  						"qcom,enabled-strings",
>  						wled->cfg.enabled_strings,
> @@ -1537,6 +1543,14 @@ static int wled_configure(struct wled *wled)
>  			return -EINVAL;
>  		}
>  
> +		for (i = 0; i < string_len; ++i) {
> +			if (wled->cfg.enabled_strings[i] >= wled->max_string_count) {
> +				dev_err(dev, "qcom,enabled-strings index %d at %d is out of bounds\n",
> +					wled->cfg.enabled_strings[i], i);
> +				return -EINVAL;
> +			}
> +		}
> +
>  		cfg->num_strings = string_len;
>  	}
>  
> -- 
> 2.33.0
> 
