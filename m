Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9326C4708E
	for <phone-devel@archiver.kernel.org>; Sun,  1 Jan 2023 12:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAAM1m (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Jan 2023 07:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjAAM1k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Jan 2023 07:27:40 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59133897
        for <phone-devel@vger.kernel.org>; Sun,  1 Jan 2023 04:27:38 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-47fc4e98550so217070527b3.13
        for <phone-devel@vger.kernel.org>; Sun, 01 Jan 2023 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
        b=TluG41Rwc+6pjqk30yxZybimGt7+O6R3MyNiv699OFH83tN10SaLOwYpWTdQ7AWgLS
         EATAkvwk3w+1SThVegNvSV1VPnkjnECmkS4ahcCnfTvIP8QfBYgW/Ia4ZRcA6Bqv8egE
         PEJfcqX/UDVfBl9JyJiUN+7IiIVLZ+0hZDrgq4AdDU7rpmY94WjS4m8euscKNFlEGgwb
         yRfJycNDBK+sRp2RfjN9aPZRGiGGDq2Ni3wozwXNsuEkagQreBC1nRdZINZhht5wa4eO
         P+NCQXiQY5BeMy5+j/LZjh8NCzOcUL0XR8c+V4980ORW0CQYlAqusTFgTJ7lqlgKlt9f
         XJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
        b=BQ2nlV10vCixjzsk0Z81GLHgTsHprVD1gtWDshzsbGVh8ap40ghlRqc7qxH0hoKOaU
         Zloym9Nj1WEIeFYH8y5oPmFy5SfMsbmeW4SmD4zgQG5cdwyoQtyIBfPTWIbFC5UsPIzN
         D58Y10SBoyDY9W8A4vAylETZbldva20Hw73zLFdAmNwTpx+GLWomyWBM80ZNK0KvPgZ5
         WuphklPGZKNoilPoQlPE7YfRCR4K5YhESkq9lQoty/nOtP5Z8p/79CX+vgrW0l+0/892
         M8BchT1iZ4DRkRxjHcWaai6vA5JJWJhikjpfzODlZZ3Fu6p2/DKNIRR7AUi3461AzSKp
         zAKA==
X-Gm-Message-State: AFqh2kqiiEpXVlWCVC08XGGefs4gjKOlGsjS+hhfu42cYvWyHaO2wTmo
        K55CoFq/ApRtGEAP+Hi5wg7GvKUnrQQEcMtiXRru3w==
X-Google-Smtp-Source: AMrXdXvMw65HDtWFdqX2AnBda4/ddwCGwlF1XJLicIXoOn/3Sx6jOAd2wcSVV/Qr+2ien1/O22ItMviPcZfEztg61OQ=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr210838ywb.378.1672576057902; Sun, 01
 Jan 2023 04:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20221231215006.211860-1-marijn.suijten@somainline.org> <20221231215006.211860-8-marijn.suijten@somainline.org>
In-Reply-To: <20221231215006.211860-8-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 1 Jan 2023 14:27:27 +0200
Message-ID: <CAA8EJpraCLQpWn3PZLz9BGYrESVdWmHw0LpNtcx9ntQ_9=HgRg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
 pingpong config
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, 31 Dec 2022 at 23:50, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Now that newer DPU platforms use a readpointer-done interrupt on the
> INTF block, stop providing the unused interrupt on the PINGPONG block.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
