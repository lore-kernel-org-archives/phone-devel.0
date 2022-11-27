Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBCAC47088
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 21:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiK0V0N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 16:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiK0V0M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 16:26:12 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A51DF61
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:26:11 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id b73so11144311yba.4
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HgkwP5Gr80kx+eoGWhH3ysjp0qUkMA9X8iHdrpzsq2s=;
        b=OKJQqp4VyiAfqlu0X5PXSQ7tpF2LJEPqnDmcSV4+/9rQHlkzRgaRCFw04przmQqUQM
         7+lA5rG1+pKUHVZLEexCqV2RTWphTRQPnDu+03bYgismKtCixMntR1a3HhgT8Mg0QyHC
         z275aSefj99qRFPPmsDk/ExOf/+dkzGNgTsyxVkvR3R6NbDCfUIFbCZ+7+K6SrDEXeq2
         Juj69zzXZR0ha78JwDjocolxL0zYruk0oQm71Qz+CQiBYOxA77y+fP/4DtztvBtcR8v9
         hvAq0Xk7us+CM+h7aw9JteVSfizcXqvU5dH6eBjfxMVLTIuBYj2Td44kCppeIYOjBXil
         bnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgkwP5Gr80kx+eoGWhH3ysjp0qUkMA9X8iHdrpzsq2s=;
        b=WUnRRM612Ci4jv/o2nWlbzGGYZswl/mfm8y0F0FmICO9nl0xuvHr18i6yD3Ec1ZjtS
         2/NenIGa0NV5ZJk2ET/B+cTaHyem7EkfICcrjfOr+jLC+WZlMl8AMf0kGtqKkAyTPhyy
         loGHGvSAMf/tGf3v4JIR0AQ1ykA6GjF7mSDjFyrbjh3ncrqgczKjiCrn8XzWg0ZPmMhn
         9LWRGTGUz0r93mda1tzz2o/2RQCxoSXqsvaPmS461MV/mcK4pSjwqkZkzuMsmh5mjfFn
         55kXh8KlvK4ntQqEJI6u1kdiQrAcQzlNm7Zn5RluQfgDOS0bLp8iIMy2PRUR+0Lvolq0
         q/uQ==
X-Gm-Message-State: ANoB5ply8mAPy5AtuFAGcabmokdVVYlHlH97oACpGr0S2dKWltzRYclW
        7aKuRpz5WbIXHeE1b+j1NTgt+z7Zfae88Nay/uLerQ==
X-Google-Smtp-Source: AA0mqf64g3pQHzizACdiWdG2+InatoZLEaDSdZ1QJS+X5/UwYFgxeO/dIIfDAWFCQz4vo1LXrEjab31B7HV8jsb7a68=
X-Received: by 2002:a25:4282:0:b0:6f2:7d57:e51b with SMTP id
 p124-20020a254282000000b006f27d57e51bmr14291337yba.15.1669584370695; Sun, 27
 Nov 2022 13:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20221127181835.806410-1-luca@z3ntu.xyz>
In-Reply-To: <20221127181835.806410-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Nov 2022 23:25:59 +0200
Message-ID: <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 27 Nov 2022 at 20:19, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Document the OnePlus One ("bacon") which is a smartphone based on the
> Snapdragon 801 SoC.
>
> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.

The patch itself is good. However it raised a broader question for me.
Up to now all msm8974pro devices use qcom,msm8974 as a top-level
compatibility string. Should it be changed to use pro-specific one
(e.g. qcom,msm8974pro)?

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..3d2cc8ae34d8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -167,6 +167,7 @@ properties:
>            - enum:
>                - fairphone,fp2
>                - lge,hammerhead
> +              - oneplus,bacon
>                - samsung,klte
>                - sony,xperia-amami
>                - sony,xperia-castor
> @@ -896,6 +897,7 @@ allOf:
>                - qcom,apq8026
>                - qcom,apq8094
>                - qcom,apq8096
> +              - qcom,msm8974
>                - qcom,msm8992
>                - qcom,msm8994
>                - qcom,msm8996
> --
> 2.38.1
>


-- 
With best wishes
Dmitry
