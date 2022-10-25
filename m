Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8441C38A2D
	for <phone-devel@archiver.kernel.org>; Tue, 25 Oct 2022 15:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbiJYPnm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 25 Oct 2022 11:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiJYPnm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 25 Oct 2022 11:43:42 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C53858DE3
        for <phone-devel@vger.kernel.org>; Tue, 25 Oct 2022 08:43:40 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id o13so6997923ilc.7
        for <phone-devel@vger.kernel.org>; Tue, 25 Oct 2022 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sd/PK5OlpobQgWTMERaVRbuer0UWyOazQwPUJRB+kec=;
        b=febl1GAQxbCnrmWYZ8iWEaUO4euPKUJehHb8WcxSG/hPfrTExjhi6VGaDW1gFEs8xD
         jC8UxbBaWQckA062EHPuUcI/b6f3n1MjaWQAe5ylbgrEs/l9sKW32CZRKM7AqR+EqVkn
         xzK2kDliHThZNnuDW3ts6gi+qneohOUuYc9kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sd/PK5OlpobQgWTMERaVRbuer0UWyOazQwPUJRB+kec=;
        b=M71yNqr96yBvG9L5AfGskx+ckvjEaVKVGCh684ek4wr3MOIYoonY+C6heklbpAnKgx
         nO02PzLwjKeX2eSeGlp2vUuvtQPaa9Pm/hIgAy1iW5iSb76Ibx7xETObgNg1f3Vs+9y3
         IfA6Pu4nCo31m3l/LNwpH8LaEkJWes5AJyHuz5lJK+O5X4H4iUCgWwjpdp8IBu8yLWu5
         vG9iScGR3+4Q5Qx9AumGLoZtSbyymyBuF0juoo91Bmonh2LgSthV1/IaWVcJIBA3zoSQ
         5PRd8P/b/74Ehs0VUfj2cHXKylcpiXKYzXUaBY5/km7dKKtwaeOqcZYjS3Wx6maFD0dS
         WKuA==
X-Gm-Message-State: ACrzQf1M0xg52K+kPaqz8Yy8+nJwtHoZVWqUDVP8O/VxjR0f/kzan+kK
        B2+SvoO6Srv6orx3P3qKpX0mrQ==
X-Google-Smtp-Source: AMsMyM5tJUEu0NeW97N/uIEqztVjVv8PFNNU1MQsKjEfwoMjhOjkACwR9slmZV1dL5hzwuh2/gekkw==
X-Received: by 2002:a92:dc8a:0:b0:2f9:9675:42ef with SMTP id c10-20020a92dc8a000000b002f9967542efmr24310722iln.130.1666712619902;
        Tue, 25 Oct 2022 08:43:39 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id y18-20020a027312000000b00363af75d0acsm1038186jab.67.2022.10.25.08.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 08:43:39 -0700 (PDT)
Date:   Tue, 25 Oct 2022 15:43:38 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm6350: add temp sensor and thermal
 zone config
Message-ID: <Y1gEKs3fvUYf7YqB@google.com>
References: <20220812114421.1195044-1-luca.weiss@fairphone.com>
 <81ae6a31-1f37-a677-f8f8-2340e37d3a63@linaro.org>
 <CM43WTWNP8MM.3145TGVN4208B@otso>
 <YvaErMmLIQaDolKR@google.com>
 <CNQTKQWNZIH9.61TJWGH1K44F@otso>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CNQTKQWNZIH9.61TJWGH1K44F@otso>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Luca,

On Thu, Oct 20, 2022 at 04:28:07PM +0200, Luca Weiss wrote:
> Hi Matthias,
> 
> sorry for the delay in getting back to you.
> 
> On Fri Aug 12, 2022 at 6:49 PM CEST, Matthias Kaehlcke wrote:
> > On Fri, Aug 12, 2022 at 04:06:47PM +0200, Luca Weiss wrote:
> > > Hi Krzysztof,
> > > 
> > > +CC Matthias Kaehlcke (author of patch mentioned further below)
> > > 
> > > On Fri Aug 12, 2022 at 3:36 PM CEST, Krzysztof Kozlowski wrote:
> > > > On 12/08/2022 14:44, Luca Weiss wrote:
> > > > > Add temp-alarm device tree node and a default configuration for the
> > > > > corresponding thermal zone for this PMIC. Temperatures are based on
> > > > > downstream values.
> > > > > 
> > > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > > ---
> > > > > With this config I'm getting this in dmesg, not sure if it's a warning
> > > > > that should be solved or just an informative warning.
> > > > > 
> > > > > [    0.268256] spmi-temp-alarm c440000.spmi:pmic@0:temp-alarm@2400: No ADC is configured and critical temperature is above the maximum stage 2 threshold of 140 C! Configuring stage 2 shutdown at 140 C.
> > > > > 
> > > > > As far as I can tell, based on downstream dts this PMIC doesn't have an
> > > > > ADC.
> >
> > I don't seem to have access to the datasheet, in any case that the ADC isn't
> > configured in the downstream dts doesn't necessarily mean the PMIC doesn't
> > have one. The PM6150 has one, and it is probably relatively close to the
> > PM6350.
> 
> Too bad :(
> 
> >
> > > > You configure 145 and driver believes 140 is the limit, so it seems
> > > > warning should be addressed.
> > > 
> > > Hm...
> > > 
> > > >
> > > > From where did you get 145 degrees as limit? Downstream DTS?
> > > 
> > > Yes, downstream dts[0].
> > > 
> > > From what I can see in the downstream driver, it always disabled this
> > > "software override of stage 2 and 3 shutdowns"[1]
> > > 
> > > In mainline only since f1599f9e4cd6 ("thermal: qcom-spmi: Use PMIC
> > > thermal stage 2 for critical trip points") this check exists, which is
> > > not part of downstream (wasn't in 4.19 yet), where this software
> > > override tries to get enabled so that thermal core can handle this.
> > > 
> > > Any suggestion what I can do here? Maybe looking at msm-5.4 sources (and
> > > associated dts) might reveal something..?
> >
> > I wouldn't necessarily consider QC downstream code as a reliable source of
> > truth ...
> >
> > > Maybe newer SoCs/PMICs have a different config?
> >
> > Commit aa92b3310c55 ("thermal/drivers/qcom-spmi-temp-alarm: Add support
> > for GEN2 rev 1 PMIC peripherals") added support for gen2 PMICs, which
> > actually have lower thresholds than gen1. From the log it seems that the
> > PM6350 is identified as gen1 device (max stage 2 threshold = 140 degC).
> 
> PM6350 is detected as QPNP_TM_SUBTYPE_GEN2 so gen2 actually. Just the
> log message is hardcoded to 140 degC, the if above actually has
> stage2_threshold_max = 125000 (125degC) and stage2_threshold_min =
> 110000 (110degC) so lower than 140 (basically like you said).

Good to know.

> >
> > It seems setting the limit to 140 degC or one of the other stage 2
> > thresholds would be a reasonable course of action. stage 2 is the
> > threshold at which the PMIC is so hot that the system should shut
> > down, and 140 degC is the highest of the stage 2 thresholds. Even
> > if it was possible, what would be gained from setting the trip
> > point 5 degC higher?
> 
> Based on this, do you think it's reasonable to just set the limit to
> 125 degC and be done with it? Or some other way to resolve this? I'd of
> course mention in the commit message that I've decreased the value from
> 145 (msm-4.19) to 125.

Yes, setting it to 125°C or one of the other stage 2 threshold values for
gen2 sounds good to me.
