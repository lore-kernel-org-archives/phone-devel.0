Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DE5C388F9
	for <phone-devel@archiver.kernel.org>; Wed, 11 Nov 2020 04:56:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34E2921D91
	for <phone-devel@archiver.kernel.org>; Wed, 11 Nov 2020 04:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBI8CuLz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgKKE4c (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Nov 2020 23:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgKKE4a (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Nov 2020 23:56:30 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E03C0613D4
        for <phone-devel@vger.kernel.org>; Tue, 10 Nov 2020 20:56:30 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id j7so768121oie.12
        for <phone-devel@vger.kernel.org>; Tue, 10 Nov 2020 20:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cRAt4batTICDyiJ/8EINRniP/Smx50wMzUnQPTpJLC4=;
        b=uBI8CuLzxljYP3u+E78DkW3m3Rfy6G2IhHNK/5HfWTn5eePeEUQoBcbrb/e078wTW2
         6EhoCAzvv7vFr3n/UFqL9dIICXh8IwjE6dOAhzeyHQ68Y0lQHEIq49BU1QL+Z01xXGb0
         PkhcFdkS+ysJYAWoKi1BLDq8ctgdAGizX6tKYZN0doev6pPWfGEUMEqzhS6Wno4EemL3
         WGTF/wk1s9/qAHf3+Qnz0Fyg37I64BRCyRWtMp6juIYEg0Y30to+wWRkVfYJ8hYvSIah
         WqyZKj1VHMW+QaBRHTZSYhhZRS6kIodIDDs/PIby2Fv1P393mKmwGe1ushuTb/bKGPTy
         omFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cRAt4batTICDyiJ/8EINRniP/Smx50wMzUnQPTpJLC4=;
        b=Alz0qoRV3OhNHwxN2de+eObWoPeskZ6h+tNxQpMqlJgW1Elnl3twsgkHFIDLPVHJtA
         t6S7U0pSYmbuGGhTjj2xIRiBdsaX6N00gjTTx2EcPhDL1bbrtE0LNvELgr9rn6TuQP4C
         op9CZsX/ivMfpnCweqexBw9woIjG43Gzs8Lb9FWhunDeczeyeHOEJr9hYzDNRFLJMT05
         3Swx28RXxNBVdnrn/hjSw6pWaP4xuL9LXmB9ZnFDA5Ix0POAI06K6X6O2J/s3amwIECJ
         KyXKN8o/xEz9gt1SbBv6RXpKWL2/aN+fY41AcoCKZFgZmt0H/Fsa81R9JPXj6WxrDIdy
         ghbA==
X-Gm-Message-State: AOAM531v0Zq3QcBsM/t7ub3KW7fAeLNULX3+ppnXWAvmzTYNRLy7rZlJ
        A8+OHz8NXwSg0LIT5JwNz4M7nw==
X-Google-Smtp-Source: ABdhPJzWDF0IOu9gSQFJfDqj3LfmtrAjDRSYMXzJ5+OE3Zhn38zbdsFXQi+R41CdnEX4GzqTp4n3sA==
X-Received: by 2002:aca:c6cb:: with SMTP id w194mr1045129oif.27.1605070589680;
        Tue, 10 Nov 2020 20:56:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y15sm277264otq.79.2020.11.10.20.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:56:28 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:56:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/11] arm64: dts: qcom: Add support for Microsoft Lumia
 950 XL (Cityman)
Message-ID: <20201111045627.GF173948@builder.lan>
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-12-konradybcio@gmail.com>
 <CAMS8qEV3kFgCZ34GsOSoy19YceF9q=01JazQHknvxnVJg4thcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEV3kFgCZ34GsOSoy19YceF9q=01JazQHknvxnVJg4thcA@mail.gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 05 Oct 10:14 CDT 2020, Konrad Dybcio wrote:

> >+dtb-$(CONFIG_ARCH_QCOM)        += msm8994-msft-lumia-cityman.dts
> 
> I made a typo and instead of .dtb I wrote .dts here. Could that be
> fixed when applying so that I don't have to spam you guys with 11 more
> mails?
> 

Thanks for letting me know, I fixed this up and applied the series for
5.11.

Regards,
Bjorn
