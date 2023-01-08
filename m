Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5137BC54EBD
	for <phone-devel@archiver.kernel.org>; Sun,  8 Jan 2023 23:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbjAHX26 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 8 Jan 2023 18:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjAHX24 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 8 Jan 2023 18:28:56 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3E710051
        for <phone-devel@vger.kernel.org>; Sun,  8 Jan 2023 15:28:55 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d30so5575893lfv.8
        for <phone-devel@vger.kernel.org>; Sun, 08 Jan 2023 15:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIsq8NVVyedclvJ2/XWOxpWQLEh8o3CbTJXgORDdywU=;
        b=oNJ3x8eV3NMgIDcVKEpJn+tM/5y4L8vG+py1oFoBD/TCen0sZKz6Dh4UqSlhcrvZnI
         AdqnYfz1hdZjFDg/tV1P+7sYXKYgddGHPZi1iLszLThZ7vZY9pCHVds2dGC9em23ZOhB
         4kqZN9hg6War5MxUkQoWXQGATUl8+LjCc/HWMlzqZcB27wHSKA7g9SVbprpD2oGHrGnc
         JbJ1mWZl7HxvhWGH8Wpw/J8O9nAcr5IKkGA2DE8tMaNEurPJojwknIKMlv2mflnkmuJ5
         EFZoPW0aVvvHWQxi9ZBBsVCHiue+lejyv3f5EaEiUr8AXEJwR+NlRjHm6g19eTCelUzG
         khLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIsq8NVVyedclvJ2/XWOxpWQLEh8o3CbTJXgORDdywU=;
        b=AFpzThW8zlubiG8U6GMLC+r6IGVQT+VI2fXRGuH+NSQaCNebzGWkbVVw59cqGclTsb
         9bIsQkdxWvKY454BESpnQE+PJ7IwtadJX6VG6zbjxoUutNh+yP6ad+92JIow/3RO2BEh
         ZSwg9pmJa/orvO+qG7zmRGkgLOPYtaHtXFfBZS3BS54VZFH9cYaeXa1NdQ8CBCMt26Ji
         Cj+/7IXCEVpLblBJIlLVnHZGWTdEvF67yObruVeeuEYAZhy0B62ut57gTPt0xKiFSW/M
         Yx+RHitUHxI6YMn37EzUHfsKNH8hFtd6TX7cZKbB2hnZqTIL0jnq3viD76KqL1pD70Rb
         EcKg==
X-Gm-Message-State: AFqh2kqv5nNE9SiyvOTL1UqEcYN173nRufSt6TPfFXlKS4MfDq/c81ys
        //Q/Qr8lBhAWR28oYmMueGd9cg==
X-Google-Smtp-Source: AMrXdXuOoCHYc+VVKADDEPthewwQ51Jiw3IvFSdxn1f7+OqFWy4jlL3F7bHh4J2Svmrhl0gnwdckGw==
X-Received: by 2002:a05:6512:1597:b0:4b6:f4bb:e53f with SMTP id bp23-20020a056512159700b004b6f4bbe53fmr19491215lfb.60.1673220533735;
        Sun, 08 Jan 2023 15:28:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o14-20020ac2494e000000b004cc6ce1de69sm1277890lfi.42.2023.01.08.15.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:28:53 -0800 (PST)
Message-ID: <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
Date:   Mon, 9 Jan 2023 01:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Drew Davenport <ddavenport@chromium.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/12/2022 01:19, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks) remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> To prevent this from happening, where null-pointer dereferences
> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> increase past NULL blocks and will print an error and break instead.
> After all, max_blks represents the static size of the maximum number of
> blocks whereas the actual amount varies per platform.
> 
> ^1: which can happen after a git rebase ended up moving additions to
> _dpu_cfg to a different struct which has the same patch context.
> 
> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

I think the patch is not fully correct. Please check resource 
availability during allocation. I wouldn't expect an error from 
get_assigned_resources because of resource exhaustion.

-- 
With best wishes
Dmitry

