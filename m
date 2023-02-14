Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E06C05027
	for <phone-devel@archiver.kernel.org>; Tue, 14 Feb 2023 12:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjBNMcy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 14 Feb 2023 07:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjBNMcx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 14 Feb 2023 07:32:53 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1160F6EBD
        for <phone-devel@vger.kernel.org>; Tue, 14 Feb 2023 04:32:52 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-52bfa3dfd95so204196807b3.9
        for <phone-devel@vger.kernel.org>; Tue, 14 Feb 2023 04:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxKCQRN8kliMAds7bxWTjhzMHLjHvEjXGywgi7rr6WQ=;
        b=rDAO2a38P7zgbx3Y2kJ3cH2rJGvgmDUtI0kxkXaLWSE8wUnGuoVNMk75UaizZ0MRld
         2lKNqohuKqTYlQYOylf9VEZNma/yc1FDnQhDCTvnsZML7p7u9hndmVlWZ/wP6rRAjSoF
         q8H20DJI5ndfFdULUU0WdpatDZ5pHlaXTwNGzNW3qrN6IXTGcQffw+NM/NlbX8HRa+CM
         rAQVSEKkV436220SmU1TeyciTKg/oWERjAVwqME1oSH9J0Iv5CSouGCqlzhrnk/OTEGp
         i93wmZTWZxLze5M+/EYeLpggNjjGY9wKL9uQZudgpHzUETAMxL6kW/dGmF45egSLKLnH
         +QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxKCQRN8kliMAds7bxWTjhzMHLjHvEjXGywgi7rr6WQ=;
        b=SBqI/ONs/IPfCwzG+Q+hWwoL85idY/IanhrB6wmxmDmFFm8n80aXvZgFwbA9a/0squ
         weRZ/v4rxr9Ij0cjXqycmQSdEQh3BWBUJjjtLLK33wjMc9s+8xD8wMbHdYMR9+Tt8gte
         924gYilLKwPH4RbD/5/4LLJqUzE3lcdoCrWcHTWhBFnXGmmCftRvw0EgJl+io4RigfuY
         jxJ521LzbOXNXFkFC4yUS2/8X9R7SBRRzi9QykTs/i93mOofyxAglGnMv3or0cAjeZLe
         hAhWdA83xD6NB2u2F8S6By7MShn1oVyTIbQWDfLxreRKYP+v8tYlYx1yaEcIxOgZOnBV
         efBw==
X-Gm-Message-State: AO0yUKUlg6JyeHbwnDty7wr2t8JgKLTEMSKlnIWXZ9JwjqFo9qi8Zw78
        NBzvoeTVz4rrLQ7SABh0HBYfox/i/Qrh7cxMaSmUGw==
X-Google-Smtp-Source: AK7set+00u4h+tFkq8Glzv8b9Z3L7I7jdWbbm+6ltv7HBmZJJqJvtilmdl7vCzM+yNUvcFDoJrAKD3a0h3t/rRZSoMU=
X-Received: by 2002:a0d:cc8c:0:b0:52f:3c7:e64c with SMTP id
 o134-20020a0dcc8c000000b0052f03c7e64cmr236460ywd.503.1676377971221; Tue, 14
 Feb 2023 04:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com> <20230213-sm6350-camcc-runtime_pm-v3-1-d35e0d833cc4@fairphone.com>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v3-1-d35e0d833cc4@fairphone.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 14 Feb 2023 14:32:40 +0200
Message-ID: <CAA8EJprzOLuLU8_tvRtQ9bX8M9xOqMFFnjuj-DwGz+24XPAQFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: camcc-sm6350: add pm_runtime support
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 14 Feb 2023 at 13:01, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Make sure that we can enable and disable the power domains used for
> camcc when the clocks are and aren't used.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index acba9f99d960..fc5532e2ee5b 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -7,6 +7,8 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>
>  #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> @@ -1869,6 +1871,19 @@ MODULE_DEVICE_TABLE(of, camcc_sm6350_match_table);
>  static int camcc_sm6350_probe(struct platform_device *pdev)
>  {
>         struct regmap *regmap;
> +       int ret;
> +
> +       ret = devm_pm_runtime_enable(&pdev->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = devm_pm_clk_create(&pdev->dev);
> +       if (ret < 0)
> +               return ret;

This makes me wonder, what is the use for the pm_clk in your case? The
driver doesn't seem to use of_pm_clk_add_clk(), of_pm_clk_add_clks()
or pm_clk_add_clk(). So pm_clk_suspend() and pm_clk_resume() do
nothing.

> +
> +       ret = pm_runtime_get(&pdev->dev);
> +       if (ret)
> +               return ret;
>
>         regmap = qcom_cc_map(pdev, &camcc_sm6350_desc);
>         if (IS_ERR(regmap))
> @@ -1879,14 +1894,22 @@ static int camcc_sm6350_probe(struct platform_device *pdev)
>         clk_agera_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
>         clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
>
> -       return qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
> +       ret = qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
> +       pm_runtime_put(&pdev->dev);
> +
> +       return ret;
>  }
>
> +static const struct dev_pm_ops camcc_pm_ops = {
> +       SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver camcc_sm6350_driver = {
>         .probe = camcc_sm6350_probe,
>         .driver = {
>                 .name = "sm6350-camcc",
>                 .of_match_table = camcc_sm6350_match_table,
> +               .pm = &camcc_pm_ops,
>         },
>  };
>
>
> --
> 2.39.1
>


-- 
With best wishes
Dmitry
