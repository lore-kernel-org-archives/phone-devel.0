Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABD9C433B4
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 844236108B
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239908AbhDSTHY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Apr 2021 15:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239604AbhDSTHX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Apr 2021 15:07:23 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A10C06138A
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:06:53 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso31678716otb.13
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nS6lVdjAQFuFmi8OcV/NWRT3J31GQHJ6x1DbiIVFs9c=;
        b=BPS3XGyjmuDU202kT6j+i4GUG7bH0/UX6id7ANkMV4j6krFsStfFOmpSp1GowHtFqs
         e+bUAwvY3QxQO1YyLyH69dbyH3NyOXU3oJ+GMp6XG8jvwXdEkmOnrCXZ5jMU9TVDhovZ
         aE1yuktnSwTYK06qRFKjU5MQ6mLf0UO420Q7FASQEjvUNPtQ/uHChVwio8CoM+EolYX7
         fkkhhel/1cjHRpx8+jDLmsU0+5YNsad5K05glfAL9ZQisVQF9qiJSFMW8nv1F1mUohLT
         nc9nsFQjMdgDVRHNURGoBPaMlmkTRKiVAv8rz8heuq/d6zwIDVHb/DDTl/ZfCER06ZJV
         X2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nS6lVdjAQFuFmi8OcV/NWRT3J31GQHJ6x1DbiIVFs9c=;
        b=SdPRdtQd98LjeEPDuv8imNZdF06nfk4VSSxmyOqItp8eRdqEp3oHaSGkJxHoqhd6Wt
         cce0lXuxCO+Sjb/5j9ntl++s/KPRws6150EFN/Gue+2cM9ErY37RB3cAZB8OsfbqR2Wy
         F9wI8N/LHiwpWbQSLx4h2n/cwg9fuvwY1lSsxinT4Gm02O0rUgTA/Jk0aD7bHuo9UwjC
         E0KpMlMh0cbdE4aW6D50eOLnpGJxetCLsLb7gweQC6KGH5zMtkiMbTvDo+7PsRKg1ZV6
         28KkFnfYF9h7Lc+mQ4+kCcxD8xfRULv7EijTmSQWF98z1g4rAjcAIFOpwkVNllH6Vuuo
         mNzQ==
X-Gm-Message-State: AOAM531fcTskBTSB7Yp54GJB7E0SJP+Briq4cxuP+m8RMgvpFnJkbfyk
        No1WHJDJSj2jjt3fK+AIIm6DNQ==
X-Google-Smtp-Source: ABdhPJxLe1/3CzYqXXwB0vxZ7+8+NQMslhHXoPfV20wEMFYc4HCiSCuaa98SjiWVXIrgij/eVTVZZg==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr15759494otf.115.1618859212509;
        Mon, 19 Apr 2021 12:06:52 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h81sm1642638oif.53.2021.04.19.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:06:51 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:06:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org,
        rjw@rjwysocki.net, devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 5/7] cpufreq: qcom-hw: Implement CPRh aware OSM
 programming
Message-ID: <20210419190649.GR1538589@yoga>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-6-angelogioacchino.delregno@somainline.org>
 <c35bfd76-0d7e-d7bc-79ab-041b1074c1af@codeaurora.org>
 <YAh+9/IgRhI8M3ov@builder.lan>
 <92e465e4-a0d9-43eb-84f7-69fa355097a9@codeaurora.org>
 <20210413034940.o6uzjtnh2ylvikbf@vireshk-i7>
 <150e19b9-9ecf-7cac-8aa3-c7c4d7a11468@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150e19b9-9ecf-7cac-8aa3-c7c4d7a11468@codeaurora.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed 14 Apr 20:31 CDT 2021, Taniya Das wrote:

> 
> On 4/13/2021 9:19 AM, Viresh Kumar wrote:
> > On 12-04-21, 15:01, Taniya Das wrote:
> > > Technically the HW we are trying to program here differs in terms of
> > > clocking, the LUT definitions and many more. It will definitely make
> > > debugging much more troublesome if we try to accommodate multiple versions of
> > > CPUFREQ-HW in the same code.
> > > 
> > > Thus to keep it simple, easy to read, debug, the suggestion is to keep it
> > > with "v1" tag as the OSM version we are trying to put here is from OSM1.0.
> > 
> > That is a valid point and is always a case with so many drivers. What
> > I am concerned about is how much code is common across versions, if it
> > is 5-70%, or more, then we should definitely share, arrange to have
> > callbacks or ops per version and call them in a generic fashion instead
> > of writing a new driver. This is what's done across
> > drivers/frameworks, etc.
> > 
> 
> The code sharing here between versions should be very minimal as most
> portion of the code here in V1 would focus on programming to prepare the LUT
> to be further read by the driver, the programming in itself is huge for v1.
> I am okay if you move the v1 in a different file and invoke based on
> version.
> 

The initialization of the hardware certainly is a large chunk of code,
but once initialized it's the same driver. Your argument that this new
code makes it harder to debug things doesn't seem relevant, as the old
support doesn't seem to affect the code paths used on the modern
version.

Creating a new driver and picking it by compatible is certainly possible
to do, but looking at Angelo's patch it seems like it would contain 100%
of what's in qcom-cpufreq-hw today.

As such, I like the approach suggested in this series.

Regards,
Bjorn
