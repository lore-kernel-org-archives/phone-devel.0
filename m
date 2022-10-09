Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A6C433F5
	for <phone-devel@archiver.kernel.org>; Sun,  9 Oct 2022 18:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiJIS53 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 9 Oct 2022 14:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiJIS53 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 9 Oct 2022 14:57:29 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E431DF0E
        for <phone-devel@vger.kernel.org>; Sun,  9 Oct 2022 11:57:25 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p5so11081674ljc.13
        for <phone-devel@vger.kernel.org>; Sun, 09 Oct 2022 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDDeNedlMFreEkFqdCoxqyamH5eFrq2g19d8reIB7Ls=;
        b=WeThPWRXkwpZfJsWoWGSVb4uWG4PHezAIA37BaqNXSNIVx1dbJNzDf2VsdmdR+8HqF
         f6cRHKZoEjwZtxzNyXnM0ke1R9FfMvLXyrn3xXpKN4fWgINYQPNuDnqDH2IqWPDLR+8y
         XHoBNraba3Od7sWAq3DB3FXN3RmmTGXZcPnR6J8vv3tgC4Z+D4No6vUU5cQ6b10uHq4e
         MI8qejIcGDMT8YWYpfl3K+bAEt3HWch5vnJYWXMKTtoiIcRtE7AqaurW8rI87tZVeZPs
         D75m4rqncv1XQdFmXIcFQ4nLrY2nn+98c4j7bSvTuGFTTRu3sLzAcPmgl/gYq+IUWtHj
         iUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDDeNedlMFreEkFqdCoxqyamH5eFrq2g19d8reIB7Ls=;
        b=F2/nJWiI7UILCRXEq4t9oLLqhhwi5oHpGZ9C0vcOs76phic3yyq+3ipnsz+qPzK+4C
         PgWOhQEGB1i3w5LCxNxct1H+B/ZYBgyIMnt8+YA3ummeTbEfiy+1Tpek1gQusfeCwPLA
         v1vIiq+6+vZUwjVmtvhEijRALKHKJ20XrWQC4A6UhO419E7B+WNNCzhrqbd/JE81DmF5
         NG5jkLLHqgvYCY9rSk4jxnafzrnJivlzBPmwhWZfdXMpIvPoSQioFDz7D9W2aHTaNfhF
         gRQUv7/JvYabQahfwKs6t1CnHPMb6uOGEcaLKZ8vrHNf2n1kAgqHV7gl1mnUPTTT6t0Q
         +MGw==
X-Gm-Message-State: ACrzQf0AZ47gHxPIdmYrcYlE5uSaazD//lmbxF1Pxy9qs/F+ZIqO+bXC
        3FKAxpTCCZMTJJ5/PfFXmC6W3Q==
X-Google-Smtp-Source: AMsMyM6fBnWKqL2m8+7OmLJdVQRJBD+PLD6fsTbPQKaR/ZodrumStMsrSZTw2rU8z7gB/eEeIjRerQ==
X-Received: by 2002:a05:651c:210a:b0:26e:ea0b:26ad with SMTP id a10-20020a05651c210a00b0026eea0b26admr1445510ljq.149.1665341843459;
        Sun, 09 Oct 2022 11:57:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c10-20020a056512324a00b00492d7a7b4e3sm1122940lfr.4.2022.10.09.11.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 11:57:23 -0700 (PDT)
Message-ID: <b2bdf59e-abeb-2828-ae05-8cdb34c27c9c@linaro.org>
Date:   Sun, 9 Oct 2022 21:57:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 07/10] drm/msm/dsi: Disallow 8 BPC DSC configuration
 for alternative BPC values
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185150.461323-1-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185150.461323-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/10/2022 21:51, Marijn Suijten wrote:
> According to the `/* bpc 8 */` comment below only values for a
> bits_per_component of 8 are currently hardcoded in place.  This is
> further confirmed by downstream sources [1] containing different
> constants for other BPC values (and different initial_offset too,
> with an extra dependency on bits_per_pixel).  Prevent future mishaps by
> explicitly disallowing any other bits_per_component value until the
> right parameters are put in place and tested.
> 
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L110-139
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

