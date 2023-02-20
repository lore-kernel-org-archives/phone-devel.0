Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB84C64EC4
	for <phone-devel@archiver.kernel.org>; Mon, 20 Feb 2023 12:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjBTM0n (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 20 Feb 2023 07:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjBTM0j (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 20 Feb 2023 07:26:39 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450E31BAD3
        for <phone-devel@vger.kernel.org>; Mon, 20 Feb 2023 04:25:53 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p18-20020a05600c359200b003dc57ea0dfeso888495wmq.0
        for <phone-devel@vger.kernel.org>; Mon, 20 Feb 2023 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
        b=bPba3qLwuP3pL5YFqhCwvExtNWIznWHdFR4XAXSWPf0VlwLp3X4gk+vhiYZBF3OCJB
         +4ozenOOlX3dJ/BMfSl1I7nbv+4Wwr8BGYHqFrEq6/zebScqZhGU7To/OG33/EIlPRT7
         M+9e/UeO0I0d2UIeOy+DsB19ih2wSBOe8cRr0z1lTPt5VdBO5JdBzoebAvZnImBSg23A
         yK4OMN0MfJlj0WW4lStMk5mkiowmWQnxJ7CXOZT7yMuChSPRjKzssAqWKgPqqP6loVUg
         zuJEUUlNrRfJDRKiIE8sEXk2EDL6lrTw+gRTiWg1S6zzPItFUW1sJ/tohDunfoSjrsL8
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
        b=2cSSmj/BhU0c2DQu4NTeZC25QpT0J5oHyfz9suSIWpPic6evbNlPOMWgjcvC7Vq9df
         1cAHj1gVCjkQ3l4Xg1vsoD3s4mG2Zsr3vt0u+MHXWKlrGSchjIofR1sjPsU8m97AMxEw
         tW7ufckmHhkAfDRsN3MoYZke8AfmBnUPk22niLzRmeQbwNvEQlG4mGyVNshK6VwPTyBy
         YSJIPjLrKnJGLVFBCiZZLiLaiEB3taR6kFF3FLhti5V829eVHnEVDY9xRQJHiuCf11vq
         JQQLkSamzx35iIkJYyxjrKPnyCvOAy8uXLOOQbOpz6BMiFk8ppTeI+EB0N1oU6/+cbEs
         +f+g==
X-Gm-Message-State: AO0yUKWDuNG1OjHA23j2toF15HvoQOHIskFoMewzJG7mjn7aUgbnjRIg
        oi39ztIVMu9KjKeRiDE3HMXaqw==
X-Google-Smtp-Source: AK7set8fM14qE0F61S6lht5sfkP3yhezdAmuiQBgst8exmUIwWFYJljR5sQgrg0d08gSACnwp/jIVA==
X-Received: by 2002:a05:600c:1d9c:b0:3df:9858:c032 with SMTP id p28-20020a05600c1d9c00b003df9858c032mr716208wms.7.1676895945499;
        Mon, 20 Feb 2023 04:25:45 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id e16-20020adfe390000000b002c54c8e70b1sm1542169wrm.9.2023.02.20.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:25:44 -0800 (PST)
Date:   Mon, 20 Feb 2023 12:25:42 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: qcom-wled: Add PMI8950 compatible
Message-ID: <Y/NmxjZgo9V6Enad@aspen.lan>
References: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Feb 06, 2023 at 08:58:30PM +0100, Luca Weiss wrote:
> PMI8950 contains WLED of version 4. Add support for it to the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> While adding dt-bindings and dts in a previous series I forgot to add the
> compatible to the driver. Fix that now.
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 527210e85795..5f504883aca5 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1731,6 +1731,7 @@ static int wled_remove(struct platform_device *pdev)
>
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20221226-msm8953-6-2-wled-5f966bfa4db3
>
> Best regards,
> --
> Luca Weiss <luca@z3ntu.xyz>
>
