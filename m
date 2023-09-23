Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7312CCE7A8C
	for <phone-devel@archiver.kernel.org>; Sat, 23 Sep 2023 19:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjIWTkb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 23 Sep 2023 15:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjIWTkb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 23 Sep 2023 15:40:31 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC76196
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:40:24 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d81dd7d76e0so4587431276.1
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695498023; x=1696102823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wT8NcA0y1AMUmWyCInUSAwqrGAZb9JXNryfhTfON+tA=;
        b=lQu1bE6wB1ZLFS44AE8/DfHB6WH/Ev4aPbRTj/2P5Gm05HDF3UD3Z7ZBjxWbg8DwLW
         HB/E4jWa8efN9qm44MmMn+HEOf39C2J/cnX8OKw9DDivzZ9HeSYTY3ImLIQk9rRqxmSr
         VZPOYD4ZMCLn8PVsImbT1hd0Gpj/83ul4QfDxYIppUWoBytXrnFGkY11O2RrwDufbw6I
         xw1xEEYyjL2Yd7Sq60TDzcO1oloVCT9cxX5oud/Ss9ndy8XdIqi2EjteCdfEqcR3L48j
         CM6/SNXHYyxGw45FyuCVCCdUNgokwDYu04uILsvqnOumj/7/L9TwEERrJB5cLtCq5zBu
         m+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695498023; x=1696102823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT8NcA0y1AMUmWyCInUSAwqrGAZb9JXNryfhTfON+tA=;
        b=VWVSaJG7wb9eOly/fOWZ0A/XcZpJ6W1PjoIdR8bIrf35FwF91JQXSQBuRjbtekZwTM
         B3ypCTk+fREpE+rFa/08DffteNgoXmWqIMvekuWvF21Gut/ELJKvq3wNziGb/9L7ql9I
         TnYOvdm4UjQoX9UBHEzhkLd8SO4UIhhqyeJTyUP1yoZDRIzDVbEjHO0sXxJ6wWMgdxYq
         FdykBC9uuB8F7E5ibOJ1UGtYZ4PKNDlgQSgRDd8HS8CPirOXq4tvehv+TuxhIYSieE0u
         99G9qTbmbO74AFbmCUMLHwPEC83QlDIQbtU8Re6MGAMLr5P1RlQTcQyzijsfnNujf6UV
         AZ9g==
X-Gm-Message-State: AOJu0YyfLTpV7lw6bX3cEZtKCU69z82PqWgCQU0Mif0ZqS31CYe/Ia6V
        cNsZk5W1uLTkVJK3kbjsxyb6bLoZFgoFT7E0MCDpOw==
X-Google-Smtp-Source: AGHT+IGt16ZqM8IpsPbAvffNnhzKkeBKUQu3tObLJcRk4eEHrZmw1uF2gtqAHgXcUPdPwsDWctZKSRW6b6W3/2to7Fk=
X-Received: by 2002:a0d:df56:0:b0:59f:3c81:3a25 with SMTP id
 i83-20020a0ddf56000000b0059f3c813a25mr2583549ywe.14.1695498023697; Sat, 23
 Sep 2023 12:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
In-Reply-To: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:40:12 +0300
Message-ID: <CAA8EJppstOof5SQz+fB1gDR2LPK8zs+tqJ99UUrYokZj8Z7J2g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 12 Jul 2023 at 10:53, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Some mmcc clocks have dsi0pll & dsi0pllbyte as clock parents so we
> should provide them in the dt, which I missed in the commit adding the
> mdss nodes.
>
> Fixes: d5fb01ad5eb4 ("ARM: dts: qcom: msm8226: Add mdss nodes")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
