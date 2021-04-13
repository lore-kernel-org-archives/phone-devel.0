Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908C4C433ED
	for <phone-devel@archiver.kernel.org>; Tue, 13 Apr 2021 03:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6637C613AB
	for <phone-devel@archiver.kernel.org>; Tue, 13 Apr 2021 03:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242888AbhDMDuF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 12 Apr 2021 23:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242844AbhDMDuF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 12 Apr 2021 23:50:05 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A575C061574
        for <phone-devel@vger.kernel.org>; Mon, 12 Apr 2021 20:49:46 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so10005530pjh.1
        for <phone-devel@vger.kernel.org>; Mon, 12 Apr 2021 20:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7V/tdtEdLmPbli0XX3xvnQgDstg+AJLvmbmneYvsBWU=;
        b=t858tdoVNzFP1kDBf4lMQUIkLNizXIXUDFhEgAhjSyXCGdr2aCq8xfWuFEZo/tspg0
         1Qk1bZaGWKdZT1FtS5vHh+dH61Oi9cvU3Z7pnkGxAN/ha96OqYvn5ZqDJDmsqiDERNY0
         UX8C3SOEBe+MQcBDsSXvKek/DL6i1/+FQ6cua+wmP9/194MT5aTvER6KYUcwwS1xSJue
         YRUwAtmW2xkuklr5PNw0bz7m5xFkW/AvEM5uXZ6q6UsVvDqH4PVEXKNjN0DtCJq2uaso
         ZQsdG8kEjIbXPE65AnCZCaaTCQMTG+aC0ywdJnw3VDksP5c65O2a8M4QZAzlzZ+mJUdr
         zLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7V/tdtEdLmPbli0XX3xvnQgDstg+AJLvmbmneYvsBWU=;
        b=YA/Fl+Np/0w/5Jeq0ssWN115IYpCalImO2vwkiO98+B0yZ3GgCxYBB7RdzsIrsOfNa
         0kyDJz+QQm26Gz+/9DqV9BTMpIS0W17+3f+H0cvUslrXy1HKJfgU/Can8zcDkL0sA9Va
         p9bNCeH7HrzDIvzqHQrccA5ly/P3tbXtSE7jE9tmd9rE1RyabZD1anY6fALEJBD2qt4j
         su7TcxKhhZ+faVTeCQHQIDWEKiHAjcmrAaZxiUQGE6WaSpXD+uOJ83lKJulrN44YIQUy
         dvBzNJ+kFoMj4MWvkWbQH4Pz/5y0wwq8blJT1GfSuhyURLz7Hqx2LY1zqfYHCw1tI/+q
         /AwA==
X-Gm-Message-State: AOAM533cn/qBq5INWdcq1ILccsGPmPc8cCNcjox6XvadezYd6ERzom5y
        k8ZJHxAlh0VTzxFB5l/NXnLteA==
X-Google-Smtp-Source: ABdhPJyasaQefVvJxnooEX1daBU7hrPpJeHb3Itbhq3BEDv4YtIV6jC+aqW5Nb7VmO0a/WuAonXXTQ==
X-Received: by 2002:a17:90a:e293:: with SMTP id d19mr2699465pjz.118.1618285785686;
        Mon, 12 Apr 2021 20:49:45 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id b2sm7605897pfo.110.2021.04.12.20.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:49:45 -0700 (PDT)
Date:   Tue, 13 Apr 2021 09:19:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org,
        rjw@rjwysocki.net, devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 5/7] cpufreq: qcom-hw: Implement CPRh aware OSM
 programming
Message-ID: <20210413034940.o6uzjtnh2ylvikbf@vireshk-i7>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-6-angelogioacchino.delregno@somainline.org>
 <c35bfd76-0d7e-d7bc-79ab-041b1074c1af@codeaurora.org>
 <YAh+9/IgRhI8M3ov@builder.lan>
 <92e465e4-a0d9-43eb-84f7-69fa355097a9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92e465e4-a0d9-43eb-84f7-69fa355097a9@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12-04-21, 15:01, Taniya Das wrote:
> Technically the HW we are trying to program here differs in terms of
> clocking, the LUT definitions and many more. It will definitely make
> debugging much more troublesome if we try to accomodate multiple versions of
> CPUFREQ-HW in the same code.
> 
> Thus to keep it simple, easy to read, debug, the suggestion is to keep it
> with "v1" tag as the OSM version we are trying to put here is from OSM1.0.

That is a valid point and is always a case with so many drivers. What
I am concerned about is how much code is common across versions, if it
is 5-70%, or more, then we should definitely share, arrange to have
callbacks or ops per version and call them in a generic fashion instead
of writing a new driver. This is what's done across
drivers/frameworks, etc.

-- 
viresh
