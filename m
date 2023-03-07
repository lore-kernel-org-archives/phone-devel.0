Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3F0C678D4
	for <phone-devel@archiver.kernel.org>; Tue,  7 Mar 2023 15:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjCGPMt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Mar 2023 10:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCGPMa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Mar 2023 10:12:30 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B868656175
        for <phone-devel@vger.kernel.org>; Tue,  7 Mar 2023 07:07:10 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id t4so11654248ybg.11
        for <phone-devel@vger.kernel.org>; Tue, 07 Mar 2023 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678201627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mZSPJH+f9oWHaxho+XViilCifY5cfExrCLjds8RGXCE=;
        b=Zl1iwFTQ4MzHuEy5euVqmvX3rJVpoJHoWQ0T7JbQffO7j89sJ7HXBpmPIbJec7KGy+
         dtliU7DYJmdu2PNcLBAugFyVpfwZbWFvVvvrz0WrJNeoZrRGAQApRxmyP7zgGLazGqqu
         zZIDGWdH6d3ORb0YQx3OWMpGzwxpV0zZUNQXRo8Z//lGlF1XYhqfrMaNNvrC2CEqzEjO
         Y77E8IQdxUNiYlFZIViCJANRIhM+7hohOtTPrOoRy8PPU/8Vs3oI70Xi1XyKylH8fJ3J
         WGtfZMdTZyXtZWtzOeArMagz7fqB3MqplTkOgkeHlS9sHtypg4NbM76DLzciWbQoTiUr
         liXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZSPJH+f9oWHaxho+XViilCifY5cfExrCLjds8RGXCE=;
        b=XynbFBKS/IIRYsUZ/FeFJM0UsC5929Z3dn5GYKjIsPWh1J3D4bbyEp8FAe3M808U8P
         i+Zu6cWRKMGvbhFPD/y7UpqZuO0RbikqF5ht/ZR9dJ6qCw4CQxjpys8g/MQaMqisE/j6
         bZ6Hh4tk3anwGpLPfzxc4hfV6iYmVJ/DzuPQXLplbfXjpF0RfGPvRIcsgTLkwryldWuY
         E7+9JbyV0CKJ/dHZLrGV9iCLdmIJ/oUkXRBcMMvwrvwdxM3ea2IMkA7h7JnN65lf+NuU
         k///1A7hgtWTMcjooSIn4aHAlAHpPuHjbdLB/RErxrPQwzjxKWUZhDMgKCoAlQIrjEXh
         RcKw==
X-Gm-Message-State: AO0yUKXOBD8coF4NamfPZt99ThW9nbgOcXKo5nDy93zmxEJI+dmQs6Nr
        BIy1r5DBdvLlGj6MUfDwTS0KxtoRey/MuGsURc0ynA==
X-Google-Smtp-Source: AK7set/szA9fTwEGq01jVWq5968zVv7nn5uZGXTMr6CPkT1icZCpZ6kYz52R9ayoCJb2TM4NvSgYXxgeNLdlOn66Dbw=
X-Received: by 2002:a25:7808:0:b0:a4a:a708:2411 with SMTP id
 t8-20020a257808000000b00a4aa7082411mr8646562ybc.10.1678201627140; Tue, 07 Mar
 2023 07:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
 <20230213-sm6350-camcc-runtime_pm-v3-1-d35e0d833cc4@fairphone.com>
 <CAA8EJprzOLuLU8_tvRtQ9bX8M9xOqMFFnjuj-DwGz+24XPAQFg@mail.gmail.com> <CR08JR9XAIUO.3KF8TBTQ9UQP1@otso>
In-Reply-To: <CR08JR9XAIUO.3KF8TBTQ9UQP1@otso>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 7 Mar 2023 17:06:56 +0200
Message-ID: <CAA8EJpotZjNqo72xhNVS+Fq7gbdADVF+tq8Ph4+tnPyO3HyQoA@mail.gmail.com>
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

On Tue, 7 Mar 2023 at 16:54, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Tue Feb 14, 2023 at 1:32 PM CET, Dmitry Baryshkov wrote:
> > On Tue, 14 Feb 2023 at 13:01, Luca Weiss <luca.weiss@fairphone.com> wrote:
> > >
> > > Make sure that we can enable and disable the power domains used for
> > > camcc when the clocks are and aren't used.
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >  drivers/clk/qcom/camcc-sm6350.c | 25 ++++++++++++++++++++++++-
> > >  1 file changed, 24 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> > > index acba9f99d960..fc5532e2ee5b 100644
> > > --- a/drivers/clk/qcom/camcc-sm6350.c
> > > +++ b/drivers/clk/qcom/camcc-sm6350.c
> > > @@ -7,6 +7,8 @@
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_clock.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > >
> > >  #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> > > @@ -1869,6 +1871,19 @@ MODULE_DEVICE_TABLE(of, camcc_sm6350_match_table);
> > >  static int camcc_sm6350_probe(struct platform_device *pdev)
> > >  {
> > >         struct regmap *regmap;
> > > +       int ret;
> > > +
> > > +       ret = devm_pm_runtime_enable(&pdev->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       ret = devm_pm_clk_create(&pdev->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> >
> > This makes me wonder, what is the use for the pm_clk in your case? The
> > driver doesn't seem to use of_pm_clk_add_clk(), of_pm_clk_add_clks()
> > or pm_clk_add_clk(). So pm_clk_suspend() and pm_clk_resume() do
> > nothing.
>
> You're right that we're not using any of these functions in the driver.
> However still when camcc is not used, the associated power domain turns
> off correctly so that part works as expected.
>
> Honestly these lines have been copied from a different driver and I'm
> not familiar enough with the pm_runtime APIs to know what to use here
> without using the pm_clk* and pm_clk_suspend.

Please don't blindly C&P code.

>
> Basically we need, if any clock is being used in the driver, the
> power-domain needs to be enabled as well, and if nothing is used the
> power-domain can be disabled again.

Adding power-domains to the camcc node and calling
devm_pm_runtime_enable() should be enough. Please see how this is
managed for dispcc on sm8250.

-- 
With best wishes
Dmitry
