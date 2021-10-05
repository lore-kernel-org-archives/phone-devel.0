Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B3AC433F5
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 09:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2970B61526
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 09:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhJEJXe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 5 Oct 2021 05:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbhJEJXd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 5 Oct 2021 05:23:33 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645D8C061755
        for <phone-devel@vger.kernel.org>; Tue,  5 Oct 2021 02:21:43 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id r4-20020a7bc084000000b0030d6fc48bd2so1457089wmh.1
        for <phone-devel@vger.kernel.org>; Tue, 05 Oct 2021 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lGFS9XsVQotzeowyDH2izEVNspwu5x+TirGTi3ui9HI=;
        b=O8tiJpfTqnowxAvMtqY7WS9TmaOtEAhtl4qfB7Va3JldEy0GPega7a/ToJovzJAd6N
         tjkSuUatdlOoM9AgQje/T+WKupS/r/kHn+t+tSUs0hCpTYNvWt6XiIYSfp0ALiH15L1C
         BRd7UqfB4ZiJo9KpZN214o7bf2OKTFb3XZTr4BhxAEpd5HTPpnSq5GcChhdmgXYL2ONv
         IhyjMiMP6lezq+3n9OicrVWtk8YcDt5H4BWZ3uzlMOQfql0UqtBo1LTJghYDVbkaW2e0
         ykE7Vb4+F66WD6UfCBAGBetDaI2bhOdvf8fQChFLhcuOSA2v7na5oAJlB2FNg9FIVDM3
         9aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lGFS9XsVQotzeowyDH2izEVNspwu5x+TirGTi3ui9HI=;
        b=cumHk3rYBzt0FTei2RG6C94Ga2h7y0ii4o12f+/jlZzPx3Ov1usfiA63mj7+XHeHzS
         T1GmlOD3W/WSdJ3ITz2yL+RIrmMx09DBfLCvalYAyYarq4ORK/uPZ/KEfbSaOzngth39
         pDgMmRJw7/sUDWmJdbYuL2lK7lhHuAqJzxN2BQ4H6WDmu5nOZhw/Nf9e3WNOc/ZOV56l
         8AWYTDT8XDGeXiiFQ5xRltb9D9JrKLl/eDDParPb2+5b9aGPGGgpbx8B7txzjK+s1Y8l
         i7DCwTN9uNdXqrBRMo9IgvLJGcavd4j30vfUWIarAUCljxgYfwwzPe/nIWqISV57RyKT
         vP3A==
X-Gm-Message-State: AOAM531t8QA0jWhe5MB5XVjOK2MopGJHtua9oYfv43gouzZES9MsRckV
        vyEOpA79dcpDKdK215tVP/RWOA==
X-Google-Smtp-Source: ABdhPJzYlNZtJzu4a4d5vjX33BHvw1dWlUlpJZ+DmuUIXgBoBSyWnDXB4/LyXpO85m8x4okxnN417A==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr2235248wmc.59.1633425701986;
        Tue, 05 Oct 2021 02:21:41 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y23sm1303166wmi.16.2021.10.05.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:21:41 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:21:39 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] backlight: qcom-wled: Remove unnecessary double
 whitespace
Message-ID: <20211005092139.rnxmmaz6xsms2vjx@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-9-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-9-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Oct 04, 2021 at 09:27:39PM +0200, Marijn Suijten wrote:
> Remove redundant spaces inside for loop conditions.  No other double
> spaces were found that are not part of indentation with `[^\s]  `.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
