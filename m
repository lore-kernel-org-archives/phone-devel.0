Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCF8C433F5
	for <phone-devel@archiver.kernel.org>; Wed,  1 Dec 2021 03:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhLADxc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 30 Nov 2021 22:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhLADxc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 30 Nov 2021 22:53:32 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC8EC061746
        for <phone-devel@vger.kernel.org>; Tue, 30 Nov 2021 19:50:11 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id r18-20020a4a7252000000b002c5f52d1834so7405917ooe.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Nov 2021 19:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vh64HlEJjPzjJ+Mpfa13ShJlj+Z94ObsnHICCNTz+Qs=;
        b=lgIhSMrQStWm/xh3G3jIw9VllTe2uKgdqLWQywK8mPMN+TqFpMnWA8BVqxedCNZIp0
         tfQc8DXMlTjFF4Mh5ojJuwIVQesS4v57XTZM//Z39i1QChQU1Dsu1aGMXjBCicJXJm7B
         Jx4/Ht00O9olvh5hPGd/uv2678KjeqEYOfEFNoSpPbBvGMtvgOvM6aGOQuYBcokK1u1u
         INobD5negB4q1vdB3i4zUVAbOYa3ZkpJ3RDJYEwBZe4oXxE1moESg3Vr5ni+nfJVs1BR
         mGOXt2ti5p+WmIiRwXIuxwkmdNPwAXIIkZ1XJEYTm4BEMnYkCekrCuJHb57FTkGemFsW
         hiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vh64HlEJjPzjJ+Mpfa13ShJlj+Z94ObsnHICCNTz+Qs=;
        b=7mHLN25f6BY9GA5BhmyWzms0U/qA1gFtjseRSXIkNU3czWNTNSjnbfk5/gqUKoAFZD
         xQbAoLPZwo3bm4Ek9dhAWZfilFVAEsc3fO7AbX6J9bBRC1F1RfssuJsDAkaSs9hhIfZj
         Hb+E8eZyEoM2blwCghNHxAIkUDOifBvpwm+zXxygz+4TGmilGGdD0sir0cLdRV0ZBoOF
         5HudnKCNIrwcuB+HClva+VWHlGi7d3mCU6/G8wk5T7akI6kjPgE4yJ1KRUP8XJ5GIga0
         +wEgrvHTkOtdXObv7BH6sQxIG+biZEm2WvxnXaPXiEUHrddCyrQcdI3UqLW5AtmClNfJ
         FOtw==
X-Gm-Message-State: AOAM533++yisru5MjNPXkeN2mXw7olcOpp/mP7WUfPtoc06abbFCRTbP
        mEb8NhU9d46WgBuY/7Ou/gY2oCfWQsmDVQ==
X-Google-Smtp-Source: ABdhPJzH+r5KszynhMHork3TPK+4l/u0Mu1pjmCk4Dh4XaNoVyejeWYQu/mXe80D4FYluMpd7xN6VQ==
X-Received: by 2002:a4a:a641:: with SMTP id j1mr2714339oom.63.1638330611085;
        Tue, 30 Nov 2021 19:50:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x16sm3574994otq.47.2021.11.30.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 19:50:10 -0800 (PST)
Date:   Tue, 30 Nov 2021 21:50:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Populate additional
 devices from DT
Message-ID: <Yabw7kCsbhE1EFhW@builder.lan>
References: <20211129132930.6901-1-stephan@gerhold.net>
 <20211129132930.6901-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129132930.6901-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 29 Nov 07:29 CST 2021, Stephan Gerhold wrote:

> Some devices without own memory resources could be placed anywhere in the
> device tree but they logically belong to the modem remote processor. Make
> it possible to probe them when defined under the mpss device tree node
> by calling of_platform_populate().
> 

This seems reasonable, but other "child devices" of the remoteproc
follows the state of the remoteproc instance. So I'm worried that this
will create an inconsistency in that assumption.

> This can be used for BAM-DMUX for example, which provides the WWAN network
> interfaces on some older Qualcomm SoCs such as MSM8916 or MSM8974.
> 

Is there a technical reason for placing the BAM-DMUX within the modem
remoteproc node? Can we simply move it to / ?

Regards,
Bjorn

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 43ea8455546c..69f3d1ebf1f1 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1989,8 +1989,14 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_sysmon_subdev;
>  
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret)
> +		goto remove_rproc;
> +
>  	return 0;
>  
> +remove_rproc:
> +	rproc_del(rproc);
>  remove_sysmon_subdev:
>  	qcom_remove_sysmon_subdev(qproc->sysmon);
>  remove_subdevs:
> @@ -2010,6 +2016,7 @@ static int q6v5_remove(struct platform_device *pdev)
>  	struct q6v5 *qproc = platform_get_drvdata(pdev);
>  	struct rproc *rproc = qproc->rproc;
>  
> +	of_platform_depopulate(&pdev->dev);
>  	rproc_del(rproc);
>  
>  	qcom_q6v5_deinit(&qproc->q6v5);
> -- 
> 2.34.1
> 
