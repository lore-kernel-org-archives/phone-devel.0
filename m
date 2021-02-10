Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0670C433DB
	for <phone-devel@archiver.kernel.org>; Wed, 10 Feb 2021 05:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F31D64DFF
	for <phone-devel@archiver.kernel.org>; Wed, 10 Feb 2021 05:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhBJFOZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 Feb 2021 00:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBJFOY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 Feb 2021 00:14:24 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F86C061756
        for <phone-devel@vger.kernel.org>; Tue,  9 Feb 2021 21:13:43 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id z6so529229pfq.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Feb 2021 21:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pO3lkyqchaYYvHw0M6i1yFLd4JchiSimkLF+9OaaS4k=;
        b=PWZOvzgMLbj7RMzzT+oZtCfRn+XY/NWVebBDvtdZNCMZyjY01OJ0k7VTLbRJioC3w/
         9ikKTLQPZTQwJx2pzgU9qcNpllDN1LfJD9zgHhA9NauSL6CorGdiYVF8UbTXOFMyKsj4
         IWmjPbfirZQDe/e+HfNGHNIT1PNJNF1bTux/nm2sDxTyrhYMbiU/15kyyWvV5OlDn/8a
         Z2kZQoL398q9cwNuYRMHqO7u2j3Nyy14MMxpnVpIdNHqDIDnvrpNJsO0UxajEGREgTXv
         lrJWpAFuSwYL3qX6R7nTllwHORP++UZB/57sPHGyWycj/jT2wMqoFf60s31a9cKKiVpI
         N9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pO3lkyqchaYYvHw0M6i1yFLd4JchiSimkLF+9OaaS4k=;
        b=VojQckdZH399lHWt+qj4k5yjReIzuJgI2bHo4zEdcLbMySo7sh4JCrAMIUjMJhSl9g
         O+likoz6zefyCqP4ukuUIynQxXecn/4aEMgdsIQlsZp7YHMaOHDJ2P2vprtxkt2gh/7+
         n6dBgIcsWdB1HrQMajATeF1LwZ9YoHHvHmTW3Ou1f+MKxxyI0PUmhb3ngy36oX+HjYkG
         QMU5sxF2Yi69++9Tr2Gd/lnuvVD9CODJsXGGbjZ9CGwn81QKExEKVwEfYIFiA2myBSv2
         e93jPhqkYdzj70SYZ3sH2j+XP9vn7xxx3sV8PXezCFYz/PdoP2529J9fhYVohLgXKInA
         sd+w==
X-Gm-Message-State: AOAM532WCmYBPKAEFdtkTMwsFNRprrL+pL2OnOGrBNm0LEJj/7HXypTQ
        4Kcla5JBrjmQQM8kUEJLUKzMcQ==
X-Google-Smtp-Source: ABdhPJw5n3egOAVJeYZPlVVxWxFxfAnU6kKInAnwrHbcQbub2l1W2oW3U/73yADLfrLAiswp8pgHPg==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr1507445pgh.93.1612934023032;
        Tue, 09 Feb 2021 21:13:43 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id j9sm618424pjn.32.2021.02.09.21.13.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 21:13:41 -0800 (PST)
Date:   Wed, 10 Feb 2021 10:43:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org,
        rjw@rjwysocki.net, devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 5/7] cpufreq: qcom-hw: Implement CPRh aware OSM
 programming
Message-ID: <20210210051339.ixagw6gfipdzwgae@vireshk-i7>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-6-angelogioacchino.delregno@somainline.org>
 <c35bfd76-0d7e-d7bc-79ab-041b1074c1af@codeaurora.org>
 <YAh+9/IgRhI8M3ov@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAh+9/IgRhI8M3ov@builder.lan>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 20-01-21, 13:05, Bjorn Andersson wrote:
> On Wed 20 Jan 12:25 CST 2021, Taniya Das wrote:
> 
> > The CPUFREQ-HW driver is intended to be used only for CPUFREQ HW designs
> > where the firmware programs the look up tables.
> > 
> 
> It's obvious that this is the intended target for the current version of
> the driver, but what are your technical arguments for keeping it that
> way?
> 
> > Suggestion is to separate out the driver where the programming is managed by
> > high level OS.
> > 
> 
> Can you please elaborate on the benefits of this approach?
> 
> PS. Please don't top-post on LKML.

Taniya, Can you please respond back to this ? We are waiting for
merging this patchset..

Bjorn, can you or someone else please review this patch ?

-- 
viresh
