Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099A9C433DB
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA38207FC
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391343AbhAZOyc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405809AbhAZOyF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jan 2021 09:54:05 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C66C061A29
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:53:25 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id v24so23083332lfr.7
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2FZjycms5gnBCIpvZP+ctIDCiLaUF2g3Z9pOjKVsdC0=;
        b=YC1EV9dV4gLXUfWerPjvjrjQdSJ+wwfVBcUDEIaM0flplCFVLxlAChsv3hzwWoy7iz
         Hi0S30M8VFmQ8BsE4iPn7f80s/c66XPGgfA2t01Mjh484dbNXrOpb2yVjTqtAWqQ8cRk
         mJPIODGZR5ngh8wJEIT1rYkNxEj7xy4zsGH23iGkEgzlXHb4YaNKMTbsEVlAIrHaH4hL
         p6GCSBNLjPJML3NJMc4PO7Ae3TbHCp5XPliFMWLGLT4LLDMNDN2snpJhaqoqZRs6RmuQ
         0+eMcBEjfyuknWpS8iMeqRNP3VFSQbHl0Yxb4FuYt/+hFHftJxrFFgZzJHMVB5HPhr3d
         slSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2FZjycms5gnBCIpvZP+ctIDCiLaUF2g3Z9pOjKVsdC0=;
        b=f0nvWxmVdW4SYbIPnUf+Ya3rQwxGVSadnFcTCz7W5fTt0OadBoX0CaZS+8gzxHRO47
         bRNJyr/kogESt9agqZwjx36J6vg///muwpcafCD8RcSRlNn7CcuSm3Yqii5zuXoAB0qy
         uSenAEOUc2H3x4WDno0y/AjRwlgPO/B/RSaCIPbpHAdBMyWrk/DvcWatu/cKL+dm9Mu6
         vh2y5yd3qSbyXljOfq70Ij+D4J3iJ5cO1SDDXHrJHEioBpPU/JRHKZCiMYa8oLDmZCOx
         PeukQ30/u51zE3iSTZ4L6NW1J9dgZn/fzUA3oPxcXuRpTn6ET5hlfZZgEJpPxHCQr7j1
         OyUg==
X-Gm-Message-State: AOAM531OhyY8aBz/Ply0tSDXjq3zbkwUkqlgg9Pufj+4EDNZjiwhWhMV
        e8yaWT1Cmq4Ivj2BwKcvLCrPN4sZj2TbNyAK4BQ6Lg==
X-Google-Smtp-Source: ABdhPJyaXqdBSRbne+mx+lif6Cq8WwZOJakN0nseaAW1Q7KoMw1ocidpAn9dDfM8IO/W87GNbGvCW6b3/uPSuBZrfGs=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr2653252lfh.649.1611672803601;
 Tue, 26 Jan 2021 06:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20210115171115.123155-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210115171115.123155-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:53:12 +0100
Message-ID: <CACRpkdZ46OSTNited84091XzikVA9HFncmrX_iXZ62mGUJEmVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Jan 15, 2021 at 6:11 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied.

Yours,
Linus Walleij
