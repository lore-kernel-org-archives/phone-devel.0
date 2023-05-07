Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F198C7EE26
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 22:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjEGWtY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 18:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjEGWtY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 18:49:24 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629B55261
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 15:49:22 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-55a00da4e53so70208117b3.0
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683499761; x=1686091761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIFWcITnES4kO3k5Am147YdQK59kPsgWed9C46TTqwc=;
        b=dJkQEOmkAvSu1nEqxOAKAYKOSOp9qaVFsiupZkwk1wMzwyHeamA3opCnH93grcjX4Q
         e9o60Jox4/7y/kht7QGWiOKHdcyJt/xIvc+7J8Z8ALccjXpLz6+TMR9UAsI/EIca0p2H
         SmSESABnRzoI8GkupqEh3TsJHzrgjU2CmHCUXy8F0KrzVcdJ+162spSEJxXh1QGNa6vf
         msYEXWBST/UaoHRjMdYP2DKeXD6twop64eMfDLz4QdCNqpD+Lpgk8a2dZmgJZdMkE33A
         EMLbKrcHVNLfsQDHIOWftFEp9vJdFH+TrvfkfVMvD+bUX+0014Z/6ZmU3NmizS+gLY/G
         4YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499761; x=1686091761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIFWcITnES4kO3k5Am147YdQK59kPsgWed9C46TTqwc=;
        b=I/4ZHd2MQJdmrf9iHofULT8/NXpfy0VeoWWqMIOaZo/72I6CGslipwigTv1k5U8cwv
         3igVuh9gwXABuP/V9pxfc0e2c6d5bDynwefEklB/lNkWp2gMUYbr+JTBR4nJOXUtdIQW
         Z59SeXqR/DnoaXEE+43NowEjhnzOJbfRQ6YpHoKKEpdf+EcK5ryCOih8rD2HiDyBmmXn
         QboBHT87is1o39OqQrHg/dZpdRYZOBCh8M5MTeCBI+OeZKqetRM2MgoEkBEUyG8WpU1E
         h72WmoJHdVdJRiu8aj34CW1ZPldLgfX3nL0Lb+lYkHnIwSwZdK/oxKpwhxhnaFlcBmot
         dB3A==
X-Gm-Message-State: AC+VfDyyghr9x2cJki9e7kjHadB6lqutcObJAzdlQ3VOt99K2fmYa4qJ
        uuEaa/RFoCkA+POLtv1Dp6fbYooEcd4kpLIG1Sx01n3EI1799Vm2
X-Google-Smtp-Source: ACHHUZ4vx48X7XD+Su6KTcZ7JqhGg7w4c5CySJnLDf9RYPc6ICNwliEgA02dFk6W8BZ00lVk7mPhVyBDDO8IfPh1auk=
X-Received: by 2002:a81:6dcc:0:b0:55a:1c79:8eab with SMTP id
 i195-20020a816dcc000000b0055a1c798eabmr8830777ywc.32.1683499761045; Sun, 07
 May 2023 15:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-4-matti.lehtimaki@gmail.com> <33d373fa-91cc-2ab6-b59b-34967dff1109@linaro.org>
 <1e02c292-f3c6-f67d-0e25-d22a00bcf6ad@gmail.com>
In-Reply-To: <1e02c292-f3c6-f67d-0e25-d22a00bcf6ad@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 8 May 2023 01:49:10 +0300
Message-ID: <CAA8EJpqhaQhuhYpZwAaobCTGONMMo5g3bCmPh2117jan72kRzg@mail.gmail.com>
Subject: Re: [PATCH 3/6] thermal/drivers/qcom/tsens-v0_1: Add support for MSM8226
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 8 May 2023 at 00:11, Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.co=
m> wrote:
>
> On 7.5.2023 23.40, Dmitry Baryshkov wrote:
> > On 07/05/2023 23:12, Matti Lehtim=C3=A4ki wrote:
> >> The MSM8226 TSENS IP has 6 thermal sensors in a TSENS v0.1 block.
> >> The thermal sensors use non-standard slope values.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Note, the driver from 3.10 also provides custom data for non-calibrated=
 mode. We can either ignore that (in the hope that all devices leaving the =
factory are calibrated), or fix it in the manner close to 8x74.
>
> That is true, 3.10 kernel does support non-calibrated mode. I can add sup=
port for that in a new version if that is wanted.

If there are no other comments, I'd suggest sending that as a follow
up (if sending it at all). The tsens driver provides some default
values for non-calibrated mode, so it is a minor issue.

--=20
With best wishes
Dmitry
