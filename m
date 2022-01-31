Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8874DC433F5
	for <phone-devel@archiver.kernel.org>; Mon, 31 Jan 2022 23:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiAaXuw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Jan 2022 18:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiAaXuv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Jan 2022 18:50:51 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0708CC06173B
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 15:50:50 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id y23so29912588oia.13
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 15:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gTAeI8IjixWxxmk/O216bYEztBap5QYeV09m70/fKjM=;
        b=ElGx/wzWu026fb4wDsiYfNF9RiRignkWNApNUAEldJKoSTjD/d+mCimkgmAYiLftGk
         KMY3pGK80krPmrx0DAE5i93Nq08ARGHTyArvx+C4f8W+agwbKpFJGe4dLwOTyaJUCKMd
         lgm0j430yMEy3jV0+HficY5b3Ng02gs5tXhNrtsWpdrw2biwShY8SPA+BlSj+zxQdW3m
         5cCIqWVzWrEtDO88INIx1A0/94jn0znqFMbhZ/E3rLEN+R7VvUX77REM/mNs75FNO3xT
         zKPcEx/gZPcQwHdRsJF9q9TFT41n5iwZKEb62rCKo7/Jg+ck+IhncJzGjlwt+xKttG/p
         fk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gTAeI8IjixWxxmk/O216bYEztBap5QYeV09m70/fKjM=;
        b=1Vc4y8Nl2ACSS2IZi5PUItLRtAC5d/ecZ1BDLmLZ08pILKMYhPux0dcnAVSvftUrbE
         K+BJt0IrFLdL3sEHvidA2Z2qMEb0dGR9mlk1khVjHhXvefL8dEaVJ8v/aJzwM8Pp/RVE
         7BwJM5Vf445IVu2W6r0GT7rHibCvY4WDza6hpDve+4VU/nFdHvt0qiFDYAFXpo91s5Je
         pFCQVY5COyOLk6pNP25CLq4dKtJt+AVp0PujHdl3lTHhJ7GvErPjj2ull0gtlmgACLjT
         arMGlBFOIw+e/tca0j0j5towZQvX9DRmDdorezlirlEknqyTbI7pAoRfT+PtoN+N2Pk1
         teEQ==
X-Gm-Message-State: AOAM533IgVh8cQVy9ddfEjYDHfT1WT0k2SMKf555sGAnuQ4DHwh3DIig
        7nq5PP3xUkMKGvxBV0fmQqoUhg==
X-Google-Smtp-Source: ABdhPJw3YE39Hle0GY939lffQTmXSEsDz7BM1tfX3kk97cLz9YGcmQHsTJtQWzRLkO8F7ZC6DIvS/g==
X-Received: by 2002:a05:6808:229f:: with SMTP id bo31mr14171210oib.107.1643673049898;
        Mon, 31 Jan 2022 15:50:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id w20sm6033506ooe.3.2022.01.31.15.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 15:50:49 -0800 (PST)
Date:   Mon, 31 Jan 2022 17:50:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rayyan Ansari <rayyan@ansari.sh>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: spmi-mpp: Add PM8226 compatible
Message-ID: <Yfh116roOPZL4kV5@builder.lan>
References: <20220124171538.18088-1-rayyan@ansari.sh>
 <20220124171538.18088-2-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124171538.18088-2-rayyan@ansari.sh>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 24 Jan 11:15 CST 2022, Rayyan Ansari wrote:

> The PM8226 provides 8 MPPs.
> Add a compatible to support them.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index b80723928b7e..6937157f50b3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -961,6 +961,7 @@ static int pmic_mpp_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id pmic_mpp_of_match[] = {
>  	{ .compatible = "qcom,pm8019-mpp", .data = (void *) 6 },
> +	{ .compatible = "qcom,pm8226-mpp", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
>  	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
>  	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
> -- 
> 2.34.1
> 
