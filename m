Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BEC433EF
	for <phone-devel@archiver.kernel.org>; Fri, 11 Feb 2022 00:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346039AbiBKAGX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 10 Feb 2022 19:06:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346019AbiBKAGW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 10 Feb 2022 19:06:22 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6462B26DA
        for <phone-devel@vger.kernel.org>; Thu, 10 Feb 2022 16:06:22 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id v47so20221060ybi.4
        for <phone-devel@vger.kernel.org>; Thu, 10 Feb 2022 16:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6V1dY7qH4XL0CAYuK2Vnpgq4jGgOMChN5apsqSbEVz4=;
        b=I4KkwcTzPrUS5XBCJI5mclWxp/zgGo5+AgOEvrnHlHoZoB9A1klt91o4yKWAgYkr92
         NScV0bFUW+pJxPlfWIgg+G6HQnWRbd1MMGot90IFSMfkJzq2qZZyJGk4Zl876Cu60n4F
         D/n/731FNUlaCnhgn6fjzIILLjhiyldwlz9Sl3/P9rcNYmABUjdR6mz2OIcoEryA4Hop
         3IxObDYSSEez3eHVT0QhkMY0vjTrGGPnlkoRIk/rJoQw7A8hkIr0oxoK5PmtkdgRZ+8S
         p/7ThnZyIEVN3rzhj6HoORXIWDc7k7Oc5RnCUHvqGrxujkXTP3leAkGk/GY+ABX4VFth
         OD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6V1dY7qH4XL0CAYuK2Vnpgq4jGgOMChN5apsqSbEVz4=;
        b=NyGSlZ+vZrTtrH1+af7z6IURzSCV8+r6K6B1oJlQYtz3UgFZtm7tXIiSL1Qmc2GLE6
         Tw9Q87ZIGVflqewt6+N6mPf7uL1vfoETB6ywwhWrtO7WDXNHA96Kzataj9H3r1zpTgb2
         IP/qHxptPAxEfaWyiwvbo3Jst0ya4aSbLUm/incj/ZMt2CH2S+JRp0dV4l20o4ZK63kL
         qwIsknIyaSModRFNSXoAM9IwavNhFf3k+ADIeafKSRx6ylQBvIgh9/z8WjTM1na0ONK3
         trNlNTIsDSSmz3JytwKmjcpb9fsqKNrdab1I0SvLwwcYsfUwXGrLjSSHo1QztYRC3BWx
         JIxQ==
X-Gm-Message-State: AOAM531SV6AWwgUbvlYBZ4cIOaULIa0S6AqzzQKS6CNpnv3CPrJlZKYl
        a4lzfI92aPRXIwYUAohb8RuvWkHIAO+ArbhM1fXS9Q==
X-Google-Smtp-Source: ABdhPJz+jjvVDAMnJAeqVCkF3QOXGnhLDGmaiuRR3lJzsVoxuZ87a7x5HWn4GRjaO1r1yECcDxpqMOwKzaMCxaaBxLU=
X-Received: by 2002:a0d:f903:: with SMTP id j3mr9686393ywf.118.1644537981686;
 Thu, 10 Feb 2022 16:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220112194118.178026-1-luca@z3ntu.xyz> <20220112194118.178026-9-luca@z3ntu.xyz>
In-Reply-To: <20220112194118.178026-9-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:06:10 +0100
Message-ID: <CACRpkdZCdEGdAPXfNsFxN+mH=J8-23Hdq+EXp=uuihwiqjbufw@mail.gmail.com>
Subject: Re: [PATCH 08/15] dt-bindings: pinctrl: qcom: msm8953: allow gpio-reserved-ranges
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Jan 12, 2022 at 8:42 PM Luca Weiss <luca@z3ntu.xyz> wrote:

> Allow the gpio-reserved-ranges property to be used in dts.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
