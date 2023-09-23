Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A18ECE7A88
	for <phone-devel@archiver.kernel.org>; Sat, 23 Sep 2023 19:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjIWTZd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 23 Sep 2023 15:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjIWTZd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 23 Sep 2023 15:25:33 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817FB197
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59c26aa19b7so48120067b3.2
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695497125; x=1696101925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=DlfYuI5aGglWeu/+eBC0xwDAVUpKuie/z9nXzJ/nnqYKlx14qw0kjlf06AKAdQp/Ny
         rxkioxZ4J6Jmka5r/+889fxTKMai5aI21JP0MZfv1Vm+221dMOM6tylkpuP6tdyosFhh
         OM4CSpVx4V9PqDMw/bBUP+ZgTmlXdqN7kVQUw5e0diqhppLoaU1S/F0AVJBdbjKX8CfY
         1v4AhEu7imk722Zoz2aXGQqLR4pUMfhq6RJf1+A6U43/zzJQnBdetwhE53VYURh7ntx5
         ufq8Cle/r+s45ozuR+uQASts9gSZn3/zKyb6fecutdorudCcT6VsCU/h+00qFBjQh6/z
         LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497125; x=1696101925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=GSwKqHDuQXZxzkboawTlJDhcH8ZoYFAjtvvmgRbFnBmLmju/Bzvzw5L8ksKtbNbNjO
         x3EonKq+CUf80id2115mG249z2TnIaxP2DGifE5tmxmrbbG9rZ0G6SgulkOoY9BcP71k
         wL8HBBR8+5FuF4apSOosGJ0ByWAxXrY2k09VB+boiYf9Z+JAIeXaL+UO8+o1sdOlkj9x
         +pQsA9oq5KtxjYEN7/EBXv7xk/yNnt7X21si9NUQwhWkwYc7vCgbF3m2ZWkR6smezDr0
         Ea9qVnwTE6GF4nTz4+ZBBuC5fWL/K+vm0gWYhrq8MbKihe7jdR2HepYY0x3qzcW1Y4di
         jbSA==
X-Gm-Message-State: AOJu0YwXnDPV9LSQrxBGFPEWUNoxWJxuBCLlSGFbU7+Fw3VzLemREZBR
        X3+Xx+mko9U4BOtjicwyk4kY6UaJKyU5hQhmAxFQChtGySk60LjObvYgcw==
X-Google-Smtp-Source: AGHT+IG3UL8gjMqkSV9UZreXyPAOKYXw7SQBs9BVE5PjxhebQt4h+VQhMShs+JNFq9ZQ13DzznAVw/do8m3GfWdF7oA=
X-Received: by 2002:a81:6907:0:b0:59b:be67:84cb with SMTP id
 e7-20020a816907000000b0059bbe6784cbmr2608480ywc.26.1695497125756; Sat, 23 Sep
 2023 12:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz> <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:25:14 +0300
Message-ID: <CAA8EJppafz38Wp7CUQGyxLoacO0kXexgyJyA27M38gS104Z_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: msm8226: Add blsp_i2c6 function
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 22 Sept 2023 at 19:56, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On GPIO22 and GPIO23 there is another I2C bus. Add the function for it.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm8226.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
