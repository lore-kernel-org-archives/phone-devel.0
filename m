Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F51C433EF
	for <phone-devel@archiver.kernel.org>; Sun, 24 Jul 2022 18:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiGXSoZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 24 Jul 2022 14:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbiGXSoY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 24 Jul 2022 14:44:24 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC48411A05
        for <phone-devel@vger.kernel.org>; Sun, 24 Jul 2022 11:44:22 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id f14so7217551qkm.0
        for <phone-devel@vger.kernel.org>; Sun, 24 Jul 2022 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uqLCtj81FzXR1rhJvIs1w4M+P+JCKpBnNBBvGjMwhkY=;
        b=b5RRwEQx9QQiM2iteB1J9tDEhxTHRFV9M2mhDG+mWfrbuIpuUzbCT2yguT0ZX8Xz74
         mzowjZAAnR0twZciOuTIMIvaNedFOYbmnb30yydFpDsPFXbjV9NoRvRxHUjH4H7ufAkw
         VU1J3nWeFiEyLm6Y1zX4hCfKzvL4s9/jfcDUo3a0ICeZ90PT7jkQEEaU51rbQG99OvMm
         gwCkH9wCz1aOJ05n9BcIBdtm4LvX4Vv7kUOpevhUY/S5E7dpPLoQU+eQpMuFzKq3//RS
         q9DRJNxOt/y2Fq9NCbCERrFQCZCr9z78GLNkJSZM97gY11rCIwaipfRmJUemucK6AgH3
         pzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uqLCtj81FzXR1rhJvIs1w4M+P+JCKpBnNBBvGjMwhkY=;
        b=DbCw5IXrqivod6IV/Z5FrY75SaMlBGf8/Ve6zvwcSACs+DrO7SfOR8MkCNT7WpB02X
         9UnxsT+Z88tUX4zxsbD6DlSc2DUi2LG/EexBe63SGyObMZHS7pXH9SQ0Ymx4cRegOhvt
         KoS/PlTltFlG+dAUmPI7MXrN/4u2PJvKlRNHEkMV+j9aeGHCbReUzYUT3h2XCFV+F19P
         ryiXpnwzeN45o3fro0x+UbFT9FypSmJsZdugLCqoYD/sOFy06CQGyAHKIB86DrkNqAP5
         X2uWFy7XR1mqdSF09gvsf+AAHU9GkjQSykuWU6hSePrLq3ubgQeF8bywPzA18wc3uiQb
         zvtA==
X-Gm-Message-State: AJIora+EYvbdkquEpWthcEbY2UowGFGYLjhs/cGQkX2e/oHWOsae6FtV
        4YSAq/eykHWHv+jaAJSNfU3Jvb0O+cyptTYoXNEzZw==
X-Google-Smtp-Source: AGRyM1vUDgkdDdsy8580QybhfJAvFu+1i9OFoHQ5vdHGHRp/oVSD1FiSHUQDYvIBh9xS6RcwZBGF9eySc2sErRzDKvM=
X-Received: by 2002:ae9:f311:0:b0:6b6:30a9:1bb1 with SMTP id
 p17-20020ae9f311000000b006b630a91bb1mr6795622qkg.30.1658688261879; Sun, 24
 Jul 2022 11:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220724172442.87830-1-matti.lehtimaki@gmail.com> <20220724172442.87830-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20220724172442.87830-2-matti.lehtimaki@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 24 Jul 2022 21:44:11 +0300
Message-ID: <CAA8EJpqwpO3gu4XD8cHju=9avGb-1YGN8r1cHwgLOFVKpOFBrQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: qcom: pm8226: Add node for the GPIOs
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 24 Jul 2022 at 20:25, Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.c=
om> wrote:
>
> The PM8226 provides 8 GPIOs. Add a node to support them.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> (no changes since v2)


--=20
With best wishes
Dmitry
