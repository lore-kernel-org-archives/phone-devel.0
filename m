Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F73CC636D4
	for <phone-devel@archiver.kernel.org>; Thu, 16 Feb 2023 02:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjBPCXw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Feb 2023 21:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBPCXv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Feb 2023 21:23:51 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885B131E33
        for <phone-devel@vger.kernel.org>; Wed, 15 Feb 2023 18:23:50 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id v60so565311ybi.12
        for <phone-devel@vger.kernel.org>; Wed, 15 Feb 2023 18:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
        b=wlNPmA17KOY6pK6YSw5++8aMVTR+4h8QzLMUDAs/l/GgEN8eLFJjblVBAL4l+8UMVo
         VTNvpLOPQe0tCs8ZSBaPmCUh9VK2S35jr9LXhVu57g0MVbUxlVvoBO80fVRTxB/I/RIx
         +akHOGbDrVDLObPLO141W2tYDUHhJog0ukTM/eLTBFppp3LXIP16krE2YUTVKv6nVvB5
         DD3wYChintddtUpp8K+Y/2dZp6OviOiV3/Z2H0iulxFADBwcqMao8Um8A8dyZonyUOaN
         VjBCHyPX3eNae7TtWuiXWoU1BLix/mjHbA701x837guejw8xRKnxIaw7zAdnQbzpzTlX
         e+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
        b=4It9vSzpXQWAt81j1VhWSP/FmSv9Xmd19rspVv1IYxdnSK4cqfY+8tV6mA0sLKolk2
         OXkENzJnCeEVBf2VVntUf9JZFdgj9tiGNTBbKIunuMxP4XB6IR3XCeGHoDcRyTeFxiNp
         mhZ9d+4ECOqjKvVNqEkjhod3Si9MVZIXAfi9sEuzL3Bn5+4dJL4RvgjKQvCv92qNDtT0
         O6ufaFTjt6lvhINqST2iOZaJxZ+bVxWWAzGGDQWhC6Lzqgc2hkGpeuDIW89urtlQlQyB
         QQ0eF6QRnb2s4u0fmtxPKRfRN+VZGBxUQjwFP6XK66ljPjDDWj6Wuvj3NDAsVhL4PVmB
         ZJAA==
X-Gm-Message-State: AO0yUKXhExLgyM7wd7N2kIyRW7bJPun/Kd/iMcT7DRCApDUFfZXMrnq+
        Q9Ld8xBNhmhvMlXDJ3yofyTodZ4CoFLcQfK+N6UczA==
X-Google-Smtp-Source: AK7set+g5Iz6F+qTqpXxLN+bqfm0nIW/gdEpwcM8ofiNU5qAy9sZmhZSKBYet6qwAIKNsRoqh0H5TZPmCHA79wcHMxk=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr520370ybo.382.1676514229770; Wed, 15 Feb
 2023 18:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org> <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Feb 2023 04:23:38 +0200
Message-ID: <CAA8EJpr7v4waXaaahuMq3Ti18Gd-sg4HGSSof=yEX5kC7+CKnA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> This pointer callback is never used and should be removed.  The helper
> _dpu_hw_sspp_get_scaler3_ver function is retained as it is being used by
> dpu_hw_sspp_init which didn't itself compute _sspp_subblk_offset yet.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 6 ------
>  2 files changed, 1 insertion(+), 9 deletions(-)


-- 
With best wishes
Dmitry
