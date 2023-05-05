Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B07C77B7C
	for <phone-devel@archiver.kernel.org>; Fri,  5 May 2023 11:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjEELsI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 5 May 2023 07:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjEELsH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 5 May 2023 07:48:07 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3881A626
        for <phone-devel@vger.kernel.org>; Fri,  5 May 2023 04:47:57 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so13490416276.0
        for <phone-devel@vger.kernel.org>; Fri, 05 May 2023 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683287277; x=1685879277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTrDr578NC/gUs+uP2wmO3lmiMTZbf+ExeszdD3Ie64=;
        b=gdjOFWB0rJQtDfWkQ/m+bJPGSIdfpovnQm1hHddyO2JAsTJ2k8JmeBWkZMNxtOreo5
         yz2dmkc+q+kKpJSEP3FxkGsDUjh/ro156mjPJld9fACXkc+QKuDG/JuzUtYhW8xnF/cK
         w4D8BhNkWBn6BU9Et/ZU4XN8j1UqAsOuasuc7h7lselpLuPIP4+2ExCGr+SpyLwmUPj6
         kurfgnsQ1cCggIdN7p8euF8x38gurW9VcvZ/oHVquUJ0oOjxB2zB0O3zWyXm2wg43Bka
         sI7Ft7XSmPedDkRkdjJrXptolUmU5hHOnBkmK6TQu4I1ACOIK7FfX71Eb4S9nONdlsf2
         nvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287277; x=1685879277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTrDr578NC/gUs+uP2wmO3lmiMTZbf+ExeszdD3Ie64=;
        b=WCmxuSM9DOJXsb4HWrRUfwLD3j/6+eC6Rkmjm8oSMC/zbBtNAGxQ26EbsIReIjF4D9
         2W3/jv3DMLRuBB7eFq5HjHPJzhaPxppxKUHAr4HbRyO1d4CBwn4tGCkxgODFKKXZdiTU
         /XR9jxHMJbMMnFwO863rYPe61Qne0vuLG0mo5oPx+cIb/cGjB5CsWNHDPVmXCCKCbSDQ
         VUEaqznzRxxAbDwD7vWMt0fz5aIlWRzI+OeHMp+pLs16R6oqWbghREh3+CL6PI3P5zPw
         SqqbqaojRUYrRSWaNPPWug2p+0OhqjwxTZzw2rnKaLW44zU3fYuHXDMrUQ22iJnSx8tw
         nAMQ==
X-Gm-Message-State: AC+VfDyxveX5sNMGqNp8H9mGElPPSV2+KJ3JsIvuCpmLsM1/MRgH81RZ
        /vysfIeTQ0nh5DkbQAKilGUYp62r/9wl0jsD8fceAg==
X-Google-Smtp-Source: ACHHUZ6qLucPfOToq2ZiafgJxgEH2Or1H88xpEit426pg7gmpbrD7FsAXIVqXhMYKCgcXL+Y5Knwm/tvbtkRVbglMvQ=
X-Received: by 2002:a81:4895:0:b0:54e:ac2b:8a8c with SMTP id
 v143-20020a814895000000b0054eac2b8a8cmr1202981ywa.24.1683287276846; Fri, 05
 May 2023 04:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230421-pm8953-gpio-v1-0-3d33e2de47e3@z3ntu.xyz>
In-Reply-To: <20230421-pm8953-gpio-v1-0-3d33e2de47e3@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:47:45 +0200
Message-ID: <CACRpkdbSFgGOXUUWw5m0SM48uNispuYUckiF5Fvuije6pAtX1A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add GPIO support to PM8953 PMIC
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Apr 21, 2023 at 11:56=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add support for the 8 GPIOs found on the PM8953 PMIC used with msm8953
> SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
(...)
> Luca Weiss (3):
>       dt-bindings: pinctrl: qcom,pmic-gpio: add PM8953
>       pinctrl: qcom: spmi-gpio: Add PM8953 support

I applied these two to the pinctrl tree for the v6.5 kernel cycle.

>       arm64: dts: qcom: pm8953: add GPIOs

Please funnel this one through the qcom SoC tree (I think Bjorn
will pick it up else poke him).

Yours,
Linus Walleij
