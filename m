Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5D1C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 28 Nov 2022 12:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiK1MpB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Nov 2022 07:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiK1Mo6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Nov 2022 07:44:58 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5057F65F3
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 04:44:57 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id d128so13101833ybf.10
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 04:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x5L92L6sWI/+mEWBmBL3DtHPyW1jrzK/QlQTZzSwQBI=;
        b=Mygr6yQSUM5fS8H6tqebwAnMYYMV5asAEjAdIHLZWUuRsaaJh47JXIwLyq6w7kU9fH
         Dx8VY3uEtrRnPXOExf0PqEUZygw09IAuWk1vo9KEXrTEPkE5I5jNBlzcGOz7e3m6Z/TB
         qSIphXTQSA6T0gWAZoPOKVkMyaxj+QZlVMiznxElGNykjYLe00WkX3JDBxOTJ/F4KUGr
         E0dF2hVqVTZohzaqRjaqdFfnRS8fJMzUlFdSoTuNnxPetqNtaXGqJ8k2VRz2+dOmDJn2
         VDHTKCXrC9KdovNkpJnr9YnumkZBZfiF+dV2zXvMYXkpqffwCCVErvSgl+vi6F+Mluor
         W7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5L92L6sWI/+mEWBmBL3DtHPyW1jrzK/QlQTZzSwQBI=;
        b=eFwZ0HX6JUI6tajlaJ5XOg9SokzKk1mK77CqM2GAALu2HsB9eLB9MbCRmBGTvKdeq+
         hMyOzHoDZmflUfjjBNiCWzPqA3J2ztvdglaOiSUFFUvo3OtYgyJRKyf9ulmExWfxO8qA
         b7/5M0movssvL3O04zIY2Kwi+J0DC1K2ltudUe964TbH+rCaJbZJM/qjlw+Bq5AFMum5
         6Z7qzi4pQoBpbkpsopS/6pBa2WHdBunk1puYP9PoxYvAH1ksI/ph5odmU7qzFKht9TOE
         ylLWLOTrn93aiRWubH08QUM0fl+Iyd+wDv5npxR2aIRNPU6wDWMbrwaCR/k0ePWxbEy2
         7EeA==
X-Gm-Message-State: ANoB5pmtAl7N6TXvDDW2bOkednhu2V5+XljZQ/KrBGcPYksbwVpG3qxP
        sqm4SjphGv20Se8KcIv46tdpRwSc7tkN0kLgNCXhBwG89cM=
X-Google-Smtp-Source: AA0mqf5Sn4jHKFKdQcFa691WYR9rNCynIRXa9CGR9ccLIcawSxkCvfobdAo43wTafqOGnZNywSN2TTxO5daqjB41s2s=
X-Received: by 2002:a25:910c:0:b0:6dd:ac4a:65e1 with SMTP id
 v12-20020a25910c000000b006ddac4a65e1mr48492491ybl.288.1669639496489; Mon, 28
 Nov 2022 04:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20221127181835.806410-1-luca@z3ntu.xyz> <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
 <f0a15b01-81b6-5c73-6c35-ce3a8c71b4ad@linaro.org> <CAA8EJppEXpv-wVAAXhZ6NiPzDGzP+evnKrT=an5esOx610D+dw@mail.gmail.com>
 <f6bb5759-453b-fa05-c6e1-f1d57abeaffa@linaro.org>
In-Reply-To: <f6bb5759-453b-fa05-c6e1-f1d57abeaffa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Nov 2022 14:44:45 +0200
Message-ID: <CAA8EJpofyGs=OEvDB5vx_odJBYHMCsry09PnjgH86bfsyo63jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 28 Nov 2022 at 10:34, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/11/2022 22:43, Dmitry Baryshkov wrote:
> > On Sun, 27 Nov 2022 at 23:30, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 27/11/2022 22:25, Dmitry Baryshkov wrote:
> >>> On Sun, 27 Nov 2022 at 20:19, Luca Weiss <luca@z3ntu.xyz> wrote:
> >>>>
> >>>> Document the OnePlus One ("bacon") which is a smartphone based on the
> >>>> Snapdragon 801 SoC.
> >>>>
> >>>> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.
> >>>
> >>> The patch itself is good. However it raised a broader question for me.
> >>> Up to now all msm8974pro devices use qcom,msm8974 as a top-level
> >>> compatibility string. Should it be changed to use pro-specific one
> >>> (e.g. qcom,msm8974pro)?
> >>
> >> Yes, makes sense.
> >
> > Would you make the patch?
>
> I do not plan to. I don't know which ones are Pro which aren't.

Ack, I'll do it then.

-- 
With best wishes
Dmitry
