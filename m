Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341E9C25B0E
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 14:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239058AbiHLOGx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 10:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239059AbiHLOGw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 10:06:52 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4659E7E82C
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 07:06:50 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id j8so2210485ejx.9
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc;
        bh=Pv1Kl4JS+ZMoTNGLHszpnd7VfT3QEgm6cYLyuxdf2mQ=;
        b=ovrc2tsidM2Puk4E7t0O/YjnXHqLxj+xQuv1Ttuai8VY3eJF0YSy0FPL3vorntUW2B
         0QZn6B/Ie8Ofbcepoqnh3FkHCFrw6j/32xfhLo0b7u3aysa4h7i4K507OnTChayDA1+A
         fRCTefwionwJDUlj1Sg+yvkiyDaCM6/ya/2XQR7/8GOlvm3dvQqSwLR9vmTBWLqlmwYk
         fMh6Ts45sPJFmDmDYdjTe3DN9goZ5aZtEbb9xe/38FgBJ/J4JVXxXz0JNjV9Fk/Hdtaq
         qo3lK2imkdAmhxjlKtFpkjM+4DUSHBzrz/70/fCMJCjbXpeB+KqJPC0WKnnYs/xv3AAV
         omUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc;
        bh=Pv1Kl4JS+ZMoTNGLHszpnd7VfT3QEgm6cYLyuxdf2mQ=;
        b=MeDzZEvi8rm62XwlYHthuTJJY4swmBc9xh+7gL7GC0PvYIMG7oYNR5VPSu3JRx7Z2B
         WxJKMOz7ffonDVZsioFFdbhBthju/tQuqqwfV4e6RbO/zXMmPJD9ETBEMB+xi7X+/m6A
         3C9WpDKYoHA4U5wr1GA1pma3dJpgSw4fS1hO5p9XpE2tuLEgUr8CQ8eFcBWp8QdVUfQo
         2g0k/bgNvbhmRxXGbsxJqgzCPmtUuP45HjRu34r+l1V4mws2zUr7aDgOlDwiG6EBiMXG
         Akwn8GJRCV7SZTztRauK4rhfwmfOGGewBXBmyUjtgjVza/CqBSpX/dOlG0MA3XjhqiOS
         kd/Q==
X-Gm-Message-State: ACgBeo0V/Gb1HItP9bMuGvV+vDQrPAqCgpVBCDBAIUee6qY6bGwJQURg
        s5v0GiuXK4gI5B8K4L3UdGKxlA==
X-Google-Smtp-Source: AA6agR6jRgNj+aT1UFQqpNRlUCku/01/4MHvqLsJFEpTOd0bsqzM73svFr8xWsCn2iRCHnaJmzahqQ==
X-Received: by 2002:a17:907:9710:b0:731:67b1:dc3b with SMTP id jg16-20020a170907971000b0073167b1dc3bmr2831119ejc.709.1660313208660;
        Fri, 12 Aug 2022 07:06:48 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id d24-20020a17090694d800b007030c97ae62sm802745ejy.191.2022.08.12.07.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 07:06:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 12 Aug 2022 16:06:47 +0200
Message-Id: <CM43WTWNP8MM.3145TGVN4208B@otso>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Matthias Kaehlcke" <mka@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm6350: add temp sensor and thermal
 zone config
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.11.0
References: <20220812114421.1195044-1-luca.weiss@fairphone.com>
 <81ae6a31-1f37-a677-f8f8-2340e37d3a63@linaro.org>
In-Reply-To: <81ae6a31-1f37-a677-f8f8-2340e37d3a63@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Krzysztof,

+CC Matthias Kaehlcke (author of patch mentioned further below)

On Fri Aug 12, 2022 at 3:36 PM CEST, Krzysztof Kozlowski wrote:
> On 12/08/2022 14:44, Luca Weiss wrote:
> > Add temp-alarm device tree node and a default configuration for the
> > corresponding thermal zone for this PMIC. Temperatures are based on
> > downstream values.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > With this config I'm getting this in dmesg, not sure if it's a warning
> > that should be solved or just an informative warning.
> >=20
> > [    0.268256] spmi-temp-alarm c440000.spmi:pmic@0:temp-alarm@2400: No =
ADC is configured and critical temperature is above the maximum stage 2 thr=
eshold of 140 C! Configuring stage 2 shutdown at 140 C.
> >=20
> > As far as I can tell, based on downstream dts this PMIC doesn't have an
> > ADC.
>
> You configure 145 and driver believes 140 is the limit, so it seems
> warning should be addressed.

Hm...

>
> From where did you get 145 degrees as limit? Downstream DTS?

Yes, downstream dts[0].

From what I can see in the downstream driver, it always disabled this
"software override of stage 2 and 3 shutdowns"[1]

In mainline only since f1599f9e4cd6 ("thermal: qcom-spmi: Use PMIC
thermal stage 2 for critical trip points") this check exists, which is
not part of downstream (wasn't in 4.19 yet), where this software
override tries to get enabled so that thermal core can handle this.

Any suggestion what I can do here? Maybe looking at msm-5.4 sources (and
associated dts) might reveal something..? Maybe newer SoCs/PMICs have a
different config?

Regards
Luca

[0] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/hea=
ds/android-msm-barbet-4.19-android12L/qcom/pm6350.dtsi#126
[1] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-4.1=
9/+/refs/heads/kernel/11/fp4/drivers/thermal/qcom-spmi-temp-alarm.c#251

>
> Best regards,
> Krzysztof

