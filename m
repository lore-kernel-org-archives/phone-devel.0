Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B6EC54EBD
	for <phone-devel@archiver.kernel.org>; Mon,  9 Jan 2023 23:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbjAIXoc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237979AbjAIXoO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Jan 2023 18:44:14 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB64C3FCA7
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 15:44:09 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id f21so6259448ljc.7
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 15:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
        b=v1wrZ2vN/XnH/5e/agAJ16tPNvEY3v5UQpgH5Myp1qx1T/tvSz7m8P7mZNZ7lXLfD0
         EpkGbcICZQkZsQ6g2RTtvYTPrKYaaMjD0x5LUliXvpSwXhtSdyg7YRUoet1/smn7hSa6
         yIkwgYhdC7QLiBvK3GMYHo6ArZe+pS697mGl7ohBaNWtoV8YakjJ93ISDemTmu29Q6rM
         tvMdADfb4ZOj3ollbJaPYObgJJxTeRuBWzqkCzZoAM8w+ZYM63Q4Dqa0nMNclVJ3OErA
         lpNOCuMww4d2efN+xd+3Dx3ZyAcMF41gNNIUkM4m0/dF/L3yjRiNwgQhCtFmvbfSCTqK
         DS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
        b=KdCVklVInXrh5C/W5HKTwKcawQqwXSBGOm/wOTs4cgEU0pPLZCR2ju9cNEPyQjhQgk
         nIu30mboXTwVIdbsizSHEZk2eSkwVdAmHrH6xsqfSZCqPWLW5mXfZL4lLp+q3jdRd7wn
         dClg4W9W9gqDoDHQebNR19K0Qr45XVTopI/4/1XZLA8VM6HmplkQp0rmJxjt198cZNld
         1bzTw/woCtIaf0Yw19q2IRn8JEG3ed2M02k4Olt+FHAtdLuyekkij43W0mUP68U7b5bp
         Ep4Leeb2S5kGNuqPtscWxlVv/g0v8+w5CawTBI00oNf1iIAPmRO4+s1oAnr0E2fhtdqz
         mJwA==
X-Gm-Message-State: AFqh2kqOSLz56jV6DihoSmQtUw8sypJSvvEBzQaZ49SA6xe7Q49P66wS
        +6/7G5WaF0ZfezkFYJkx9DbSxKxhYfhM0glJ
X-Google-Smtp-Source: AMrXdXuTSirBkKKX9cOHfeyvPTZYP1igXatg4QzFNBd3JOOm6VJi6sJ8f6PwONdphEmyG1wXADgO1g==
X-Received: by 2002:a2e:2c0d:0:b0:281:bb75:1863 with SMTP id s13-20020a2e2c0d000000b00281bb751863mr3348094ljs.0.1673307847937;
        Mon, 09 Jan 2023 15:44:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Print interrupt index in addition to the mask
Date:   Tue, 10 Jan 2023 01:43:52 +0200
Message-ID: <167330408782.609993.3753799611578677856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221121222456.437815-1-marijn.suijten@somainline.org>
References: <20221121222456.437815-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org
Message-ID: <20230109234352.lEJKEtZUoG2v-xezWgFCidAAGHTo23PjNF8DjYvrU1I@z>


On Mon, 21 Nov 2022 23:24:55 +0100, Marijn Suijten wrote:
> The mask only describes the `irq_idx % 32` part, making it generally
> impossible to deduce what interrupt is being enabled/disabled.  Since
> `debug/core_irq` in debugfs (and other prints) also include the full
> `DPU_IRQ_IDX()` value, print the same full value here for easier
> correlation instead of only adding the `irq_idx / 32` part.
> 
> Furthermore, make the dbgstr messages more consistent.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Print interrupt index in addition to the mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d45e5744ab39

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
