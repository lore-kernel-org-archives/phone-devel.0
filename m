Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B8EE810B1
	for <phone-devel@archiver.kernel.org>; Wed, 27 Sep 2023 08:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjI0InO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjI0InN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 27 Sep 2023 04:43:13 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D3AC0
        for <phone-devel@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59c0d329a8bso131087067b3.1
        for <phone-devel@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804191; x=1696408991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=ttxs85YMPPlc891Jam9KQgtHLayUWR9Y8PTt9jjRiyfrzIc3ou/w/TM2pwe3w+c6Zy
         BRfu3Qhap3uw/i7IISn6kNQoO54OXPyiouk248Dhb2zqRz3FzK6c4V6f+jiX22I/14ep
         os1MxLf9tYs2kbEwNIjiTD9gfSnvR5lP/xwPRL3+KuIAshXxqH95yJqKYoH2hJhPgCIx
         w6V+XoYbzGnw3hM5Do+NT8eOZV+wRO7lKHEHXv3GJyB3/bgm/PBtjO83XieBntqGBGgJ
         HwYUNxqL6XRLx+n60pRXrYk+qiVxlS+Md1t5U56Np5VzCZVIbyvxU+FjP3YmDgzNGi7+
         Dgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804191; x=1696408991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=uPZWaSR7+J52Rti9RDs+VJMr7BeCgZZEQPaypGMxNKxnsCFuO8vw5MoGRlVUr5FO0C
         FZbNUJueg04UxsVrzaFlNigsDom8BnEmL6V93qhY83SqWuXciaVrtFDUUdoPJZhrPfnW
         McYeL/uEdM+TgM+C4aslmZV/tROiCfhSzBDqGlpgR1afcsC5FpWy8o7Jf6MR1nnP2OSy
         dZbiW89CQEbut1pRBBz19h6XA0E/3+mzt13AtRXX9Eigs90kF3cUGXxgmegEo0MVYRFY
         RPuS56YTQEprpTB7lFdcqgnquVddEsYajQTcHhpwopI9ltv8i57T/j/WiUGWRSLVCJeT
         ul8Q==
X-Gm-Message-State: AOJu0Yyic0NBK1gZMtlW+V4U31L3eBDm8W9paXfjZ5rkn4YnYyZM4Jqc
        kGFSMyG9lMV7Oh0ZqtuHIZJpnjwgxPepFGL7KW9g1GxkjlBzER99
X-Google-Smtp-Source: AGHT+IGARZ/ws1fRu2Yb4a4UQx44nHbRJFszxMdFAdC60oItaObm/kXlaW74QXdyzbXLViFp8x3ekZb9MDLlCcs2TJI=
X-Received: by 2002:a81:5d87:0:b0:59b:cff1:a8eb with SMTP id
 r129-20020a815d87000000b0059bcff1a8ebmr1698986ywb.34.1695804191087; Wed, 27
 Sep 2023 01:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:43:00 +0200
Message-ID: <CACRpkdZHjsm8HLg9B1KYHnhstcjwd18r0bE5GF0_Z4EqcuAWWA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add blsp1_i2c6 and blsp1_uart2 to MSM8226 SoC
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Sep 22, 2023 at 6:56=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add the I2C bus and UART interface found on the MSM8226. For the I2C bus
> we also first need to add the pinctrl function in the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

v2 looks fine and ACKs in place, so patches applied!

Yours,
Linus Walleij
