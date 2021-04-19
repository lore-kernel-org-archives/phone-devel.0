Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0F7C433ED
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5BC76100B
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241175AbhDSTTc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Apr 2021 15:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241278AbhDSTTb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Apr 2021 15:19:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E752DC06174A
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:18:59 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso31716262otb.13
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rnkHoMyyrqXTtZmadAmUe+XXEr7XS5f+Ds2frEajC4I=;
        b=xqW8IYtHKXWmi4K+DMTB4ieQZmBejmCNxO1xUxe73JOc/4Tt1r+G/ZGTK4BDA+wgat
         FVzSMS8xL16y65JWzI+AKsW+tmTaBBWo84TqMaap2drMmDNRSBLUggDnSDeZ4AlggaAn
         F+QfAJ6iq4nI0EhPkSccIzKiNm31BaFae1pTEdynW2IQCFVoGKey82myrktbmeR/Mwnm
         vOfQvyCM3Du8s9T+GG+KqRydniGwwjIvL8Vx0q2uhgZHXkJdbWLTV3akww3JyaE5O1zc
         WJIhhgzgruuKtirL0hxUMYKhhKWsqrve/qER7HaGQFYC+KhmOufq6MF3pS6rs9aUeFha
         R6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rnkHoMyyrqXTtZmadAmUe+XXEr7XS5f+Ds2frEajC4I=;
        b=ks1Ob5U/UYsXV6oLB3FRyvSdSb8lpq9W03BzsZwJLH1LYedMFFEWLBK0Yf6+5NyWES
         ACq/08tbWs0maTV3mtZByq6iXn468LFidZLUZ6e3lQsoII4jE8U5y1j4M+olrTudtJ3a
         2c9bziRVJof9qHhirIw8ThkN4RQsWX3HhrhkDfQMXfKvCB/TK4VHspBux5aOQCNVk3mF
         CILkd5U46dfkjP/Uv0HDnOcrJPubdOkYWbqiyRwurnnMxYpFSA5Ron314ZJt8g23Rz3V
         TkPgzi3J8GzHryjt/OU+6bhE7vSNn+oaHGNnejrA88gTj5sg8cxND0eGnSjkOyeB+35s
         nfKQ==
X-Gm-Message-State: AOAM532Av4F8XYx09o4IW8MVRTPRrcYbuZ4nMtwk5yq9rZWmEyWFLzaD
        mhArMdHBXHAcJIe1lS6dxu7IOg==
X-Google-Smtp-Source: ABdhPJxYYFJA565Ah2IFbsorqtKthIYSeywb13B1yALFRrr4n+LvjBR6Ofv+FW/1z6RK1YCETQC0MQ==
X-Received: by 2002:a9d:1b70:: with SMTP id l103mr16249994otl.203.1618859939302;
        Mon, 19 Apr 2021 12:18:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w66sm2916867otb.69.2021.04.19.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:18:58 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:18:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 2/7] cpufreq: blacklist MSM8998 in cpufreq-dt-platdev
Message-ID: <20210419191856.GU1538589@yoga>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119174557.227318-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue 19 Jan 11:45 CST 2021, AngeloGioacchino Del Regno wrote:

> Add the MSM8998 to the blacklist since the CPU scaling is handled
> out of this.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although I presume this could be squashed with the previous patch...

Regards,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index f82f4ec17ff2..061de3031787 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -133,6 +133,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  
>  	{ .compatible = "qcom,apq8096", },
>  	{ .compatible = "qcom,msm8996", },
> +	{ .compatible = "qcom,msm8998", },
>  	{ .compatible = "qcom,qcs404", },
>  	{ .compatible = "qcom,sc7180", },
>  	{ .compatible = "qcom,sdm630", },
> -- 
> 2.30.0
> 
