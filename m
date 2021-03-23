Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89196C433DB
	for <phone-devel@archiver.kernel.org>; Tue, 23 Mar 2021 09:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AECA619BF
	for <phone-devel@archiver.kernel.org>; Tue, 23 Mar 2021 09:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhCWJky (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 23 Mar 2021 05:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhCWJkr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 23 Mar 2021 05:40:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9407FC061756
        for <phone-devel@vger.kernel.org>; Tue, 23 Mar 2021 02:40:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id w3so25972989ejc.4
        for <phone-devel@vger.kernel.org>; Tue, 23 Mar 2021 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
        b=vj5G9pjhGIJnSvkO3MxGjzGfY8QUgcgIr8he+j8CuGbyyEfP5EQNfrmrCqoMO2CZZR
         bdckdLSvsCoLrRu48EzAHYo4oxQAXRsUdNra/JouZ1qUvhf0uMbOSV9a8F/maOBLtAGe
         RV8MmfA3GtVVlaVinDJ3S/lzsL0qE8O+YupeIpqcYG0BGXJHE1Cmp6/9QWlQ43zL/NC1
         yqNdlWiaSh5Wv3ibiPp3WlVe3b07LVjSxW+cyyrOQWmSgGZNcN5r0izAQP2icBVact0v
         03lDSR3Wp+6bfpj+WhlvsvC7QM5dX/IjE1uKpWf59cRSsmbH828i6f8T/ahuVCQ1UXlk
         uGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
        b=Pm8t/UsEoumzEV7ksx4tACbDppf0ZITMcJCOw3MjtQOqyB0DBx2E3tKXtY1nJhSqhU
         5BeYozqOOKTQj4w7n2LY4Icy/+0V6YW3qSIvtRsYdumXh/VmG0AOEAT9XRm9apn49LrU
         z7aAzUdw6st948CGju+wU/VOHZNPuZD+6t3wFF+XreSeRPiHFGdQVYSq6kIioEJK/HvF
         aE6BFJzVIHdw1rGTZ0/MpkRBqd6K9sS3mMFWd+69EuQ1SmpVE0XyweMFIXxCQZm8OXQ0
         KS0Pp2v0q8VP0yKQc5X8hUAuLmSLISj2eGpy5kSBPoFqgHn2Ap4LNq92xum761EvAo+1
         iu7A==
X-Gm-Message-State: AOAM530/X3P/IRuRJS3/csGtUZtJWNi6OeOmDXwWe8PAZVDe/i7DJ7fD
        jzj0hAltXazHc7MDpA7y9n0Fvg==
X-Google-Smtp-Source: ABdhPJwpBn5eyAJHqJLdU0Wab+Ro1IIWRDZ1hGuA1iPJeA/Fp0ww4Ebsg8Pw9LsY5dn4holDmh/FWw==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr4111539ejo.140.1616492445327;
        Tue, 23 Mar 2021 02:40:45 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id 90sm12948482edf.31.2021.03.23.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 02:40:44 -0700 (PDT)
Date:   Tue, 23 Mar 2021 09:40:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V5 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210323094041.GT2916463@dell>
References: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
 <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 18 Mar 2021, Kiran Gunda wrote:

> As per the current implementation, after FSC (Full Scale Current)
> and brightness update the sync bits are set-then-cleared.
> But, the FSC and brightness sync takes place when the sync bits are
> set (e.g. on a rising edge). So the hardware team recommends a
> clear-then-set approach in order to guarantee such a transition
> regardless of the previous register state.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
