Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CAFC433B4
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 23:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61F2C61029
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 23:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhDSXX3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Apr 2021 19:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhDSXX2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Apr 2021 19:23:28 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0320C06138B
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 16:22:56 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id n140so37163060oig.9
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 16:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZL8naNYW6+lQXsNwg4wa0reXC9U90f82sYjKZ1TEVfg=;
        b=lTYqQB87lrkthc2zaFVsrnngpUwM/bE6ADojNZ8AnZ86bGhfIVaGCf5I+IB7K64wFm
         bEvBqBGiBa1vz5m5u2RXlWexGoz47jkdj8v6FPsMdx4RHsSMgKsLeOeKN6vC1Wt1Dv2A
         IT1iGKb/4Z4/1v4/5nOhb8bjOS/kuXGeY0ilKnMHxlIK2s9t6h2B2wYj916oeP3jIO+F
         RLUiTXq4xd3t1ytVVL1V8HEW66UQMejHOtoI76Al6gKbQB+JZZSpdhhPXRq9Nz4Hj8I/
         1ugfXXOlvdblQcxp68El6gutRL+DdYztw6ZKVklNT67lCxpUrskn6vK4yR5NQPgy9ufm
         ryHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZL8naNYW6+lQXsNwg4wa0reXC9U90f82sYjKZ1TEVfg=;
        b=glMyC8nf653myfQEMilEhh4S+foGhE1KZrSVzRE8C/bB4jZwLkgvK7FCFpd0kzN0ji
         RHgK40rgUfzl/iePafxjzeNijclxgi3+rSBX3wm3+9sFZabjhWWGfI3LOqK8AytTmpO8
         kxQ1VIyUTDYALMtr0WbIpXwmAOQXu0dDJjCJyJXeKNflmnFiGDxD19rcs2n3YoUKCmSa
         Emqj3Zv0AqoKsTj1UDrJI+QHQJJYBK8FhErb8vou/MRW5o13OM69LyEUXs19NvK3gAB9
         5ijN4ZqfunirRLvwQQKedQL3WNf+zIYdl3SJyU5JluiNdbP7a7zXuhiPOSZrih6ffn6e
         DEGA==
X-Gm-Message-State: AOAM530dqHTPrkdgdAwA3oWgK5spdPMNCLV8+X5xLkGwpUrdKpSI+i4p
        vnvFGU22ERC4yN3+ew7v5gLPgg==
X-Google-Smtp-Source: ABdhPJzJBZHzx45B2l5HoTJYouZf0YYV2op+G/HwUYciFdnEwwrICxLjS7ofpfvnLtqzJC619tgCYw==
X-Received: by 2002:aca:ed50:: with SMTP id l77mr1029626oih.13.1618874576101;
        Mon, 19 Apr 2021 16:22:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c12sm3134418oou.26.2021.04.19.16.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 16:22:55 -0700 (PDT)
Date:   Mon, 19 Apr 2021 18:22:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 5/7] cpufreq: qcom-hw: Implement CPRh aware OSM
 programming
Message-ID: <20210419232253.GW1538589@yoga>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-6-angelogioacchino.delregno@somainline.org>
 <20210419185203.GQ1538589@yoga>
 <e486d752-b99a-3479-b2ae-b37cdb3edd9a@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e486d752-b99a-3479-b2ae-b37cdb3edd9a@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 19 Apr 15:59 CDT 2021, AngeloGioacchino Del Regno wrote:

> Il 19/04/21 20:52, Bjorn Andersson ha scritto:
> > On Tue 19 Jan 11:45 CST 2021, AngeloGioacchino Del Regno wrote:
[..]
> > > +static int qcom_cpufreq_hw_acd_init(struct device *cpu_dev,
> > > +				    struct cpufreq_policy *policy,
> > > +				    int index)
> > > +{
[..]
> > > +	acd_resname = kasprintf(GFP_KERNEL, "osm-acd%d", index);
> > 
> > How about just sprintf() into a 10 byte array on the stack?
> > 
> 
> My motto, apart the clearly possible chance to get 1000 clusters in the
> future (lol), is to free the (very little) memory as soon as I'm done with
> it.
> 
> Was I too much paranoid there again? :)))
> 

Feel free to waste a couple of extra bytes in that array then ;)

[..]
> > >   static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
[..]
> > > +		/*
> > > +		 * If the power domain device is not registered yet, then
> > > +		 * defer probing this driver until that is available.
> > > +		 */
> > > +		pd_dev = of_find_device_by_node(pd_node);
> > > +		if (!pd_dev || !pd_dev->dev.driver ||
> > > +		    !device_is_bound(&pd_dev->dev))
> > > +			return -EPROBE_DEFER;
> > 
> > I wonder if there's a more appropriate way to probe defer on resources
> > described in the CPU nodes...
> > 
> 
> I was wondering the same. I had nightmares about this one.
> If there's any better way... please, let me know!
> 

Let's see if Viresh has any good suggestions, otherwise let's stick with
this for now.

> 
> P.S.: There is a v5 of this (and CPR3) set(s) that I had sent immediately
> after this v4, back in January, addressing the big abuse of the OPP API that
> is present in the v4 (this) version of the driver.
> 

May I ask for you to incorporate the changes I pointed out here and post
a v6 instead of me re-reviewing v5? I'll make sure to prioritize the
next round.

Thanks,
Bjorn
