Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B22C4338F
	for <phone-devel@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96F9460E78
	for <phone-devel@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbhHCX26 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 3 Aug 2021 19:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232515AbhHCX26 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 3 Aug 2021 19:28:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA47C06175F
        for <phone-devel@vger.kernel.org>; Tue,  3 Aug 2021 16:28:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a26so1263070lfr.11
        for <phone-devel@vger.kernel.org>; Tue, 03 Aug 2021 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26XXRzt9dXibTBs8tFcvaSA5rKWccDbOxEz0deahLF4=;
        b=C5cd+9Dun0iDWKDMH2yjUb09Zg5hZvakE2AeBqHmRmFbGfPnUgovMbxcX0YhcEq/Ho
         tD4wB+hJ7Fli0sTLQzk7H499Bd7WdS/GPgAsKHvqvgx3AZlJd1/Ifn1q9t8pMnVM3HIc
         wXact7CixRlJ2m89Yq8OpebQUl62rQTouFEOD7XuMJKWJTbtJEpn7Bgx4VYb/1Vnl4Q4
         Uxw45eY502vRjXPBOJ0LjJevADFGlDvuvjCX07XgmFUeiaD2TMd80vIJZ89De3TIz1nd
         HNlXnwNdhgrsiXsFNEVSAgCQckRjikKdFRpc10M+wu8xvSZ5sb2IR3KrEsnbSuDgFQpd
         7DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26XXRzt9dXibTBs8tFcvaSA5rKWccDbOxEz0deahLF4=;
        b=Ze7+Li5wFH3acOU9LcoKz6mxTPAx+kz4hkYTyNBmkNsPeioWCBIfFtYbA1GZtGHDzC
         /w0PKdJmswguI9DgylEKBl3x6VEHbuwi2KXtma8ZzNwVN1EBjk56PkOv9j7L0u7VhmPm
         e1PzFA6frfzxtG08/u5ubsToJi8Bmdj5pPbCH8LJp4ZdVp7wEE4qRLdrIqHCbWAUZzRN
         PkZGdihHKzW4sS4S6LnZh6nJ7WGEDkUOJREsMFHY4CuukC/RTy8mZWy0GU3gnM6aows9
         FeBtTBabjuaBSOlmMvXtsnbDOKZ3nlQtmKP/m+dt6xAbvVcjYKApa4jy6jdhp+eQeIP9
         1fTw==
X-Gm-Message-State: AOAM533xrM+xIMfVUfezOUBTnywHqB7n4RGa5szvj4ins1+t4CSOwhwW
        7Ge/ckQy8ekHgUQMOrOEyK/HDQNMFyyqCr/IKX3GAg==
X-Google-Smtp-Source: ABdhPJyUZc6BNBI0g+05v2LArwJXGf05Uy0k4jQGGIY7noISjUX1nEzdSTvUisUviEzTga1wB5mdbVNef6eJ2488dMQ=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr6458477lfg.586.1628033321709;
 Tue, 03 Aug 2021 16:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210711231659.255479-1-linus.walleij@linaro.org>
 <fca09928-72a8-a573-a862-7c486a2094d6@gmail.com> <02415358-6635-a974-7682-a721912ca4fc@gmail.com>
In-Reply-To: <02415358-6635-a974-7682-a721912ca4fc@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Aug 2021 01:28:30 +0200
Message-ID: <CACRpkdb1XTaOaMoGYqiVm-mgTfsNjh+zEEKQfObfVuNab8cdqQ@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: firmware: Allow per-board firmware binaries
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-hsien Lin <chi-hsien.lin@infineon.com>,
        Wright Feng <wright.feng@infineon.com>,
        Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, phone-devel@vger.kernel.org,
        newbyte@disroot.org, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, Aug 3, 2021 at 5:53 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> >> +            ret = request_firmware_nowait(THIS_MODULE, true, alt_path,
> >> +                                          fwctx->dev, GFP_KERNEL, fwctx,
> >> +                                          brcmf_fw_request_done);
>
> This return 0 immediately, despite of the missing firmware file. It's
> not a blocking FW request.

Ooops I see the bug. I've sent a patch, please test!

Thanks for finding this!
Linus Walleij
