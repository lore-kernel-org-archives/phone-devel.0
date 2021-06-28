Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E5BC2B9F4
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C5E361997
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhF1K1B (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Jun 2021 06:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbhF1K1A (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Jun 2021 06:27:00 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FB6C061574
        for <phone-devel@vger.kernel.org>; Mon, 28 Jun 2021 03:24:35 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id 68so9719487vsu.6
        for <phone-devel@vger.kernel.org>; Mon, 28 Jun 2021 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPLEcGPfjTrWT2dr8vH010N56qdMpU9fICCq79L5U3Y=;
        b=xRP5SRlsevHlPl1LqEhK7SBshViQBHlzbjF7UehJgT/ua6Awa2MgaLoDgfUxtAR1YC
         hOA9DWODOwQ8bxBlMTW7RTLfpl6ioGOu7c8yb1nDIj/y8AIvjTRT/RoVw2IOAT9uvRj0
         0cnBA7/jMtSZyhQoISaIlq2ah1QHD4f1/QhUWJk4qPo+RCOXZ5S63WRgPYQTUn35CDo/
         ylvQnLapg5HO2eP/y7MdmqUYBdmNeo3Q1l06aKceWR7//d5ld5jTfuMex8soPJE6aynN
         fPZXJJxK0OxfrNmqV+Qhe08yrznKemcjE6mYU12YRMn0iPR3GGWrejSPalfQIi3KW5G7
         yFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPLEcGPfjTrWT2dr8vH010N56qdMpU9fICCq79L5U3Y=;
        b=tUyh8drT6LLa9HmmtagL5EQ26iP67rmUE6DIg8jquK2h/sN0JMpRmLms1TpHMxvUTf
         Hx6IiS0zDG4fSyWnOIBYJcyrdswCyXaAGhFjb38RSilRuvreICbu86KlFjXgMtBfPI0i
         CuIZEFVLt1ODnt4CSR/CIAvHvBMKQU+TYuZFycHjqiWhfdHek/+wLpL2vxWnIOk+CpPe
         dDxTOGTOad7w2HPwTHBJ12yI9MnwqnjVFL0TJUsM7bHyaUk0JKWNYekF4tp2jrLDYrPj
         sQk6xqb+YN5au8OBFYcPS7dzq6uQTfperiAIVKTUhzm5SQGe30n6RShirdQ93X6J54bR
         fsMg==
X-Gm-Message-State: AOAM5311IRqvzsRdcNJ9oMhxjG15g+5ioD8l1YZmxlqZ1zePXt9boOzY
        2oqPL9SZCTySRItZa2hgATdFfFg9hyVykOoHUGAq+Q==
X-Google-Smtp-Source: ABdhPJxuQjLT5lcw56AOp4E5UaAlaA7WMZMSf32+rNiyAbNaDekxWIuIj/rm1FYxnNJ7v8CQhQbCHEfQ7yFP+dnlwjM=
X-Received: by 2002:a67:ee54:: with SMTP id g20mr9868378vsp.55.1624875874444;
 Mon, 28 Jun 2021 03:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210624091927.2432809-1-linus.walleij@linaro.org>
In-Reply-To: <20210624091927.2432809-1-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 28 Jun 2021 12:23:58 +0200
Message-ID: <CAPDyKFrLOR+hYu4UVU3J0bo6SBAQkQ_-7_fa1V1TR_GKzkZ6rg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Flag eMMCs as non-SDIO/SD
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 24 Jun 2021 at 11:21, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> We use the no-sdio and no-sd flags to indicate that these eMMCs
> are neither, so that the operating system can skip trying to
> identify them as SDIO or SD during boot, which just takes time.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/arm/boot/dts/ste-href.dtsi                | 4 ++++
>  arch/arm/boot/dts/ste-snowball.dts             | 2 ++
>  arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 2 ++
>  arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 2 ++
>  arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 2 ++
>  arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 2 ++
>  6 files changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
> index 7566b4963ef6..9c37af433400 100644
> --- a/arch/arm/boot/dts/ste-href.dtsi
> +++ b/arch/arm/boot/dts/ste-href.dtsi
> @@ -156,6 +156,8 @@ mmc@80005000 {
>                         bus-width = <8>;
>                         cap-mmc-highspeed;
>                         non-removable;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&db8500_vsmps2_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc2_a_1_default>;
> @@ -171,6 +173,8 @@ mmc@80114000 {
>                         bus-width = <8>;
>                         cap-mmc-highspeed;
>                         non-removable;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&ab8500_ldo_aux2_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc4_a_1_default>;
> diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
> index 40f1d7c9c1d4..934fc788fe1d 100644
> --- a/arch/arm/boot/dts/ste-snowball.dts
> +++ b/arch/arm/boot/dts/ste-snowball.dts
> @@ -267,6 +267,8 @@ mmc@80114000 {
>                         max-frequency = <100000000>;
>                         bus-width = <8>;
>                         cap-mmc-highspeed;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&ab8500_ldo_aux2_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc4_a_1_default>;
> diff --git a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
> index 251a393f8528..fabc390ccb0c 100644
> --- a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
> +++ b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
> @@ -378,6 +378,8 @@ mmc@80005000 {
>                         non-removable;
>                         cap-mmc-highspeed;
>                         mmc-ddr-1_8v;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&ldo_3v3_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc2_a_1_default>;
> diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> index 40df7c61bf69..ee6379ab688c 100644
> --- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> +++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> @@ -145,6 +145,8 @@ mmc@80005000 {
>                         non-removable;
>                         cap-mmc-highspeed;
>                         mmc-ddr-1_8v;
> +                       no-sdio;
> +                       no-sd;
>
>                         vmmc-supply = <&vmem_3v3>;
>
> diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
> index 25af066f6f3a..a0e87046f1da 100644
> --- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
> +++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
> @@ -420,6 +420,8 @@ mmc@80005000 {
>                         non-removable;
>                         cap-mmc-highspeed;
>                         mmc-ddr-1_8v;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&ldo_3v3_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc2_a_1_default>;
> diff --git a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
> index 94afd7a0fe1f..264f3e9b5fce 100644
> --- a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
> +++ b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
> @@ -230,6 +230,8 @@ mmc@80005000 {
>                         non-removable;
>                         cap-mmc-highspeed;
>                         mmc-ddr-1_8v;
> +                       no-sdio;
> +                       no-sd;
>                         vmmc-supply = <&ldo_3v3_reg>;
>                         pinctrl-names = "default", "sleep";
>                         pinctrl-0 = <&mc2_a_1_default>;
> --
> 2.31.1
>
