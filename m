Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7027C4332F
	for <phone-devel@archiver.kernel.org>; Sun,  9 Oct 2022 18:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiJISyH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 9 Oct 2022 14:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiJISyE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 9 Oct 2022 14:54:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C03D2D75D
        for <phone-devel@vger.kernel.org>; Sun,  9 Oct 2022 11:53:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id b2so13834332lfp.6
        for <phone-devel@vger.kernel.org>; Sun, 09 Oct 2022 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WCwiylqT6GqGn/jQAt5LTbt6Cb7+upuDOK5iWkS3jg=;
        b=Dr+PFWXcabmj8/2V1PzeN71F1E4EPjMkeUYtJFnsQHESjhxU3KvTPrTuD94jE3KuEI
         HiH+VvgGX+AZouib+u2vnBtJPxCnsaOoek4wTSf4WiVuoIDSdiIA6tjvk36Ir3j3EZz0
         Wrt7FkofRlb04ZybpjzJr3tgF0IbwbzAo8AEU9XUwFne2jBratY7GZFno7MRr7b3fwfa
         0LC8kgDS4PyNnt/+1IOKXqHF4+zge3mmnBwJxbtSGREvuy4ac7hthsC70aGmmz3y43Do
         rPyOkNf4kurOLLC+jTJhExl9ANmUWgaSa123RRnFoAr5AgRSiWaaxZpNaN2AA6YL84Fy
         ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WCwiylqT6GqGn/jQAt5LTbt6Cb7+upuDOK5iWkS3jg=;
        b=CLXYd+kyAufoFr94y+o30z9kdUlnu7LRZhJRvi8xftMx/Xtz3eE7V+3EMN6lSitWe9
         n98tvv0cT5QXqUCqiP5Rm5L4VXL0EpIaHPyds7JW6fZ1YwlZz+lppUrrWopba3HxPqAI
         jY299xA0fBaYJXuWTgfXveF4TKid1LTvUWzgKkCnD3DuV6yOfRxpB5iqBjs1CX7owNvx
         7TXnc9fNWRJVnAoikqbIQu3zvlaPFjIGzH8IKQDCtKaXbhQG3iy/UFhUeZx2skhev8o0
         d3wmDCPlb6EBWtev7iMZTYi0g6rLVffuglRfGv4CjWIcoFqHd3bRBkX6y9nrX2SArd54
         4mBA==
X-Gm-Message-State: ACrzQf1tO402AxOG6zkj68LrwpI+PyZDA0Jy3S4BOpVntKOTWn9+sIbT
        kZKwo0OqAGi9XdPpwPfnLMDQ5w==
X-Google-Smtp-Source: AMsMyM49x3SFTxuNraxtl+xaUGhpszx7zJd4wy4vtk748DI0fbZBp5t1rl3xL96NhqsqzF3BC4RKcQ==
X-Received: by 2002:ac2:5e79:0:b0:4a2:3eeb:a7cb with SMTP id a25-20020ac25e79000000b004a23eeba7cbmr4704971lfr.263.1665341634743;
        Sun, 09 Oct 2022 11:53:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b0026dfe55be7fsm1306222ljk.63.2022.10.09.11.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 11:53:54 -0700 (PDT)
Message-ID: <8fdeeefb-8410-98cb-0c2b-60a580fd0e36@linaro.org>
Date:   Sun, 9 Oct 2022 21:53:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 03/10] drm/msm/dsi: Use DIV_ROUND_UP instead of
 conditional increment on modulo
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
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-4-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/10/2022 21:48, Marijn Suijten wrote:
> This exact same math is used to compute bytes_in_slice above in
> dsi_update_dsc_timing(), also used to fill slice_chunk_size.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

